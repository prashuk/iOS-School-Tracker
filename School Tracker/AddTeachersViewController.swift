//
//  AddTeachersViewController.swift
//  School Tracker
//
//  Created by Cognizant iMac on 01/08/16.
//  Copyright © 2016 Cognizant iMac. All rights reserved.
//

import UIKit
import CoreData

protocol AddTeacherDelegate: class
{
    func userAddTeacherInfo(_ name: String, subject: String, expertise: Int, flag: Bool)
}

class AddTeachersViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate
{
    @IBOutlet weak var addTeacherNameTextField: UITextField!
    @IBOutlet weak var addTeacherSubjectTextField: UITextField!
    @IBOutlet weak var expertiseTextField: UITextField!
    let subjectArray = ["Maths", "Science", "English"]
    let stdArray = ["1","2","3","4","5","6"]
    var subjectPicker = UIPickerView()
    var stdPicker = UIPickerView()
    let toolBar = UIToolbar()
    var delegate: AddTeacherDelegate?
    var subchoice = ""
    var stdchoice = ""
    var flag = true
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        addTeacherNameTextField.delegate = self
        addTeacherSubjectTextField.delegate = self
        
        subjectPicker = UIPickerView(frame: CGRect(x: 0, y: 10, width: view.frame.width, height: 150))
        subjectPicker.backgroundColor = .white
        subjectPicker.delegate = self
        subjectPicker.dataSource = self
        addTeacherSubjectTextField.inputView = subjectPicker
        subjectPicker.tag = 0
        stdPicker = UIPickerView(frame: CGRect(x: 0, y: 10, width: view.frame.width, height: 150))
        stdPicker.backgroundColor = .white
        stdPicker.showsSelectionIndicator = true
        stdPicker.delegate = self
        stdPicker.dataSource = self
        stdPicker.tag = 1
        expertiseTextField.inputView = stdPicker
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(AddViewController.donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(AddViewController.cancelPicker))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        addTeacherSubjectTextField.inputAccessoryView = toolBar
        expertiseTextField.inputAccessoryView = toolBar
    }
    
    func donePicker()
    {
        addTeacherSubjectTextField.text = subchoice
        addTeacherSubjectTextField.resignFirstResponder()
        expertiseTextField.text = String(stdchoice)
        expertiseTextField.resignFirstResponder()
    }
    
    func cancelPicker()
    {
        addTeacherSubjectTextField.resignFirstResponder()
        expertiseTextField.resignFirstResponder()
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if pickerView.tag == 0
        {
            return subjectArray.count
        }
        if pickerView.tag == 1
        {
            return stdArray.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if pickerView.tag == 0
        {
            return subjectArray[row]
        }
        if pickerView.tag == 1
        {
            return stdArray[row]
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if pickerView.tag == 0
        {
            subchoice = subjectArray[row]
            flag = true
        }
        if pickerView.tag == 1
        {
            stdchoice = stdArray[row]
            flag = false

        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        addTeacherNameTextField.resignFirstResponder()
        addTeacherSubjectTextField.resignFirstResponder()
        expertiseTextField.resignFirstResponder()
        return true
    }
    
    @IBAction func addButtonPressed(_ sender: AnyObject)
    {
        if addTeacherNameTextField.text! != "" && addTeacherSubjectTextField.text! != "" && expertiseTextField.text! != ""
        {
            self.delegate?.userAddTeacherInfo(addTeacherNameTextField!.text!, subject: addTeacherSubjectTextField.text!, expertise: Int(expertiseTextField.text!)!, flag: true)
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: AnyObject)
    {
        self.delegate?.userAddTeacherInfo("", subject: "", expertise: 0, flag: false)
    }

}
