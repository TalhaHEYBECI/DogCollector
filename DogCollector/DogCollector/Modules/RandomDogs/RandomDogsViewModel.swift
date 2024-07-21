//
//  RandomDogsViewModel.swift
//  DogCollector
//
//  Created by talha heybeci on 22.07.2024.
//

import Foundation
import Combine
import UIKit
import DogNetwork

class RandomDogsViewModel: ObservableObject {

    @Published var dogImageURL: String = ""
    @Published var errorMessage: String = ""
    @Published var dogImage: UIImage?
    
    private let dogNetworkInterface = DogNetworkInterface()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        dogNetworkInterface.$dogImageURL
            .receive(on: DispatchQueue.main)
            .assign(to: &$dogImageURL)
        
        dogNetworkInterface.$errorMessage
            .receive(on: DispatchQueue.main)
            .assign(to: &$errorMessage)
        
        dogNetworkInterface.imageUpdated
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                self?.fetchImage()
            }
            .store(in: &cancellables)
    }
    
    func fetchRandomDogImage() {
        dogNetworkInterface.fetchRandomDogImage()
    }
    
    func saveDogImage() {
        guard let url = URL(string: dogImageURL) else {
            return
        }
        fetchImage(from: url) { image in
            if let image = image {
                CoreDataManager.shared.createDogImage(image: image, url: self.dogImageURL)
                self.dogImage = image
            } else {
                print("Failed to load image from URL")
            }
        }
    }
    
    private func fetchImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil, let image = UIImage(data: data) else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            DispatchQueue.main.async {
                completion(image)
            }
        }.resume()
    }
    
    private func fetchImage() {
        guard let url = URL(string: dogImageURL) else { return }
        fetchImage(from: url) { [weak self] image in
            self?.dogImage = image
        }
    }
}
