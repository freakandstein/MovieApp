//
//  UIImageXt.swift
//  MovieApp
//
//  Created by Satrio Wicaksono on 02/03/2019.
//  Copyright © 2019 Docotel Group. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    func withInsets(insetDimen: CGFloat) -> UIImage {
        return imageWithInset(insets: UIEdgeInsets(top: insetDimen, left: insetDimen, bottom: insetDimen, right: insetDimen))
    }
    
    func imageWithInset(insets: UIEdgeInsets) -> UIImage {
        let size = CGSize(width: self.size.width + insets.left + insets.right, height: self.size.height + insets.top + insets.bottom)
        UIGraphicsBeginImageContextWithOptions(
            size, false, self.scale)
        let origin = CGPoint(x: insets.left, y: insets.top)
        self.draw(at: origin)
        let imageWithInsets = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return imageWithInsets!
    }
    
    func base64() -> String{
        let imageData = self.pngData()!
        let encode = imageData.base64EncodedString(options: .lineLength64Characters)
        return encode
    }
    
    func compress() -> UIImage{
        var actualHeight : CGFloat = self.size.height
        var actualWidth : CGFloat = self.size.width
        let maxHeight : CGFloat = 800.0
        let maxWidth : CGFloat = 450.0
        var imgRatio : CGFloat = actualWidth/actualHeight
        let maxRatio : CGFloat = maxWidth/maxHeight
        var compressionQuality : CGFloat = 0.55
        
        if (actualHeight > maxHeight || actualWidth > maxWidth){
            if(imgRatio < maxRatio){
                imgRatio = maxHeight / actualHeight
                actualWidth = imgRatio * actualWidth
                actualHeight = maxHeight
            }
            else if(imgRatio > maxRatio){
                imgRatio = maxWidth / actualWidth
                actualHeight = imgRatio * actualHeight
                actualWidth = maxWidth
            }
            else{
                actualHeight = maxHeight
                actualWidth = maxWidth
                compressionQuality = 1
            }
        }
        
        let rect = CGRect(x: 0.0, y: 0.0, width: actualWidth, height: actualHeight)
        UIGraphicsBeginImageContext(rect.size)
        self.draw(in: rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let imageData = img?.jpegData(compressionQuality: compressionQuality)
        return UIImage(data: imageData!)!
    }
    
    func fileSize() -> Double{
        let imageData:NSData = NSData(data: self.pngData()!)
        let size = imageData.length
        let kb:Double = 1024.0
        return Double(size)/kb
    }
    
}

