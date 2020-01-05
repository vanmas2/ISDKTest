//
//  CoordinatorProtocol.swift
//  ISDKTest
//
//  Created by Иван Масальских on 30/12/2019.
//

import Foundation


// MARK: - Coordinator

protocol CoordinatorProtocol: class {
    var finishFlow: (() -> Void)? { get set }
    func start()
}
