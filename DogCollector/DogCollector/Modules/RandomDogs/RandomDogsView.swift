//
//  RandomDogsView.swift
//  DogCollector
//
//  Created by talha heybeci on 21.07.2024.
//

import SwiftUI

struct RandomDogsView: View {

    @StateObject private var viewModel = RandomDogsViewModel()
    @State private var refreshID = UUID()
    var coordinator : HomeCoordinator?

    var body: some View {

        VStack {
            if let url = URL(string: viewModel.dogImageURL), !viewModel.dogImageURL.isEmpty {
                RemoteImage(url: url)
                    .frame(width: 300, height: 300)
            } else if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
                    .foregroundColor(.red)
            } else {
                Text(LocalizationKeys.randomDogsView_text_loading.rawValue)
            }
            
            DogCustomButton(title: LocalizationKeys.randomDogsView_button_getRandomImage.rawValue) {
                viewModel.fetchRandomDogImage()
            }

            DogCustomButton(title: LocalizationKeys.randomDogsView_button_saveDogImage.rawValue) {
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
}

#Preview {
    RandomDogsView()
}
