//
//  String+Localization.swift
//  DogCollector
//
//  Created by talha heybeci on 22.07.2024.
//

import Foundation

extension String {
    var localized: String {
        return LocalizationService.shared.localizedString(forKey: self)
    }
}
