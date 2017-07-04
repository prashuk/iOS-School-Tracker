//
//  StudentsMO+CoreDataProperties.swift
//  School Tracker
//
//  Created by CTS BTP5NE18 on 8/22/16.
//  Copyright © 2016 Cognizant iMac. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension StudentsMO {

    @NSManaged var englishScore: NSNumber?
    @NSManaged var grade: String?
    @NSManaged var history: String?
    @NSManaged var mathsScore: NSNumber?
    @NSManaged var name: String?
    @NSManaged var noOfTests: NSNumber?
    @NSManaged var scienceScore: NSNumber?
    @NSManaged var std: NSNumber?
    @NSManaged var teacherName: String?

}
