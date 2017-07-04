//
//  RemoveTeacherViewController.swift
//  School Tracker
//
//  Created by Cognizant iMac on 03/08/16.
//  Copyright © 2016 Cognizant iMac. All rights reserved.
//

import UIKit
import CoreData

class RemoveTeacherViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate
{
    @IBOutlet weak var teacherNameLabel: UILabel!
    @IBOutlet weak var replacementTextField: UITextField!
    var replacementTeacherPicker = UIPickerView()
    let toolBar = UIToolbar()
    var teacherArray = [NSManagedObject]()
    var filteredTeacherArray = [NSManagedObject]()
    var teachername = " "
    var replacementTeacher = ""
    var studentsArray = [NSManagedObject]()
    @IBOutlet weak var removeTeacherButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        teacherNameLabel.text = teachername
        
        replacementTeacherPicker = UIPickerView(frame: CGRect(x: 0, y: 10, width: view.frame.width, height: 150))
        replacementTeacherPicker.backgroundColor = .white
        replacementTeacherPicker.delegate = self
        replacementTeacherPicker.dataSource = self
        replacementTextField.inputView = replacementTeacherPicker
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(AddViewController.donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(AddViewController.cancelPicker))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        replacementTextField.inputAccessoryView = toolBar
    }
   
    func donePicker()
    {
        replacementTextField.text = replacementTeacher
        replacementTextField.resignFirstResponder()
        removeTeacherButton.isEnabled = true
        updateDetails()
        
    }
    
    func cancelPicker()
    {
        replacementTextField.resignFirstResponder()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
       
        filteredTeacherArray = teacherArray.filter { $0.value(forKey: "teacherName") as! String != teachername }
        return filteredTeacherArray.count
    }
    
    func updateDetails()
    {
        for index in 0..<studentsArray.count
        {
            if studentsArray[index].value(forKey: "teacherName") as! String == teachername
            {
                //studentsArray[index].teacherName = replacementTeacher
                studentsArray[index].setValue(replacementTeacher, forKey: "teacherName")
            }
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        replacementTeacher = filteredTeacherArray[row].value(forKey: "teacherName") as! String
        return filteredTeacherArray[row].value(forKey: "teacherName") as? String
    }
    
    
    
    @IBAction func removeTeacherButtonPressed(_ sender: AnyObject)
    {
        performSegue(withIdentifier: "removeTeacher", sender: nil)
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
}
