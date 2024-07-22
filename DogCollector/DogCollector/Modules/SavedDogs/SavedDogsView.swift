//
//  SavedDogsView.swift
//  DogCollector
//
//  Created by talha heybeci on 21.07.2024.
//

import SwiftUI

struct SavedDogsView: View {

    // MARK: - Properties
    @StateObject private var viewModel = SavedDogsViewModel()
    var coordinator: HomeCoordinator?

    // MARK: - Body
    var body: some View {
        VStack {
            if viewModel.savedDogImages.isEmpty {
                Text(LocalizationKeys.savedDogsView_text_noSavedImages.localized)
                    .foregroundColor(.gray)
            } else {
                List {
                    ForEach(viewModel.savedDogImages, id: \.self) { dogImage in
                        if let imageData = dogImage.imageData, let uiImage = UIImage(data: imageData) {
                            GeometryReader { geometry in
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width, height: geometry.size.width)
                                    .clipped()
                            }
                            .frame(width: 300, height: 300)
                        } else {
                            Text(LocalizationKeys.savedDogsView_text_failedToLoadImage.localized)
                                .foregroundColor(.red)
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
            }
        }
        .onAppear {
            viewModel.fetchSavedDogImages()
        }
        .navigationBarTitle(LocalizationKeys.savedDogsView_nav_title.localized, displayMode: .inline)
    }

    // MARK: - Delete Item
    private func deleteItems(at offsets: IndexSet) {
        offsets.forEach { index in
            let dogImage = viewModel.savedDogImages[index]
            CoreDataManager.shared.deleteDogImage(dogImage)
        }
        viewModel.fetchSavedDogImages()
    }
}

// MARK: - Preview
#Preview {
    SavedDogsView()
}
