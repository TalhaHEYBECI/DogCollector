//
//  Coordinator.swift
//  DogCollector
//
//  Created by talha heybeci on 21.07.2024.
//

import UIKit.UIViewController

public class Coordinator: BaseCoordinator {
    public var parentCoordinator: BaseCoordinator?
    public var childCoordinators: [BaseCoordinator] = []
    public var navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {

    }
    
    public func navigate(to viewController: UIViewController, navigationType: Navigator.NavigatorType) {
        let navigator = Navigator()
        navigator.navigate(from: navigationController, to: viewController, navigationType: navigationType)
    }
}
