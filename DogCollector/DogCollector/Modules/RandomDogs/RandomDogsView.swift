//
//  RandomDogsView.swift
//  DogCollector
//
//  Created by talha heybeci on 21.07.2024.
//

import SwiftUI
import DogNetwork

struct RandomDogsView: View {
    
    var coordinator : HomeCoordinator?
    @ObservedObject private var dogNetworkInterface = DogNetworkInterface()
    @State private var refreshID = UUID()
    
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
                Text("Yeni Köpek Getir")
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
}

#Preview {
    RandomDogsView()
}
