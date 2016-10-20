//
//  NSObject+Extension.swift
//  CSWeChat
//
//  Created by 杨晓冬 on 9/30/16.
//  Copyright © 2016 杨晓冬. All rights reserved.
//

import UIKit
import Foundation

extension NSObject {
    
    class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last! as String
    }
    
    class var identifier: String {
        return String(format: "%@_identifier", self.nameOfClass)
    }
}
