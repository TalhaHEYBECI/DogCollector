//
//  SavedDogsView.swift
//  DogCollector
//
//  Created by talha heybeci on 21.07.2024.
//

import SwiftUI

struct SavedDogsView: View {

    var coordinator: HomeCoordinator?
    @State private var savedDogImages: [DogImageEntity] = []

    var body: some View {
        VStack {
            if savedDogImages.isEmpty {
                Text("No saved images")
                    .foregroundColor(.gray)
            } else {
                List(savedDogImages, id: \.self) { dogImage in
                    if let imageData = dogImage.imageData, let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 200)
                    } else {
                        Text("Failed to load image")
                            .foregroundColor(.red)
                    }
                }
            }
        }
        .onAppear {
            fetchSavedDogImages()
        }
        .navigationBarTitle("Saved Dogs", displayMode: .inline)
    }

    private func fetchSavedDogImages() {
        savedDogImages = CoreDataManager.shared.fetchAllDogImages()
    }
}

#Preview {
    SavedDogsView()
}
