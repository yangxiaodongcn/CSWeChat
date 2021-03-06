//
//  MainTabBarController.swift
//  CSWeChat
//
//  Created by 杨晓冬 on 9/29/16.
//  Copyright © 2016 杨晓冬. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let discoverController = DiscoverViewController.initFromNib()
        discoverController.tabBarItem!.title = "发现"
        discoverController.tabBarItem!.image = Asset.Tabbar_discover.image
        discoverController.tabBarItem!.selectedImage = Asset.Tabbar_discoverHL.image
        discoverController.tabBarItem!.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.lightGray], for: .normal)
        discoverController.tabBarItem!.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor(colorNamed: CSColor.tabbarSelectedTextColor)], for: .selected)
        let discoverNavigation = UINavigationController(rootViewController: discoverController)
        
        let meController = MeViewController.initFromNib()
        meController.tabBarItem!.title = "我"
        meController.tabBarItem!.image = Asset.Tabbar_me.image
        meController.tabBarItem!.selectedImage = Asset.Tabbar_meHL.image
        meController.tabBarItem!.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.lightGray], for: .normal)
        meController.tabBarItem!.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor(colorNamed: CSColor.tabbarSelectedTextColor)], for: .selected)
        let meNavigaion = UINavigationController(rootViewController: meController)
        
        let contactController = ContactViewController.initFromNib()
        contactController.tabBarItem!.title = "通讯录"
        contactController.tabBarItem!.image = Asset.Tabbar_contacts.image
        contactController.tabBarItem!.selectedImage = Asset.Tabbar_contactsHL.image
        contactController.tabBarItem!.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.lightGray], for: .normal)
        contactController.tabBarItem!.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor(colorNamed: CSColor.tabbarSelectedTextColor)], for: .selected)
        let contactNavigaion = UINavigationController(rootViewController: contactController)
        
        
        self.viewControllers = [contactNavigaion, discoverNavigation, meNavigaion]
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
