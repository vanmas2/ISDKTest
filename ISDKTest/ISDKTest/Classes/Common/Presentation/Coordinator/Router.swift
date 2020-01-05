//
//  Router.swift
//  ISDKTest
//
//  Created by Иван Масальских on 30/12/2019.
//

import UIKit


// MARK: - Router

final class Router: NSObject {
    
    // MARK: Properties
    
    var rootController: UINavigationController?
    
    private var completions = [UIViewController: () -> Void]()
    
    // MARK: Construction
    
    init(rootController: UINavigationController) {
        self.rootController = rootController
        super.init()
        self.rootController?.delegate = self
    }
}


// MARK: - RouterProtocol implementation

extension Router: RouterProtocol {
    
    func toPresent() -> UIViewController? {
        return rootController
    }
    
    func present(_ module: Presentable?) {
        present(module, animated: true, presentationStyle: .fullScreen)
    }
    
    func present(_ module: Presentable?, animated: Bool, presentationStyle: UIModalPresentationStyle) {
        guard
            let controller = module?.toPresent()
            else { return }
        controller.modalPresentationStyle = presentationStyle
        controller.modalTransitionStyle = .crossDissolve
        rootController?.present(controller, animated: animated, completion: nil)
    }
    
    func dismissModule() {
        dismissModule(animated: true, completion: nil)
    }
    
    func dismissModule(animated: Bool, completion: (() -> Void)?) {
        rootController?.dismiss(animated: animated, completion: completion)
    }
    
    func dismissModule(animated: Bool, hideBar: Bool, hideBarAnimated: Bool, completion: (() -> Void)?) {
        dismissModule(animated: animated, completion: completion)
    }
    
    func push(_ module: Presentable?) {
        push(module, animated: true)
    }
    
    func push(_ module: Presentable?, animated: Bool) {
        push(module, animated: animated, completion: nil)
    }
    
    func push(_ module: Presentable?, animated: Bool, completion: (() -> Void)?) {
        guard
            let controller = module?.toPresent(),
            (controller is UINavigationController == false)
            else { assertionFailure(Errors.deprecatedPush); return }
        
        if let completion = completion {
            completions[controller] = completion
        }
        rootController?.pushViewController(controller, animated: animated)
    }
    
    func push(_ module: Presentable?, animated: Bool, hideBar: Bool, hideBarAnimated: Bool, completion: (() -> Void)?) {
        push(module, animated: animated, completion: completion)
    }
    
    func popModule() {
        popModule(animated: true)
    }
    
    func popModule(animated: Bool) {
        if let controller = rootController?.popViewController(animated: animated) {
            runCompletion(for: controller)
        }
    }
    
    func setRootModule(_ module: Presentable?) {
        guard
            let controller = module?.toPresent()
            else { return }
        rootController?.setViewControllers([controller], animated: false)
    }
    
    func popToRootModule(animated: Bool) {
        rootController?.popToRootViewController(animated: animated)
        let controllers = completions.keys
        controllers.forEach { runCompletion(for: $0) }
    }
    
    func pop(to module: Presentable?) {
        pop(to: module, animated: true)
    }
    
    func pop(to module: Presentable?, animated: Bool) {
        guard
            let toViewcontroller = module?.toPresent(),
            let navigationController = rootController,
            let _ = navigationController.viewControllers.first(where: { $0 == toViewcontroller })
            else { return }
        navigationController.popToViewController(toViewcontroller, animated: animated)
    }
}


// MARK: - UINavigationControllerDelegate implementation

extension Router: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        guard
            let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from),
            let rootNavigationController = rootController,
            !rootNavigationController.viewControllers.contains(fromViewController)
            else { return }
        runCompletion(for: fromViewController)
    }
}


// MARK: - Helper functions

private extension Router {
    
    func runCompletion(for controller: UIViewController) {
        guard
            let completion = completions[controller]
            else { return }
        completion()
        completions.removeValue(forKey: controller)
    }
}


// MARK: - Constants

private extension Router {
    
    enum Errors {
        static let deprecatedPush = "Deprecated push UINavigationController"
    }
}
