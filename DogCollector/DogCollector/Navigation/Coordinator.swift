//
//  Coordinator.swift
//  DogCollector
//
//  Created by talha heybeci on 21.07.2024.
//

import UIKit.UIViewController

public class Coordinator: BaseCoordinator {

    // MARK: - Properties
    public var parentCoordinator: BaseCoordinator?
    public var childCoordinators: [BaseCoordinator] = []
    public var navigationController: UINavigationController
    
    // MARK: - Initialization
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Navigation Methods
    public func start() {
        // Implementation of start will be in subclasses
    }
    
    public func navigate(to viewController: UIViewController, navigationType: Navigator.NavigatorType) {
        let navigator = Navigator()
        navigator.navigate(from: navigationController, to: viewController, navigationType: navigationType)
    }
}
