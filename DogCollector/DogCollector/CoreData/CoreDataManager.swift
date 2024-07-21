//
//  CoreDataManager.swift
//  DogCollector
//
//  Created by talha heybeci on 21.07.2024.
//

import CoreData
import UIKit

class CoreDataManager {

    static let shared = CoreDataManager()

    var context: NSManagedObjectContext

    private init() {
        context = CoreDataStack.shared.context
    }

    // MARK: - Create

    func createDogImage(image: UIImage, url: String?) {
        let dogImage = DogImageEntity(context: context)
        dogImage.id = UUID()
        dogImage.url = url
        dogImage.imageData = image.pngData()
        saveContext()
    }

    // MARK: - Fetch

    func fetchAllDogImages() -> [DogImageEntity] {
        let fetchRequest: NSFetchRequest<DogImageEntity> = DogImageEntity.fetchRequest()
        do {
            let dogImages = try context.fetch(fetchRequest)
            return dogImages
        } catch {
            print("Failed to fetch dog images: \(error)")
            return []
        }
    }

    // MARK: - Save context

    private func saveContext() {
        CoreDataStack.shared.saveContext()
    }
}
