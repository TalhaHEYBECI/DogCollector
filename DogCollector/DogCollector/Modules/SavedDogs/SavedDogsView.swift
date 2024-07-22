//
//  SavedDogsView.swift
//  DogCollector
//
//  Created by talha heybeci on 21.07.2024.
//

import SwiftUI

struct SavedDogsView: View {

    @StateObject private var viewModel = SavedDogsViewModel()
    var coordinator: HomeCoordinator?

    var body: some View {
        VStack {
            if viewModel.savedDogImages.isEmpty {
                Text(LocalizationKeys.savedDogsView_text_noSavedImages.localized)
                    .foregroundColor(.gray)
            } else {
                List(viewModel.savedDogImages, id: \.self) { dogImage in
                    if let imageData = dogImage.imageData, let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 200)
                    } else {
                        Text(LocalizationKeys.savedDogsView_text_failedToLoadImage.localized)
                            .foregroundColor(.red)
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchSavedDogImages()
        }
        .navigationBarTitle(LocalizationKeys.savedDogsView_nav_title.localized, displayMode: .inline)
    }
}

#Preview {
    SavedDogsView()
}
