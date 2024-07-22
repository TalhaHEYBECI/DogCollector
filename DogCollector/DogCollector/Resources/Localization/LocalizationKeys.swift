//
//  LocalizationKeys.swift
//  DogCollector
//
//  Created by talha heybeci on 22.07.2024.
//

import Foundation
import SwiftUI

enum LocalizationKeys: String {
    // MARK: - Home Case
    case homeView_button_goToSavedScreen        = "homeView_button_goToSavedScreen"
    case homeView_button_goToRandomScreen       = "homeView_button_goToRandomScreen"
    
    // MARK: - Random Dogs Case
    case randomDogsView_button_getRandomImage   = "randomDogsView_button_getRandomImage"
    case randomDogsView_button_saveDogImage     = "randomDogsView_button_saveDogImage"
    case randomDogsView_text_loading            = "randomDogsView_text_loading"
    
    // MARK: - Saved Dogs Case
    case savedDogsView_nav_title                = "savedDogsView_nav_title"
    case savedDogsView_text_noSavedImages       = "savedDogsView_text_noSavedImages"
    case savedDogsView_text_failedToLoadImage   = "savedDogsView_text_failedToLoadImage"
}

extension LocalizationKeys {
    var localized: LocalizedStringKey {
        return LocalizedStringKey(self.rawValue)
    }
}
