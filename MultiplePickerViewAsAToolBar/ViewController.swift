//
//  ViewController.swift
//  MultiplePickerViewAsAToolBar
//
//  Created by Nitin Bhatia on 10/12/18.
//  Copyright © 2018 Nitin Bhatia. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
   
    
    @IBOutlet weak var txt3: UITextField!
    
    @IBOutlet weak var txt2: UITextField!
    @IBOutlet weak var txt1: UITextField!
    var picker1 : UIPickerView = UIPickerView()
    var toolBar1 : UIToolbar = UIToolbar()
    var picker2 : UIPickerView = UIPickerView()
    var toolBar2 : UIToolbar = UIToolbar()
    var picker3 : UIPickerView = UIPickerView()
    var toolBar3 : UIToolbar = UIToolbar()
    var countTag : Int = 1
    var picker1Text = ["hello 1","hello 2","hello 3","hello 4"]
    var picker2Text = ["hello 2.1","hello 2.2","hello 2.3","hello 2.4"]
    var picker3Text = ["hello 3.1","hello 3.2","hello 3.3","hello 3.4"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setTextField(txt: txt1, picker: picker1, toolBar: toolBar1)
        setTextField(txt: txt2, picker: picker2, toolBar: toolBar2)
        setTextField(txt: txt3, picker: picker3, toolBar: toolBar3)

    }
    
    @objc func donePicker(_ sender:UIBarButtonItem){
        
        if ( sender.tag == 1 ) {
            if ( txt1.text == "" ) {
               txt1.text = picker1Text[0]
            }
        } else if ( sender.tag == 2 ) {
            if ( txt2.text == "" ) {
                txt2.text = picker2Text[0]
            }
        } else {
            if ( txt3.text == "" ) {
                txt3.text = picker3Text[0]
            }
        }
        
        self.view.endEditing(true)
    }
    
    @objc func cancelPicker(_ sender:UIBarButtonItem){
        print(sender.tag)
        self.view.endEditing(true)
    }
    
    //Mark:- Set pickerview and toolbar to textbox
    func setTextField(txt: UITextField, picker: UIPickerView, toolBar: UIToolbar ){
       
        picker.frame =  CGRect(x:0, y:200, width:view.frame.width, height:300)
        picker.backgroundColor = .white
        
        picker.showsSelectionIndicator = true
        picker.delegate = self
        picker.dataSource = self
        picker.tag = countTag
        
        
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action:  #selector(donePicker(_:)))
        doneButton.tag = countTag
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(cancelPicker(_:)))
        cancelButton.tag = countTag
        
        countTag += 1
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        txt.inputView = picker
        txt.inputAccessoryView = toolBar
        
    }

    
    //Mark:- Pickerview
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
            if ( pickerView.tag == 1 ) {
                return picker1Text.count
            } else if ( pickerView.tag == 2 ){
                return picker2Text.count
            } else {
                return picker3Text.count
            }
    }
    

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if ( pickerView.tag == 1 ) {
            return picker1Text[row]
        } else if ( pickerView.tag == 2 ){
            return picker2Text[row]
        } else {
            return picker3Text[row]
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if ( pickerView.tag == 1 ) {
            txt1.text = picker1Text[row]
        } else if ( pickerView.tag == 2 ){
            txt2.text = picker2Text[row]
        } else {
            txt3.text = picker3Text[row]
        }
    }

}

