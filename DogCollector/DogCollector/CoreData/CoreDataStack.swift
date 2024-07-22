//
//  CoreDataStack.swift
//  DogCollector
//
//  Created by talha heybeci on 21.07.2024.
//

import CoreData

class CoreDataStack {

    // MARK: - Properties
    static let shared = CoreDataStack()

    // MARK: - Initialization
    private init() {}

    // MARK: - Persistent Container
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DogCollector")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Context
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    // MARK: - Save Context
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                print("Context saved successfully.")
            } catch {
                let nserror = error as NSError
                print("Failed to save context: \(nserror), \(nserror.userInfo)")
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
