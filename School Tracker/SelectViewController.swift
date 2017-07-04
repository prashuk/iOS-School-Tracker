//
//  SelectViewController.swift
//  School Tracker
//
//  Created by Cognizant iMac on 01/08/16.
//  Copyright © 2016 Cognizant iMac. All rights reserved.
//

import UIKit
import CoreData

class SelectViewController: UIViewController
{

    @IBOutlet weak var nameValueLabel: UILabel!
    @IBOutlet weak var standardValueLabel: UILabel!
    @IBOutlet weak var teacherSubValueLabel: UILabel!
    @IBOutlet weak var gradeValueLabel: UILabel!
    @IBOutlet weak var numberOfTestsLabel: UILabel!

    var name = ""
    var std = ""
    var teacher = ""
    var grade = ""
    var numOfTests = ""
    var teacherArray = [NSManagedObject]()
    var studentsArray = [NSManagedObject]()


    @IBOutlet weak var titleLabel: UILabel!
       
    override func viewDidLoad()
    {
        super.viewDidLoad()
        displayStudentDetails()
    }
    
    func displayStudentDetails()
    {
        titleLabel.text = "\(name)'s Details "
        nameValueLabel.text = name
        standardValueLabel.text = std
        teacherSubValueLabel.text = teacher
        gradeValueLabel.text = grade
        numberOfTestsLabel.text = numOfTests
    }
    
    @IBAction func removeButtonPressed(_ sender: AnyObject)
    {
        self.performSegue(withIdentifier: "removeStudentSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "removeStudentSegue"
        {
            let removeVC = segue.destination as! RemoveStudentViewController
            removeVC.name = name
            removeVC.teachername = teacher
            removeVC.studentsArray = studentsArray
            removeVC.teacherArray = teacherArray
        }
    }
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    

}
