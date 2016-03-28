//
//  Task.swift
//  haveYou
//
//  Created by Canyon Boak on 3/17/16.
//  Copyright © 2016 Canyon Boak. All rights reserved.
//

import Foundation
import CoreData


class Task: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    class var entityName: NSString {return "Task"}
    
    override func awakeFromInsert() {
        super.awakeFromInsert()
        taskMetaData = NSEntityDescription.insertNewObjectForEntityForName(TaskMetaData.entityName as String, inManagedObjectContext: managedObjectContext!) as? TaskMetaData
    }

}