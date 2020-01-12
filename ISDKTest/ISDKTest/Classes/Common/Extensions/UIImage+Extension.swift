//
//  UIImage+Extension.swift
//  ISDKTest
//
//  Created by Иван Масальских on 12/01/2020.
//

import UIKit


extension UIImage {
    
    func convert(toSize size:CGSize, scale:CGFloat) ->UIImage {
        let imgRect = CGRect(origin: CGPoint(x:0.0, y:0.0), size: size)
        
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        self.draw(in: imgRect)
        
        let copied = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return copied!
    }
}
