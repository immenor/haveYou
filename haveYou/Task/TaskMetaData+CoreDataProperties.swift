//
//  TaskMetaData+CoreDataProperties.swift
//  haveYou
//
//  Created by Canyon Boak on 3/17/16.
//  Copyright © 2016 Canyon Boak. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension TaskMetaData {

    @NSManaged var dueDate: NSDate?
    @NSManaged var addedDate: NSDate?
    @NSManaged var lastReviewDate: NSDate?
    @NSManaged var lastAction: NSNumber?
    @NSManaged var task: Task?

}
