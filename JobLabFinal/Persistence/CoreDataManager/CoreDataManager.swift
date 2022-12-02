//
//  CoreDataManager.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 18.09.22.
//

import Foundation
import CoreData
import UIKit

protocol ViewContextProvider: AnyObject {
    var viewContext: NSManagedObjectContext { get }
}

extension ViewContextProvider {
    var viewContext: NSManagedObjectContext {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

        return appDelegate.persistentContainer.viewContext
    }
}
protocol CoreDataManagerLogic: ViewContextProvider {
    func createFavorite(with params: [String: Any ])
    func featchFavorites<T>(by predicate: String, completion: ((_ fetchRequest: NSFetchRequest<NSFetchRequestResult>) -> Void)) -> [T]
}

final class CoreDataManaager: ViewContextProvider {

    static var shared = CoreDataManaager()
    private init() {}

    // MARK: Create

    func create(from params: [ String: Any], toEntity: String) {

        guard  let entity = NSEntityDescription.entity(forEntityName: toEntity,
                                                       in: viewContext) else { return }
        let noteObj = NSManagedObject(entity: entity,
                                      insertInto: viewContext)
        for (key, value) in params {
            print("KEY: \(key) VALUE: \(value)")
            noteObj.setValue(value, forKey: key)
        }
        do {
            try viewContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }

    // MARK: Read

    func featchFavorites<T: NSManagedObject>(fromEntity: String, by predicate: String, completion: @escaping([T]) -> Void) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: fromEntity)
        fetchRequest.predicate = NSPredicate(format: predicate)
        do {
            let fetchedObjcs = try viewContext.fetch(fetchRequest) as? [T]
            guard let fetchedObjcs = fetchedObjcs else { return }
            completion(fetchedObjcs)
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }

    // MARK: Delete

    func deleteAllData(entity: String) {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entity)
        do {
            let results = try viewContext.fetch(fetchRequest)
            for object in results {
                viewContext.delete(object)
                try viewContext.save()
                print("1111111 Deleted")
            }
        } catch let error {
            print("Detele all data in \(entity) error :", error)
        }
    }
   // MARK: delete by id

    func deleteJobObject(from entity: String, by predicate: String ) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.predicate = NSPredicate(format: predicate)
        do {
            let objects = try viewContext.fetch(fetchRequest)
            for object in objects {
                viewContext.delete(object as! NSManagedObject)
                print(objects, object)
            }
        } catch let error as NSError {
            print(error)
        }
    }
}
