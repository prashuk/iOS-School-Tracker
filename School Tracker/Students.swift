//
//  Students.swift
//  School Tracker
//
//  Created by Cognizant iMac on 02/08/16.
//  Copyright © 2016 Cognizant iMac. All rights reserved.
//

import Foundation

class Students
{
    var std: Int
    var name: String
    var noOfTests: Int
    var teacherName: String
    var mathsScore: Int
    var scienceScore: Int
    var englishScore: Int
    var grade: String
    //var history: [[String: AnyObject]]
    
    init(std: Int, name : String, noOfTests : Int, teacherName : String, mathsScore : Int, scienceScore : Int, englishScore : Int, grade : String/*,history: [[String: AnyObject]]*/)
    {
        self.std = std
        self.name = name
        self.noOfTests = noOfTests
        self.teacherName = teacherName
        self.mathsScore = mathsScore
        self.scienceScore = scienceScore
        self.englishScore = englishScore
        self.grade = grade
        //self.history = history
    }
}

class Teachers
{
    var std : Int
    var teacherName : String
    var subject : String
    var salary : Int

    init(std: Int, teacherName : String, subject : String, salary : Int)
    {
        self.std = std
        self.teacherName = teacherName
        self.subject = subject
        self.salary = salary
    }
}