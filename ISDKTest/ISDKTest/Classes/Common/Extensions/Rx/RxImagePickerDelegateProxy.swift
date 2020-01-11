//
//  RxImagePickerDelegateProxy.swift
//  ISDKTest
//
//  Created by Иван Масальских on 11/01/2020.
//

#if os(iOS)

import RxSwift
import RxCocoa
import UIKit

class RxImagePickerDelegateProxy: RxNavigationControllerDelegateProxy, UIImagePickerControllerDelegate {
    
    public init(imagePicker: UIImagePickerController) {
        super.init(navigationController: imagePicker)
    }
    
}

#endif
