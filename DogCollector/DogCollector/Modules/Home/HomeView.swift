//
//  HomeView.swift
//  DogCollector
//
//  Created by talha heybeci on 21.07.2024.
//

import SwiftUI

struct HomeView: View {
    
    var coordinator : HomeCoordinator?
    
    var body: some View {
        VStack {
            
            Button(action: {
                coordinator?.goToSavedDogsView()
            }){
                Text("Go to Saved Screen")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Button(action: {
                coordinator?.goToRandomDogsView()
            }){
                Text("Go to Random Screen")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}

#Preview {
    HomeView()
}
