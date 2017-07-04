//
//  ViewController.swift
//  School Tracker
//
//  Created by Cognizant iMac on 29/07/16.
//  Copyright © 2016 Cognizant iMac. All rights reserved.
//

import UIKit
import CoreData
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddStudentDelegate, AddTeacherDelegate
{

    @IBOutlet weak var segmentToggle: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    var studentDetails = [NSManagedObject]()
    var teacherDetails = [NSManagedObject]()
    var passMarks: Int = 0
    var passCount = 0
    var students = [[String:AnyObject]]()
    var teachers = [[:]]
    var flag = true
    var flagcheck = false
    //var historyDict = [String: AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        studentDetails = [Students(std: 1, name: "Anil", noOfTests: 0, teacherName: "Krishna", mathsScore: 0, scienceScore: 0, englishScore: 0, grade: "N/A", history: [["maths": 0, "science": 0, "english": 0, "grade": "N/A"]]),
//                          Students(std: 2, name: "Ben", noOfTests: 0, teacherName: "Nancy", mathsScore: 0, scienceScore: 0, englishScore: 0, grade: "N/A", history: [["maths": 0, "science": 0, "english": 0, "grade": "N/A"]]),
//                          Students(std: 3, name: "Jack", noOfTests: 0, teacherName: "Jenifer", mathsScore: 0, scienceScore: 0, englishScore: 0, grade: "N/A", history: [["maths": 0, "science": 0, "english": 0, "grade": "N/A"]]),
//                          Students(std: 4, name: "Thomas", noOfTests: 0, teacherName: "Ravi", mathsScore: 0, scienceScore: 0, englishScore: 0, grade: "N/A", history: [["maths": 0, "science": 0, "english": 0, "grade": "N/A"]]),
//                          Students(std: 5, name: "Jimmy", noOfTests: 0, teacherName: "Ram", mathsScore: 0, scienceScore: 0, englishScore: 0, grade: "N/A", history: [["maths": 0, "science": 0, "english": 0, "grade": "N/A"]]),
//                          Students(std: 6, name: "Berny", noOfTests: 0, teacherName: "Jude", mathsScore: 0, scienceScore: 0, englishScore: 0, grade: "N/A", history: [["maths": 0, "science": 0, "english": 0, "grade": "N/A"]]),
//                          Students(std: 1, name: "Hema", noOfTests: 0, teacherName: "Krishna", mathsScore: 0, scienceScore: 0, englishScore: 0, grade: "N/A", history: [["maths": 0, "science": 0, "english": 0, "grade": "N/A"]]),
//                          Students(std: 2, name: "Steffie", noOfTests: 0, teacherName: "Nancy", mathsScore: 0, scienceScore: 0, englishScore: 0, grade: "N/A", history: [["maths": 0, "science": 0, "english": 0, "grade": "N/A"]]),
//                          Students(std: 3, name: "Johnny", noOfTests: 0, teacherName: "Jenifer", mathsScore: 0, scienceScore: 0, englishScore: 0, grade: "N/A", history: [["maths": 0, "science": 0, "english": 0, "grade": "N/A"]]),
//                          Students(std: 4, name: "Tony", noOfTests: 0, teacherName: "Ravi", mathsScore: 0, scienceScore: 0, englishScore: 0, grade: "N/A", history: [["maths": 0, "science": 0, "english": 0, "grade": "N/A"]]),
//                          Students(std: 5, name: "Priya", noOfTests: 0, teacherName: "Ram", mathsScore: 0, scienceScore: 0, englishScore: 0, grade: "N/A", history: [["maths": 0, "science": 0, "english": 0, "grade": "N/A"]]),
//                          Students(std: 6, name: "Divya", noOfTests: 0, teacherName: "Jude", mathsScore: 0, scienceScore: 0, englishScore: 0, grade: "N/A", history: [["maths": 0, "science": 0, "english": 0, "grade": "N/A"]]),
//                          Students(std: 7, name: "Sachin", noOfTests: 0, teacherName: "Krishna", mathsScore: 0, scienceScore: 0, englishScore: 0, grade: "N/A", history: [["maths": 0, "science": 0, "english": 0, "grade": "N/A"]]),
//                          Students(std: 8, name: "Michael", noOfTests: 0, teacherName: "Nancy", mathsScore: 0, scienceScore: 0, englishScore: 0, grade: "N/A", history: [["maths": 0, "science": 0, "english": 0, "grade": "N/A"]]),
//                          Students(std: 9, name: "Nash", noOfTests: 0, teacherName: "Jenifer", mathsScore: 0, scienceScore: 0, englishScore: 0, grade: "N/A", history: [["maths": 0, "science": 0, "english": 0, "grade": "N/A"]]),
//                          Students(std: 10, name: "Arun", noOfTests: 0, teacherName: "Ravi", mathsScore: 0, scienceScore: 0, englishScore: 0, grade: "N/A", history: [["maths": 0, "science": 0, "english": 0, "grade": "N/A"]]),
//                          Students(std: 7, name: "Anjali", noOfTests: 0, teacherName: "Ram", mathsScore: 0, scienceScore: 0, englishScore: 0, grade: "N/A", history: [["maths": 0, "science": 0, "english": 0, "grade": "N/A"]]),
//                          Students(std: 8, name: "Peter", noOfTests: 0, teacherName: "Jude", mathsScore: 0, scienceScore: 0, englishScore: 0, grade: "N/A", history: [["maths": 0, "science": 0, "english": 0, "grade": "N/A"]]),
//                          Students(std: 9, name: "Shreya", noOfTests: 0, teacherName: "Krishna", mathsScore: 0, scienceScore: 0, englishScore: 0, grade: "N/A", history: [["maths": 0, "science": 0, "english": 0, "grade": "N/A"]]),
//                          Students(std: 10, name: "Madhan", noOfTests: 0, teacherName: "Nancy", mathsScore: 0, scienceScore: 0, englishScore: 0, grade: "N/A", history: [["maths": 0, "science": 0, "english": 0, "grade": "N/A"]])]
        
//        teacherDetails = [ Teachers(std: 1, teacherName: "Krishna", studentsList: ["Anil","Hema"], subject: "Maths", salary: 3000),
//                           Teachers(std: 2, teacherName: "Nancy", studentsList: ["Ben","Steffie"], subject: "Science", salary: 6000),
//                           Teachers(std: 3, teacherName: "Jenifer", studentsList: ["Jack","Johnny"], subject: "English", salary: 9000),
//                           Teachers(std: 4, teacherName: "Ravi", studentsList: ["Thomas","Tony"], subject: "Maths", salary: 12000),
//                           Teachers(std: 5, teacherName: "Ram", studentsList: ["Jimmy","Priya"], subject: "Science", salary: 15000),
//                           Teachers(std: 6, teacherName: "Jude", studentsList: ["Berny","Divya"], subject: "English", salary: 18000),
//                           Teachers(std: 7, teacherName: "Ganesh", studentsList: ["Sachin","Anjali"], subject: "English", salary: 21000),
//                           Teachers(std: 8, teacherName: "Mohan", studentsList: ["Michael","Peter"], subject: "Maths", salary: 24000),
//                           Teachers(std: 9, teacherName: "Marie", studentsList: ["Nash","Shreya"], subject: "Science", salary: 27000),
//                           Teachers(std: 10, teacherName: "Tina", studentsList: ["Arun","Madhan"], subject: "English", salary: 30000)]

        
        NotificationCenter.default.addObserver(self, selector: #selector(self.removeTeacherInfo(_:)), name: NSNotification.Name(rawValue: "removeTeacherInfoID"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.removeStudentInfo(_:)), name: NSNotification.Name(rawValue: "removeStudentInfoID"), object: nil)

    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if segmentToggle.selectedSegmentIndex == 0
        {
            return studentDetails.count
        }
        if segmentToggle.selectedSegmentIndex == 1
        {
            return teacherDetails.count
        }
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! schoolDetailsCell
        if segmentToggle.selectedSegmentIndex == 0
        {
            if flagcheck == false
            {
                cell1.scoresLabel.isHidden = true
                cell1.englishImage.isHidden = true
                cell1.englishLabel.isHidden = true
                cell1.mathsImage.isHidden = true
                cell1.mathsLabel.isHidden = true
                cell1.passLabel.isHidden = true
                cell1.scienceImage.isHidden = true
                cell1.scienceLabel.isHidden = true
                cell1.statusLabel.isHidden = true
                cell1.nameLabel.text = studentDetails[indexPath.row].value(forKey: "name") as? String
            }
            if flagcheck == true
            {
                passCount = 0
                cell1.scoresLabel.isHidden = false
                cell1.englishImage.isHidden = false
                cell1.englishLabel.isHidden = false
                cell1.mathsImage.isHidden = false
                cell1.mathsLabel.isHidden = false
                cell1.passLabel.isHidden = false
                cell1.scienceImage.isHidden = false
                cell1.scienceLabel.isHidden = false
                cell1.statusLabel.isHidden = false
                cell1.nameLabel.text = studentDetails[indexPath.row].value(forKey: "name") as? String
                if studentDetails[indexPath.row].value(forKey: "mathsScore") as? Int > self.passMarks
                {
                    cell1.mathsImage.image = UIImage(named: "pass")
                    passCount += 1
                }
                else if (studentDetails[indexPath.row].value(forKey: "mathsScore") as? Int) < 0
                {
                    cell1.mathsImage.image = UIImage(named: "nil")
                    passCount = -1
                }
                else
                {
                    cell1.mathsImage.image = UIImage(named: "wrong")
                }
                if (studentDetails[indexPath.row].value(forKey: "englishScore") as? Int) > self.passMarks
                {
                    cell1.englishImage.image = UIImage(named: "pass")
                    passCount += 1
                }
                else if (studentDetails[indexPath.row].value(forKey: "englishScore") as? Int) < 0
                {
                    cell1.englishImage.image = UIImage(named: "nil")
                }
                else
                {
                    cell1.englishImage.image = UIImage(named: "wrong")
                }
                if (studentDetails[indexPath.row].value(forKey: "scienceScore") as? Int) > self.passMarks
                {
                    cell1.scienceImage.image = UIImage(named: "pass")
                    passCount += 1
                }
                else if (studentDetails[indexPath.row].value(forKey: "scienceScore") as? Int) < 0
                {
                    cell1.scienceImage.image = UIImage(named: "nil")
                }
                else
                {
                    cell1.scienceImage.image = UIImage(named: "wrong")
                }
                cell1.passLabel.text = (studentDetails[indexPath.row].value(forKey: "grade") as? String)
            }
            return cell1
        }
        else
        {
            cell1.isHidden = true
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! TeacherDetailsCell
            cell2.teacherNamelabel.text = teacherDetails[indexPath.row].value(forKey: "teacherName") as? String
            return cell2
        }
        
    }
   

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if segmentToggle.selectedSegmentIndex == 0
        {
            self.performSegue(withIdentifier: "selectSegue", sender: indexPath)
        }
        if segmentToggle.selectedSegmentIndex == 1
        {
            self.performSegue(withIdentifier: "selectTeacherSegue", sender: indexPath)
        }
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "selectSegue"
        {
            let selectVC = segue.destination as! SelectViewController
            let indexPath : IndexPath = self.tableView.indexPathForSelectedRow!
            selectVC.name = studentDetails[indexPath.row].value(forKey: "name") as! String
            selectVC.std = String(studentDetails[indexPath.row].value(forKey: "std") as! Int)
            selectVC.teacher = studentDetails[indexPath.row].value(forKey: "teacherName") as! String
            selectVC.grade = studentDetails[indexPath.row].value(forKey: "grade") as! String
            selectVC.numOfTests = String(studentDetails[indexPath.row].value(forKey: "noOfTests") as! Int)
            selectVC.teacherArray = teacherDetails
            selectVC.studentsArray = studentDetails
        }
        
        if segue.identifier == "selectTeacherSegue"
        {
            let selectVC = segue.destination as! SelectTeachersViewController
            let indexPath : IndexPath = self.tableView.indexPathForSelectedRow!
            selectVC.name = teacherDetails[indexPath.row].value(forKey: "teacherName") as! String
            selectVC.std = String(teacherDetails[indexPath.row].value(forKey: "std") as! Int)
            selectVC.sub = teacherDetails[indexPath.row].value(forKey: "subject") as! String
            selectVC.salary = String(teacherDetails[indexPath.row].value(forKey: "salary") as! Int)
            selectVC.studList = studentDetails
            selectVC.teacherArray = teacherDetails
            selectVC.studentsArray = studentDetails
        }

        
        if segue.identifier == "addSegue"
        {
            if segmentToggle.selectedSegmentIndex == 0
            {
                let addVC = segue.destination as! AddViewController
                addVC.delegate = self
                addVC.teacherArray = teacherDetails
            }
        }
        
        if segue.identifier == "addTeacherSegue"
        {
            if segmentToggle.selectedSegmentIndex == 1
            {
                let addVC = segue.destination as! AddTeachersViewController
                addVC.delegate = self
             }
        }
    }


    @IBAction func segmentToggleChanged(_ sender: AnyObject)
    {
        tableView.reloadData()
        if segmentToggle.selectedSegmentIndex == 0
        {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Students")
            let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
            let sortDescriptors = [sortDescriptor]
            fetchRequest.sortDescriptors = sortDescriptors
            
            do
            {
                let results = try managedContext.fetch(fetchRequest)
                studentDetails = results as! [NSManagedObject]
                tableView.reloadData()
                //studentDetails = studentDetails.sort{($1.valueForKey("name") as! String) > ($0.valueForKey("name") as! String)}
            }
            catch let error as NSError
            {
                print("Could not fetch \(error), \(error.userInfo)")
            }
            
        }
        if segmentToggle.selectedSegmentIndex == 1
        {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Teachers")
            let sortDescriptor = NSSortDescriptor(key: "teacherName", ascending: true)
            let sortDescriptors = [sortDescriptor]
            fetchRequest.sortDescriptors = sortDescriptors
            do
            {
                let results = try managedContext.fetch(fetchRequest)
                teacherDetails = results as! [NSManagedObject]
                //teacherDetails = teacherDetails.sort{$1.valueForKey("teacherName") as! String > $0.valueForKey("teacherName") as! String}
            }
            catch let error as NSError
            {
                print("Could not fetch \(error), \(error.userInfo)")
            }
        }
        tableView.reloadData()
    }
    @IBAction func addButtonPressed(_ sender: AnyObject)
    {
        if segmentToggle.selectedSegmentIndex == 0
        {
            self.performSegue(withIdentifier: "addSegue", sender: self)
        }
        
        if segmentToggle.selectedSegmentIndex == 1
        {
            self.performSegue(withIdentifier: "addTeacherSegue", sender: self)
        }
    }
    
    @IBAction func conductTestsButtonPressed(_ sender: AnyObject)
    {
        var inputTextField: UITextField?
        let passMarkPrompt = UIAlertController(title: "Cut-Off Mark", message: "Set Exam Pass Marks", preferredStyle: UIAlertControllerStyle.alert)
        passMarkPrompt.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: { (action) -> Void in
            self.flag = false
        }))
        passMarkPrompt.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) -> Void in
            self.passMarks = Int(inputTextField!.text!)!
            self.flag = true
            if self.flag
            {
                let alertController = UIAlertController(title: "Alert", message: "Tests Has Been Done", preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "OK", style: .default)
                {
                    (action:UIAlertAction!) in
                    for index in 0..<self.studentDetails.count
                    {
                        self.studentDetails[index].setValue(((self.studentDetails[index].value(forKey: "noOfTests") as! Int)+1), forKey: "noOfTests")
                        self.studentDetails[index].setValue(self.randomNumber(), forKey: "mathsScore")
                        self.studentDetails[index].setValue(self.randomNumber(), forKey: "scienceScore")
                        self.studentDetails[index].setValue(self.randomNumber(), forKey: "englishScore")
                        
                        if (self.studentDetails[index].value(forKey: "mathsScore") as? Int) > self.passMarks && (self.studentDetails[index].value(forKey: "englishScore") as? Int) > self.passMarks && (self.studentDetails[index].value(forKey: "scienceScore") as? Int) > self.passMarks
                        {
                            self.studentDetails[index].setValue("Pass", forKey: "grade")
                        }
                        else if (self.studentDetails[index].value(forKey: "mathsScore") as? Int) < self.passMarks && (self.studentDetails[index].value(forKey: "englishScore") as? Int) < self.passMarks && (self.studentDetails[index].value(forKey: "scienceScore") as? Int) < self.passMarks
                        {
                            self.studentDetails[index].setValue("Attention Needed", forKey: "grade")
                        }
                        else
                        {
                            self.studentDetails[index].setValue("Fail", forKey: "grade")
                        }
                        //self.historyDict = ["maths": self.studentDetails[index].mathsScore, "science": self.studentDetails[index].scienceScore, "english": self.studentDetails[index].englishScore, "grade": self.studentDetails[index].grade]
                        //self.studentDetails[index].history.append(self.historyDict)
                    }
                    self.tableView.reloadData()
                }
                alertController.addAction(OKAction)
                self.present(alertController, animated: true, completion:nil)
                self.tableView.reloadData()
                self.flagcheck = true

            }
        }))
        passMarkPrompt.addTextField(configurationHandler: {(textField: UITextField!) in
            textField.placeholder = "Pass Marks"
            inputTextField = textField
        })
        present(passMarkPrompt, animated: true, completion: nil)
        tableView.reloadData()
    }
    
    func randomNumber() -> Int
    {
        return Int(arc4random_uniform(100))
    }
    
    
    func userAddStudentInfo(_ name: String, standard: Int, teacherName: String, flag: Bool)
    {
        if flag
        {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext
            let entity =  NSEntityDescription.entity(forEntityName: "Students", in: managedContext)
            let person = NSManagedObject(entity: entity!, insertInto: managedContext)
            person.setValue(standard, forKey: "std")
            person.setValue(name, forKey: "name")
            person.setValue(teacherName, forKey: "teacherName")
            person.setValue(0, forKey: "noOfTests")
            person.setValue(-1, forKey: "mathsScore")
            person.setValue(-1, forKey: "englishScore")
            person.setValue(-1, forKey: "scienceScore")
            person.setValue("N/A", forKey: "grade")
            do
            {
                try managedContext.save()
                studentDetails.append(person)
            }
            catch let error as NSError
            {
                print(error)
            }
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func userAddTeacherInfo(_ name: String, subject: String, expertise: Int, flag: Bool)
    {
        if flag
        {
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext
            let entity =  NSEntityDescription.entity(forEntityName: "Teachers", in: managedContext)
            let person = NSManagedObject(entity: entity!, insertInto: managedContext)
            person.setValue(name, forKey: "teacherName")
            person.setValue(subject, forKey: "subject")
            person.setValue(expertise, forKey: "std")
            person.setValue(expertise*1000, forKey: "salary")
            do
            {
                try managedContext.save()
                teacherDetails.append(person)
            }
            catch let error as NSError
            {
                print(error)
            }

        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func removeTeacherInfo(_ notification: Notification)
    {
//        let dict = notification.object as! [String: AnyObject]
//        teacherDetails = dict["teachersArray"] as! [Teachers]
//        studentDetails = dict["studentsArray"] as! [Students]
    }
    
    func removeStudentInfo(_ notification: Notification)
    {
//        let dict = notification.object as! [String: AnyObject]
//        teacherDetails = dict["teachersArray"] as! [Teachers]
//        studentDetails = dict["studentsArray"] as! [Students]
    }
    
    func displayMyAlertMessage(_ userMessage:String)
    {
        let myAlert = UIAlertController(title:"Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion:nil);
    }

    override func viewWillAppear(_ animated: Bool)
    {
        tableView.reloadData()
        super.viewWillAppear(animated)
        if segmentToggle.selectedSegmentIndex == 0
        {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Students")
            let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
            let sortDescriptors = [sortDescriptor]
            fetchRequest.sortDescriptors = sortDescriptors
            do
            {
                let results = try managedContext.fetch(fetchRequest)
                studentDetails = results as! [NSManagedObject]
                //studentDetails = studentDetails.sort{$1.valueForKey("name") as! String > $0.valueForKey("name") as! String}
            }
            catch let error as NSError
            {
                print("Could not fetch \(error), \(error.userInfo)")
            }

        }
        if segmentToggle.selectedSegmentIndex == 1
        {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Teachers")
            let sortDescriptor = NSSortDescriptor(key: "teacherName", ascending: true)
            let sortDescriptors = [sortDescriptor]
            fetchRequest.sortDescriptors = sortDescriptors
            do
            {
                let results = try managedContext.fetch(fetchRequest)
                teacherDetails = results as! [NSManagedObject]
                //teacherDetails = teacherDetails.sort{$1.valueForKey("teacherName") as! String > $0.valueForKey("teacherName") as! String}
            }
            catch let error as NSError
            {
                print("Could not fetch \(error), \(error.userInfo)")
            }
        }
        tableView.reloadData()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue)
    {
        if segue.identifier == "removeStudent"
        {
            let indexPath = tableView.indexPathForSelectedRow
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext
            
            
            do
            {
                managedContext.delete(studentDetails[(indexPath?.row)!] as NSManagedObject)
                studentDetails.remove(at: indexPath!.row)
                try managedContext.save()
                self.tableView.deleteRows(at: [indexPath!], with: .left)
            }
            catch let error as NSError
            {
                print("Could not fetch \(error), \(error.userInfo)")
            }
        }
        if segue.identifier == "removeTeacher"
        {
            let indexPath = tableView.indexPathForSelectedRow
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext
            
            
            do
            {
                managedContext.delete(teacherDetails[(indexPath?.row)!] as NSManagedObject)
                teacherDetails.remove(at: indexPath!.row)
                try managedContext.save()
                self.tableView.deleteRows(at: [indexPath!], with: .left)
            }
            catch let error as NSError
            {
                print("Could not fetch \(error), \(error.userInfo)")
            }
        }
        tableView.reloadData()
    }
}

