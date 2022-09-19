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
        guard  let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Could not determine appDelegate.") }
        return appDelegate.persistentContainer.viewContext
    }
}
protocol CoreDataManagerLogic: ViewContextProvider {
    func createFavorite(with params:  [String : Any ])
    func featchFavorites<T>(by predicate: String, completion:((_ fetchRequest: NSFetchRequest<NSFetchRequestResult>) -> (Void))) -> [T]
}

final class CoreDataManaager: ViewContextProvider {
    
    static var shared = CoreDataManaager()
    private init() {}
    
    //MARK: Create
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
    
    //MARK: Read
    
    func featchFavorites<T: NSManagedObject>(fromEntity: String, by predicate: String) -> [T] {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: fromEntity)
        fetchRequest.predicate = NSPredicate(format: predicate)
        
        do {
            let fetchedObjc = try viewContext.fetch(fetchRequest) as! [T]
            return fetchedObjc
            
        }catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    //MARK: Update
    //to do check favorites value // existness
    //MARK: Delete
}
