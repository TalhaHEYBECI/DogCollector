//
//  ImageLoader.swift
//  DogCollector
//
//  Created by talha heybeci on 21.07.2024.
//

import SwiftUI
import Combine

public class ImageLoader: ObservableObject {
    
    // MARK: - Properties
    @Published var image: UIImage?
    private var cancellable: AnyCancellable?

    // MARK: - Methods
    
    /// Loads an image from the given URL.
    /// - Parameter url: The URL to load the image from.
    public func load(from url: URL) {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.image = $0 }
    }

    // MARK: - Deinitialization
    
    /// Cancels any ongoing network requests when the instance is deallocated.
    deinit {
        cancellable?.cancel()
    }
}
