//
//  Coordinator.swift
//  ISDKTest
//
//  Created by Иван Масальских on 30/12/2019.
//


// MARK: - Coordinator

class Coordinator: CoordinatorProtocol {
    
    // MARK: Properties
    
    var router: RouterProtocol
    
    var childCoordinators: [CoordinatorProtocol] = []
    
    var finishFlow: (() -> Void)?
        
    // MARK: Construction
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    // MARK: Functions
    
    func start() {}
}


// MARK: - Functions

extension Coordinator {
    
    func addDependency(_ coordinator: CoordinatorProtocol) {
        for element in childCoordinators where element === coordinator {
            return
        }
        childCoordinators.append(coordinator)
    }
    
    func removeDependency(_ coordinator: CoordinatorProtocol?) {
        guard
            childCoordinators.isEmpty == false,
            let coordinator = coordinator
            else { return }
        
        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }
}
