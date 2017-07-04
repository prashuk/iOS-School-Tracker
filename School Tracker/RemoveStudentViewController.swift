//
//  RemoveStudentViewController.swift
//  School Tracker
//
//  Created by Cognizant iMac on 03/08/16.
//  Copyright © 2016 Cognizant iMac. All rights reserved.
//

import UIKit
import CoreData

class RemoveStudentViewController: UIViewController
{
    var name = ""
    var teachername = ""
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var teacherNameLabel: UILabel!
    var teacherArray = [NSManagedObject]()
    var studentsArray = [NSManagedObject]()
    var filteredStudentsArray = [NSManagedObject]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        nameLabel.text = name
        teacherNameLabel.text = teachername
    }
    
    @IBAction func removeStudentButton(_ sender: AnyObject)
    {
//        NSNotificationCenter.defaultCenter().postNotificationName("removeStudentInfoID", object: dict)
//        for index in 0...(self.navigationController?.viewControllers.count)!
//        {
//            if(self.navigationController?.viewControllers[index].isKindOfClass(ViewController) == true)
//            {
//                self.navigationController?.popToViewController(self.navigationController!.viewControllers[index] as! ViewController, animated: true)
//                break;
//            }
//        }
        
        performSegue(withIdentifier: "removeStudent", sender: nil)
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
}
