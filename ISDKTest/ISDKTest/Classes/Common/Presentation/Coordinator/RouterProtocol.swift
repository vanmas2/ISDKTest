//
//  RouterProtocol.swift
//  ISDKTest
//
//  Created by Иван Масальских on 30/12/2019.
//

import UIKit


// MARK: - Router

protocol RouterProtocol: Presentable {    
    func present(_ module: Presentable?)
    func present(_ module: Presentable?, animated: Bool, presentationStyle: UIModalPresentationStyle)
    
    func push(_ module: Presentable?)
    func push(_ module: Presentable?, animated: Bool)
    func push(_ module: Presentable?, animated: Bool, completion: (() -> Void)?)
    
    func popModule()
    func popModule(animated: Bool)
    
    func dismissModule()
    func dismissModule(animated: Bool, completion: (() -> Void)?)
    
    func setRootModule(_ module: Presentable?)
    
    func popToRootModule(animated: Bool)
    
    func pop(to module: Presentable?, animated: Bool)
    func pop(to module: Presentable?)
}
