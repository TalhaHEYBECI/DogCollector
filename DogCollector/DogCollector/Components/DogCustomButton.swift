//
//  DogCustomButton.swift
//  DogCollector
//
//  Created by talha heybeci on 22.07.2024.
//

import SwiftUI

struct DogCustomButton: View {
    
    // MARK: - Properties
    var title: String
    var action: () -> Void
    
    @State private var isPressed = false

    // MARK: - Body
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 0.2)) {
                isPressed = true
            }
            action()
            withAnimation(.easeInOut(duration: 0.2)) {
                isPressed = false
            }
        }) {
            Text(title)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding()
                .frame(minWidth: 200, minHeight: 44)
                .background(
                    ZStack {
                        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            .cornerRadius(10)
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 2)
                    }
                )
                .shadow(color: .gray, radius: 5, x: 0, y: 5)
                .scaleEffect(isPressed ? 0.95 : 1.0)
        }
    }
}

// MARK: - Previews
struct ButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        DogCustomButton(title: "Example Button", action: {})
    }
}
