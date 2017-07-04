//
//  TeachersMO+CoreDataProperties.swift
//  School Tracker
//
//  Created by CTS BTP5NE18 on 8/24/16.
//  Copyright © 2016 Cognizant iMac. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension TeachersMO {

    @NSManaged var salary: NSNumber?
    @NSManaged var std: NSNumber?
    @NSManaged var subject: String?
    @NSManaged var teacherName: String?
    @NSManaged var studentsList: NSManagedObject?

}
