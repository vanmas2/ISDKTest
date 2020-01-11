//
//  String+Extension.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

import Foundation

extension String {
    
    static func random(length: Int) -> String {
        let base = " abcdef ghijklmno pqrstuvwxyz ABCDEFG HIJKLMNOP QRSTUV WXYZ 012345 6789 "
        var randomString: String = ""
        
        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.count))
            randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
        }
        return randomString
    }
}
