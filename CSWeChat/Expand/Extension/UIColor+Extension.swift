//
//  UIColor+Extension.swift
//  CSWeChat
//
//  Created by 杨晓冬 on 9/30/16.
//  Copyright © 2016 杨晓冬. All rights reserved.
//

typealias CSColor = UIColor.LocalColorName

import Foundation
import UIKit
import UIColor_Hex_Swift

extension UIColor {
    enum LocalColorName: String {
        case barTintColor = "#1A1A1A"  /*navigationbar 的颜色*/
        case tabbarSelectedTextColor = "#68BB1E"
        case viewBackgroundColor = "#E7EBEE"
    }
    convenience init!(colorNamed name: LocalColorName) {
        self.init(name.rawValue)
    }
    
}

