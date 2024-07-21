//
//  RemoteImage.swift
//  DogCollector
//
//  Created by talha heybeci on 21.07.2024.
//

import SwiftUI

public struct RemoteImage: View {
    @ObservedObject var imageLoader = ImageLoader()
    let url: URL

    public init(url: URL) {
        self.url = url
        self.imageLoader.load(from: url)
    }

    public var body: some View {
        if let image = imageLoader.image {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            ProgressView()
        }
    }
}
