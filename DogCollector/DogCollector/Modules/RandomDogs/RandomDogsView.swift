//
//  RandomDogsView.swift
//  DogCollector
//
//  Created by talha heybeci on 21.07.2024.
//

import SwiftUI

struct RandomDogsView: View {

    // MARK: - Properties
    @StateObject private var viewModel = RandomDogsViewModel()
    @State private var refreshID = UUID()
    var coordinator: HomeCoordinator?

    // MARK: - Body
    var body: some View {
        VStack {
            content
            DogCustomButton(title: LocalizationKeys.randomDogsView_button_getRandomImage.localized) {
                viewModel.fetchRandomDogImage()
            }
            DogCustomButton(title: LocalizationKeys.randomDogsView_button_saveDogImage.localized) {
                viewModel.saveDogImage()
            }
        }
        .id(refreshID)
        .padding()
        .onAppear {
            viewModel.fetchRandomDogImage()
        }
        .onReceive(viewModel.$dogImageURL) { _ in
            refreshID = UUID()
        }
    }

    // MARK: - Content
    @ViewBuilder
    private var content: some View {
        if let url = URL(string: viewModel.dogImageURL), !viewModel.dogImageURL.isEmpty {
            GeometryReader { geometry in
                RemoteImage(url: url)
                    .frame(width: geometry.size.width, height: geometry.size.width)
                    .clipped()
            }
            .frame(width: 300, height: 300)
        } else if !viewModel.errorMessage.isEmpty {
            Text(viewModel.errorMessage)
                .foregroundColor(.red)
        } else {
            Text(LocalizationKeys.randomDogsView_text_loading.localized)
        }
    }
}

// MARK: - Preview
#Preview {
    RandomDogsView()
}
