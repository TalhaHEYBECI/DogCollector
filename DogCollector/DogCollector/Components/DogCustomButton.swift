//
//  DogCustomButton.swift
//  DogCollector
//
//  Created by talha heybeci on 22.07.2024.
//

import SwiftUI

struct DogCustomButton: View {
    var title: String
    var action: () -> Void

    var body: some View {
        Button(action: {
            action()
        }) {
            Text(title)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}

struct ButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        DogCustomButton(title: "Example Button", action: {})
    }
}
