//
//  DiscoverViewController.swift
//  CSWeChat
//
//  Created by 杨晓冬 on 10/10/16.
//  Copyright © 2016 杨晓冬. All rights reserved.
//

import UIKit

class DiscoverViewController: UIViewController {
    @IBOutlet weak var listTableView: UITableView!
    
    let itemDataSouce: [[(name: String, iconImage: UIImage)]] =
        [
            [("朋友圈", Asset.Ff_IconShowAlbum.image)],
            [("扫一扫", Asset.Ff_IconQRCode.image),("摇一摇", Asset.Ff_IconShake.image)],
            [("附近的人", Asset.Ff_IconLocationService.image),("漂流瓶", Asset.Ff_IconBottle.image)],
            [("游戏", Asset.MoreGame.image)]
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "发现"
        self.view.backgroundColor = UIColor(colorNamed: CSColor.viewBackgroundColor)
        
        self.listTableView.register(ImageTextTableViewCell.nibObject(), forCellReuseIdentifier: ImageTextTableViewCell.identifier)
        self.listTableView.estimatedRowHeight = 44
        self.listTableView.tableFooterView = UIView()

        // Do any additional setup after loading the view.
    }
    
    deinit {
        log.verbose("deinit")
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

extension DiscoverViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 15
        } else {
            return 20
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension DiscoverViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.itemDataSouce.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let row = self.itemDataSouce[section]
        return row.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTableView.dequeueReusableCell(withIdentifier: ImageTextTableViewCell.identifier, for: indexPath) as! ImageTextTableViewCell
        let item = self.itemDataSouce[indexPath.section][indexPath.row]
        
        cell.iconImageView.image = item.iconImage
        cell.titleLabel.text = item.name
        
        return cell
    }
    
}
