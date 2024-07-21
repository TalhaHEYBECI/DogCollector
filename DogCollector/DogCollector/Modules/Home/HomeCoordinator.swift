//
//  HomeCoordinator.swift
//  DogCollector
//
//  Created by talha heybeci on 21.07.2024.
//

import SwiftUI
import UIKit

class HomeCoordinator: Coordinator {

    override func start() {
        let homeView = HomeView(coordinator: self)
        let hostingController = UIHostingController(rootView: homeView)
        navigationController.viewControllers = [hostingController]
    }
    
    
    func goToRandomDogsView() {
        let randomDogsView = RandomDogsView(coordinator: self)
        let hostingController = UIHostingController(rootView: randomDogsView)
        Navigator.shared.navigate(from: navigationController, to: hostingController, navigationType: .push)
    }
    
    func goToSavedDogsView() {
        let savedDogsView = SavedDogsView(coordinator: self)
        let hostingController = UIHostingController(rootView: savedDogsView)
        Navigator.shared.navigate(from: navigationController, to: hostingController, navigationType: .push)
    }
}
