//
//  SelectTeachersViewController.swift
//  School Tracker
//
//  Created by Cognizant iMac on 01/08/16.
//  Copyright © 2016 Cognizant iMac. All rights reserved.
//

import UIKit
import CoreData

class SelectTeachersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameValueLabel: UILabel!
    @IBOutlet weak var stdValueLabel: UILabel!
    @IBOutlet weak var subValueLabel: UILabel!
    @IBOutlet weak var salaryValueLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    var name = ""
    var std = ""
    var sub = ""
    var salary = ""
    var studList = [NSManagedObject]()
    var teacherArray = [NSManagedObject]()
    var studentsArray = [NSManagedObject]()

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        displayStudentDetails()
    }
    
    func displayStudentDetails()
    {
        titleLabel.text = "Teacher \(name)'s Details "
        nameValueLabel.text = name
        stdValueLabel.text = std
        subValueLabel.text = sub
        salaryValueLabel.text = salary
        tableView.tableFooterView = UIView()
        tableView.allowsSelection = false
        tableView.separatorColor = UIColor.clear
    }

    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        studList = studList.filter{ $0.value(forKey: "teacherName") as! String == name }
        return studList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "selectCell", for: indexPath) as! selectTeacherTableViewCell
        cell1.studentsListLabel.text = studList[indexPath.row].value(forKey: "name") as? String
        return cell1
    }

    @IBAction func removeTeacherButtonPressed(_ sender: AnyObject)
    {
        self.performSegue(withIdentifier: "removeTeacherSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "removeTeacherSegue"
        {
            let removeVC = segue.destination as! RemoveTeacherViewController
            removeVC.teachername = name
            removeVC.teacherArray = teacherArray
            removeVC.studentsArray = studentsArray
        }
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
}
