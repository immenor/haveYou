//
//  HYDataHandler.swift
//  haveYou
//
//  Created by Canyon Boak on 3/17/16.
//  Copyright © 2016 Canyon Boak. All rights reserved.
//

import Foundation
import CoreData
import UIKit

private let _HYDataHandlerSharedInstance = HYDataHandler()

class HYDataHandler: NSObject {

    // Mark: - Object Lifecycle
    
    class var sharedInstance: HYDataHandler {
        return _HYDataHandlerSharedInstance
    }
    
    // Mark: - Class Functions
    
    class func completeTask(task: Task, context: NSManagedObjectContext) {
        task.completed = true
        
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
    }
    
    class func remindMeLater(task: Task, context: NSManagedObjectContext) {
        task.taskMetaData?.dueDate = NSDate().dateByAddingTimeInterval(1)
        
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
    }

    
    class func addNewTaskWithDescription(desc: String, context: NSManagedObjectContext, dueDate: NSDate) {
        
        let task = NSEntityDescription.insertNewObjectForEntityForName(Task.entityName as String, inManagedObjectContext: context) as! Task
        
        if let metaData = task.taskMetaData {
            metaData.addedDate = NSDate()
            metaData.dueDate = dueDate
            metaData.task!.desc = desc
        }
        
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
    }
    
    class func fetchCurrentTask(context: NSManagedObjectContext) -> Task? {
        let request: NSFetchRequest = NSFetchRequest(entityName: "Task")
        request.returnsObjectsAsFaults = false
        
        request.predicate = NSPredicate(format: "completed == %@", 0)
        // Sort by priority descending
        
        let sortDescriptor = NSSortDescriptor(key: "taskMetaData.addedDate", ascending: true)
        let sortDescriptors = [sortDescriptor]
        
        request.sortDescriptors = sortDescriptors
        request.fetchLimit = 10
        
        
        do {
            let results = try context.executeFetchRequest(request) as? [Task]
            
            if let r = results {
                if (r.count > 0) {
                    // For now just return the last task
                    // This is where we can determine which task is the top priority
                    return r[r.count - 1]
                }
            }
            
        } catch {
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        return nil
    }
    
    // Mark: - Private Functions
}