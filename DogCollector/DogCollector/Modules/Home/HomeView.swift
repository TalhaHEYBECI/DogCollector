//
//  HomeView.swift
//  DogCollector
//
//  Created by talha heybeci on 21.07.2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    var coordinator: HomeCoordinator?

    var body: some View {
        VStack {
            
            DogCustomButton(title: LocalizationKeys.homeView_button_goToSavedScreen.localized) {
                viewModel.goToSavedDogsView()
            }
            
            DogCustomButton(title: LocalizationKeys.homeView_button_goToRandomScreen.localized) {
                viewModel.goToRandomDogsView()
            }
        }
        .onAppear {
            viewModel.coordinator = coordinator
        }
    }
}

#Preview {
    HomeView()
}
