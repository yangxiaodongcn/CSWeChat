//
//  UIImageView+Extension.swift
//  CSWeChat
//
//  Created by 杨晓冬 on 10/26/16.
//  Copyright © 2016 杨晓冬. All rights reserved.
//

import Foundation
import Kingfisher

public extension UIImageView {
    
    //原始图
    func setImageWithURLString(URLString: String?, placeholder image: UIImage? = nil) {
        guard let URLString = URLString, let url = URL(string: URLString) else {
            printLog("URL String wrong")
            return
        }
        self.kf.setImage(with: ImageResource(downloadURL: url), placeholder: image, options: nil, progressBlock: nil, completionHandler: nil)
    }
    
    //圆角图
    func setCircularImageWithURLString(URLString: String?, placeholder image: UIImage? = nil) {
        
    }
    
    //设置 cornerRadiusRatio
    func setCornerRadiusImageWithURLString(URLString: String?, placeholder image: UIImage? = nil, cornerRadiusRatio: CGFloat? = nil) {
        
    }
    
    func setRoundImageWithURLString(URLString: String?, placeholder image:UIImage? = nil, cornerRadiusRatio: CGFloat? = nil, progressBlock: ImageDownloaderProgressBlock? = nil) {
        guard let URLString = URLString, let url = URL(string: URLString) else {
            printLog("URL String wrong")
            return
        }
        
        let memoryImage = KingfisherManager.shared.cache.retrieveImageInMemoryCache(forKey: URLString)
        let diskImage = KingfisherManager.shared.cache.retrieveImageInDiskCache(forKey: URLString)
        
//        guard let image = memoryImage ?? diskImage else {
//            let optionInfo: KingfisherOptionsInfo = [.forceRefresh]
//            KingfisherManager.shared.downloader.downloadImage(with: url, options: optionInfo, progressBlock: progressBlock) {
//                (image, error, imageURL, originalData) -> () in
//                
//                if let image = image, let originalData = originalData {
//                    DispatchQueue.global().async {
//                        let roundImage = image.kf.image(withRoundRadius: <#T##CGFloat#>, fit: <#T##CGSize#>, scale: <#T##CGFloat#>)
//                    }
//                }
//            }
//        }
        
        
        
    }
}

