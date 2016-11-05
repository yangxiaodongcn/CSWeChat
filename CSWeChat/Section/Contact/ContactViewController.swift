//
//  ContactViewController.swift
//  CSWeChat
//
//  Created by 杨晓冬 on 10/17/16.
//  Copyright © 2016 杨晓冬. All rights reserved.
//

import UIKit
import SwiftyJSON
import iOSAppBase

class ContactViewController: UIViewController {
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var totalNumberLabel: UILabel!
    @IBOutlet weak var footerLineHeightConstraint: NSLayoutConstraint! {
        didSet { footerLineHeightConstraint.constant = 0.5 }
    }
    
    var sortedKeys = [String]()
    var dataDict: Dictionary<String, NSMutableArray>?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "通讯录"
        self.view.backgroundColor = UIColor(colorNamed: CSColor.viewBackgroundColor)
        
        self.listTableView.register(ContactTableViewCell.nibObject(), forCellReuseIdentifier: ContactTableViewCell.identifier)
        self.listTableView.estimatedRowHeight = 54
        self.listTableView.sectionIndexColor = UIColor.darkGray
        self.listTableView.tableFooterView = self.footerView

        fetchContactList()
    }
    
    deinit {
        log.verbose("deinit")
    }
    
    func fetchContactList() {
        guard let jsonData = Data.dataFromJsonFile(fileName: "contact") else { return }
        let jsonObject = JSON(data: jsonData)
        
        if jsonObject != JSON.null {
            //创建群聊和公众帐号的数据
            let topArray: NSMutableArray = [
                ContactModelEnum.newFriends.model,
                ContactModelEnum.groupChat.model,
                ContactModelEnum.tags.model,
                ContactModelEnum.publicAccount.model
            ]
            
            //添加 群聊和公众帐号的数据 的 key
            self.sortedKeys.append("")
            self.dataDict = ["" : topArray]
            
            //解析星标联系人数据
            if let startArray = jsonObject["data"][0].arrayObject, startArray.count > 0 {
                let tempList = NSMutableArray()
                for dict in startArray {
                    guard let model = CSMapper<ContactModel>().map(JSONObject: dict) else { continue }
                    tempList.add(model)
                }
                tempList.sort(using: #selector(ContactModel.compareContact(contactModel:)))
                self.sortedKeys.append("★")
                self.dataDict!["★"] = tempList
            }
            
            //解析联系人数据
            if let contactArray = jsonObject["data"][1].arrayObject, contactArray.count > 0 {
                let tempList = NSMutableArray()
                for dict in contactArray {
                    guard let model = CSMapper<ContactModel>().map(JSONObject: dict) else { continue }
                    tempList.add(model)
                }
                self.totalNumberLabel.text = String("\(tempList.count)位联系人")
                
                //重新 a-z 排序
                var dataSource = Dictionary<String, NSMutableArray>()
                for index in 0..<tempList.count {
                    let contactModel = tempList[index] as! ContactModel
                    guard let nameSpell: String = contactModel.nameSpell else { continue }
                    let stringIndex: String.Index = nameSpell.index(nameSpell.startIndex, offsetBy: 1)
                    let firstLettery: String = nameSpell.substring(to: stringIndex).uppercased()
                    if let letterArray: NSMutableArray = dataSource[firstLettery] {
                        letterArray.add(contactModel)
                    } else {
                        let tempArray = NSMutableArray()
                        tempArray.add(contactModel)
                        dataSource[firstLettery] = tempArray
                    }
                }
                let sortedKeys = Array(dataSource.keys).sorted(by: <)
                self.sortedKeys.append(contentsOf: sortedKeys)
                for dict in dataSource {
                    self.dataDict![dict.key] = dict.value
                }
            }
            self.listTableView.reloadData()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ContactViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let section = indexPath.section
        let row = indexPath.row
        //        let key = self.sortedkeys[indexPath.section]
        //        let dataArray: NSMutableArray = self.dataDict![key]!
        
        if section == 0 {
            let type = ContactModelEnum(rawValue: row)!
            switch type {
            case .newFriends:
                break
            case .groupChat:
                break
            case .tags:
                break
            case .publicAccount:
                break
            }
        } else {
            
        }
    }
    
}

extension ContactViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sortedKeys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key: String = self.sortedKeys[section]
        let dataArray: NSMutableArray = self.dataDict![key]!
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTableView.dequeueReusableCell(withIdentifier: ContactTableViewCell.identifier, for: indexPath) as! ContactTableViewCell
        guard indexPath.section < self.sortedKeys.count else { return cell }
        let key: String = self.sortedKeys[indexPath.section]
        printLog("key = \(key)")
        let dataArray: NSMutableArray = self.dataDict![key]!
        cell.setCellContent(model: dataArray[indexPath.row] as! ContactModel)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return nil
        }
        let title = self.sortedKeys[section]
        if title == "★" {
            return "★ 星标朋友"
        }
        return title
    }
    
    public func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        guard let _ = self.dataDict else {
            return []
        }
        let titles: [String] = self.sortedKeys as NSArray as! [String]
        return titles
    }
}




