//
//  BaseCoordinator.swift
//  DogCollector
//
//  Created by talha heybeci on 21.07.2024.
//

import UIKit.UIViewController

public protocol BaseCoordinator: AnyObject {
    var parentCoordinator: BaseCoordinator? { get set }
    var childCoordinators: [BaseCoordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
