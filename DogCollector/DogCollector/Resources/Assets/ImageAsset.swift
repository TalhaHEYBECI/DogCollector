//
//  ImageAsset.swift
//  DogCollector
//
//  Created by talha heybeci on 22.07.2024.
//

import SwiftUI

enum ImageAsset: String {
    case homeViewBackground = "homeView_background"
    
    var image: Image {
        return Image(self.rawValue)
    }
}

extension Image {
    init(asset: ImageAsset) {
        self = asset.image
    }
}
