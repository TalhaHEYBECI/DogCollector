//
//  LocalizationService.swift
//  DogCollector
//
//  Created by talha heybeci on 22.07.2024.
//

import Foundation

protocol LocalizationServiceProtocol {
    func localizedString(forKey key: String) -> String
}

class LocalizationService: LocalizationServiceProtocol {
    static let shared = LocalizationService()
    
    private init() {}

    func localizedString(forKey key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
}
