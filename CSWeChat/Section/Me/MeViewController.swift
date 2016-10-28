//
//  MeViewController.swift
//  CSWeChat
//
//  Created by 杨晓冬 on 9/29/16.
//  Copyright © 2016 杨晓冬. All rights reserved.
//

import UIKit

class MeViewController: UIViewController {

    @IBOutlet weak var listTableView: UITableView!
    
    
    let itemDataSouce: [[(name: String, iconImage: UIImage?)]] =
        [
            [("", nil)],
            [("相册", Asset.MoreMyAlbum.image),("收藏", Asset.MoreMyFavorites.image),("钱包", Asset.MoreMyBankCard.image),("优惠券", Asset.MyCardPackageIcon.image)],
            [("表情", Asset.MoreExpressionShops.image)],
            [("设置", Asset.MoreSetting.image)]
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "我"
        self.view.backgroundColor = UIColor(colorNamed: CSColor.viewBackgroundColor)
        
        self.listTableView.register(MeTableViewCell.nibObject(), forCellReuseIdentifier: MeTableViewCell.identifier)
        self.listTableView.register(ImageTextTableViewCell.nibObject(), forCellReuseIdentifier: ImageTextTableViewCell.identifier)
        self.listTableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        log.verbose("deinit")
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

extension MeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 15
        } else {
            return 20
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 88.0
        } else {
            return 44.0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension MeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.itemDataSouce.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rows = self.itemDataSouce[section]
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: MeTableViewCell.identifier, for: indexPath) as! MeTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageTextTableViewCell.identifier, for: indexPath) as! ImageTextTableViewCell
            let item = self.itemDataSouce[indexPath.section][indexPath.row]
            cell.iconImageView.image = item.iconImage
            cell.titleLabel.text = item.name
            return cell
        }
    }
}
