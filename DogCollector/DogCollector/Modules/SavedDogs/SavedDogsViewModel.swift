//
//  SavedDogsViewModel.swift
//  DogCollector
//
//  Created by talha heybeci on 22.07.2024.
//

import Foundation
import Combine
import UIKit

class SavedDogsViewModel: ObservableObject {
    
    @Published var savedDogImages: [DogImageEntity] = []

    init() {
        fetchSavedDogImages()
    }

    func fetchSavedDogImages() {
        savedDogImages = CoreDataManager.shared.fetchAllDogImages()
    }
}
