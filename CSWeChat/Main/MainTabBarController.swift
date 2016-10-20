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
        
        let meController = MeViewController.initFromNib()
        let discoverController = DiscoverViewController.initFromNib()
        
        self.viewControllers = [discoverController, meController]
        

        // Do any additional setup after loading the view.
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
