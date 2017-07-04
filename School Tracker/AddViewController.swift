//
//  AddViewController.swift
//  School Tracker
//
//  Created by Cognizant iMac on 01/08/16.
//  Copyright © 2016 Cognizant iMac. All rights reserved.
//

import UIKit
import CoreData

protocol AddStudentDelegate: class
{
    func userAddStudentInfo(_ name: String, standard: Int, teacherName: String, flag: Bool)
}

class AddViewController: UIViewController,UITextFieldDelegate ,UIPickerViewDataSource, UIPickerViewDelegate
{
    weak var delegate: AddStudentDelegate?
    var teacherPicker = UIPickerView()
    var stdPicker = UIPickerView()
    let toolBar = UIToolbar()
    @IBOutlet weak var addNameTextField: UITextField!
    @IBOutlet weak var addStandardTextField: UITextField!
    @IBOutlet weak var teacherTextField: UITextField!
    var teacherchoice = ""
    var stdchoice = ""
    
    var teacherArray = [NSManagedObject]()
    var filteredArray = [NSManagedObject]()
    
    let stdArray = ["1","2","3","4","5","6"]
    var flag = true
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        teacherPicker = UIPickerView(frame: CGRect(x: 0, y: 10, width: view.frame.width, height: 150))
        teacherPicker.backgroundColor = .white
        teacherPicker.delegate = self
        teacherPicker.dataSource = self
        teacherTextField.inputView = teacherPicker
        teacherPicker.tag = 0
        stdPicker = UIPickerView(frame: CGRect(x: 0, y: 10, width: view.frame.width, height: 150))
        stdPicker.backgroundColor = .white
        stdPicker.showsSelectionIndicator = true
        stdPicker.delegate = self
        stdPicker.dataSource = self
        stdPicker.tag = 1
        addStandardTextField.inputView = stdPicker
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(AddViewController.donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(AddViewController.cancelPicker))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        teacherTextField.inputAccessoryView = toolBar
        addStandardTextField.inputAccessoryView = toolBar
        addNameTextField.delegate = self
        addStandardTextField.delegate = self

    }
    
    func donePicker()
    {
        if flag
        {
            addStandardTextField.text = String(stdchoice)
            addStandardTextField.resignFirstResponder()
        }
        else
        {
            teacherTextField.text = teacherchoice
            teacherTextField.resignFirstResponder()
        }
        
    }
    
    func cancelPicker()
    {
        teacherTextField.resignFirstResponder()
        addStandardTextField.resignFirstResponder()
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        addNameTextField.resignFirstResponder()
        addStandardTextField.resignFirstResponder()
        return true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if pickerView.tag == 0
        {
            filteredArray = teacherArray.filter { $0.value(forKey: "std") as! Int == Int(addStandardTextField.text!)! }
            return filteredArray.count
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
            return (filteredArray[row].value(forKey: "teacherName") as! String)
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
            flag = false
            teacherchoice = (filteredArray[row].value(forKey: "teacherName") as! String)
            
        }
        if pickerView.tag == 1
        {
            flag = true
            stdchoice = stdArray[row]
        }
    }
    
    @IBAction func addButtonTapped(_ sender: AnyObject)
    {
        if addNameTextField.text! != "" && addStandardTextField.text! != "" && teacherchoice != ""
        {
            self.delegate?.userAddStudentInfo(addNameTextField.text!, standard: Int(addStandardTextField.text!)!, teacherName: teacherchoice, flag: true)
        }
    }

    @IBAction func cancelButtonTapped(_ sender: AnyObject)
    {
        self.delegate?.userAddStudentInfo("", standard: 0, teacherName: "", flag: false)
    }
}

