//
//  UIImage+Extension.swift
//  iOSAppBase
//
//  Created by 杨晓冬 on 10/28/16.
//  Copyright © 2016 杨晓冬. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit

public extension UIImage {
    
    class func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
    
    public enum UIImageContentMode {
        case scaleToFill
        case scaleAspectFit
        case scaleAspectFill
    }
    
    func resize(size: CGSize, contentModel: UIImageContentMode = .scaleToFill, quality: CGInterpolationQuality = .medium) -> UIImage {
        let horizontalRatio = size.width / self.size.width
        let verticalRation = size.height / self.size.height
        var ratio: CGFloat!
        
        switch(contentModel) {
        case .scaleToFill:
            ratio = 1
        case .scaleAspectFit:
            ratio = max(horizontalRatio, verticalRation)
        case .scaleAspectFill:
            ratio = min(horizontalRatio, verticalRation)
        }
        
        let rect = CGRect(x: 0, y: 0, width: size.width * ratio , height: size.height * ratio)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        
        let context = CGContext(data: nil, width: Int(rect.size.width), height: Int(rect.size.height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
        
        context!.concatenate(CGAffineTransform.identity)
        context!.interpolationQuality = quality
        context!.draw(self.cgImage!, in: rect)
        
        let newImage = UIImage(cgImage: context!.makeImage()!, scale: self.scale, orientation: self.imageOrientation)
        return newImage
    }
    
    func screenCaptureWithView(view: UIView, rect: CGRect) -> UIImage {
        var capture: UIImage
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 1.0)
        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: -rect.origin.x, y: -rect.origin.y)
        
        if view.responds(to: #selector(UIView.drawHierarchy(in:afterScreenUpdates:))) {
            view.drawHierarchy(in: view.frame, afterScreenUpdates: true)
        } else {
            view.layer.render(in: context!)
        }
        
        capture = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return capture
    }
    
    func roundWithCornerRadius(cornerRadius: CGFloat) -> UIImage {
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: self.size)
        UIGraphicsBeginImageContextWithOptions(self.size, false, 1)
        UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).addClip()
        draw(in: rect)
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
    
    func hasAlpha() -> Bool {
        let alpha = self.cgImage?.alphaInfo
        return (alpha == .first || alpha == .last || alpha == .premultipliedFirst || alpha == .premultipliedLast)
    }
}
