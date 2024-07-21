//
//  HomeViewModel.swift
//  DogCollector
//
//  Created by talha heybeci on 22.07.2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    var coordinator: HomeCoordinator?

    func goToSavedDogsView() {
        coordinator?.goToSavedDogsView()
    }

    func goToRandomDogsView() {
        coordinator?.goToRandomDogsView()
    }
}
