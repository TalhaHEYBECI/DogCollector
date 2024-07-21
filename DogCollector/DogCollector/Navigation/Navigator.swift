//
//  Navigator.swift
//  DogCollector
//
//  Created by talha heybeci on 21.07.2024.
//

import UIKit

public class Navigator {
    
    static let shared = Navigator()
    
    public enum NavigatorType {
        case push
        case present
    }
    
    public init() {}
    
    public func navigate(from root: UIViewController, to viewController: UIViewController, navigationType: NavigatorType) {
        switch navigationType {
        case .push:
            if let navController = root as? UINavigationController {
                navController.pushViewController(viewController, animated: true)
            } else if let navController = root.navigationController {
                navController.pushViewController(viewController, animated: true)
            } else {
                print("Error: root view controller does not have a navigation controller.")
            }
        case .present:
            root.present(viewController, animated: true, completion: nil)
        }
    }
}
