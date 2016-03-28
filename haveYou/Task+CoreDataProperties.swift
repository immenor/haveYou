//
//  Task+CoreDataProperties.swift
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

extension Task {

    @NSManaged var desc: String?
    @NSManaged var completed: NSNumber?
    @NSManaged var taskMetaData: TaskMetaData?

}
