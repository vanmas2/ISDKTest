//
//  Data+Extension.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import UIKit


extension Data {
    
    init(imageName: String) {
        guard
            let image = UIImage(named: imageName),
            let data = image.jpegData(compressionQuality: 0)
            else { fatalError() }
        self = data
    }
}
