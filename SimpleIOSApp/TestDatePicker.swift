//
//  TestDatePicker.swift
//  SimpleIOSApp
//
//  Created by bruce on 2019/3/29.
//  Copyright © 2019 bruce. All rights reserved.
//

import Foundation
import UIKit


class TestDatePicker: UIViewController {
    let datePicker: UIDatePicker = {
    let datePicker: UIDatePicker = UIDatePicker()
    // Set some of UIDatePicker properties
    datePicker.timeZone = NSTimeZone.local
    datePicker.backgroundColor = UIColor.white
    
    // Add an event to call onDidChangeDate function when value is changed.
    datePicker.addTarget(self, action: #selector(TestDatePicker.datePickerValueChanged(_:)), for: .valueChanged)
    return datePicker
    }()
    let inputField: UITextView = {
    let inputField = UITextView()
    inputField.text = "2018/01/01"
    return inputField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.frame = CGRect(x: 10, y: 50, width: self.view.frame.width, height: 200)
        inputField.frame = CGRect(x: 0, y: 100, width: self.view.frame.width, height: 100)
        inputField.inputView = datePicker
        // Add DataPicker to the view
        //self.view.addSubview(datePicker)
        self.view.addSubview(inputField)
        
    }
    
    
    
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker){
        
        // Create date formatter
        let dateFormatter: DateFormatter = DateFormatter()
        
        // Set date format
        dateFormatter.dateFormat = "MM/dd/yyyy hh:mm a"
        
        // Apply date format
        let selectedDate: String = dateFormatter.string(from: sender.date)
        inputField.text = selectedDate
        print("Selected value \(selectedDate)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
