//
//  RandomDogsView.swift
//  DogCollector
//
//  Created by talha heybeci on 21.07.2024.
//

import SwiftUI
import DogNetwork

struct RandomDogsView: View {

    var coordinator: HomeCoordinator?
    @ObservedObject private var dogNetworkInterface = DogNetworkInterface()
    @State private var refreshID = UUID()
    @State private var dogImage: UIImage?

    var body: some View {

        VStack {
            if let url = URL(string: dogNetworkInterface.dogImageURL), !dogNetworkInterface.dogImageURL.isEmpty {
                RemoteImage(url: url)
                    .frame(width: 300, height: 300)
            } else if !dogNetworkInterface.errorMessage.isEmpty {
                Text(dogNetworkInterface.errorMessage)
                    .foregroundColor(.red)
            } else {
                Text("Loading...")
            }

            Button(action: {
                dogNetworkInterface.fetchRandomDogImage()
            }) {
                Text("Get Random Image")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }

            Button(action: {
                if let url = URL(string: dogNetworkInterface.dogImageURL) {
                    fetchImage(from: url) { image in
                        if let image = image {
                            CoreDataManager.shared.createDogImage(image: image, url: dogNetworkInterface.dogImageURL)
                            self.dogImage = image
                        } else {
                            print("Failed to load image from URL")
                        }
                    }
                }
            }) {
                Text("Save Dog Image")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .id(refreshID)
        .padding()
        .onAppear {
            dogNetworkInterface.fetchRandomDogImage()
        }
        .onReceive(dogNetworkInterface.imageUpdated) { _ in
            refreshID = UUID()
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
}

#Preview {
    RandomDogsView()
}
