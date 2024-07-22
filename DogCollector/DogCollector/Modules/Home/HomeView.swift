//
//  HomeView.swift
//  DogCollector
//
//  Created by talha heybeci on 21.07.2024.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Properties
    @StateObject private var viewModel = HomeViewModel()
    var coordinator: HomeCoordinator?

    // MARK: - Body
    var body: some View {
        ZStack {
            Image(asset: .homeViewBackground)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                DogCustomButton(title: LocalizationKeys.homeView_button_goToSavedScreen.localized) {
                    viewModel.goToSavedDogsView()
                }
                .padding()

                DogCustomButton(title: LocalizationKeys.homeView_button_goToRandomScreen.localized) {
                    viewModel.goToRandomDogsView()
                }
                .padding()
            }
            .onAppear {
                viewModel.coordinator = coordinator
            }
        }
    }
}

// MARK: - Preview
#Preview {
    HomeView()
}
