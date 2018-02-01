//
//  SettingViewController.swift
//  DClock
//
//  Created by Sirak Zeray on 1/26/18.
//  Copyright © 2018 Sirak Zeray. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    
     // Color values
     let greenColor = UIColor(red:0.03, green:0.96, blue:0.24, alpha:1.0)
    let redcolor = UIColor(red:1.00, green:0.00, blue:0.00, alpha:1.0)
   let bluecolor = UIColor(red:0.26, green:0.49, blue:0.95, alpha:1.0)
   let limeGreen = UIColor(red:0.21, green:0.61, blue:0.36, alpha:1.0)
    
  // Getting and Setting picker value
    
   
     let defualt = UserDefaults.standard
     var pickedRow : Int = 1
     let allTimeZone = NSTimeZone.abbreviationDictionary
     var currentColor  = UIColor.red
     var pickedTimeZone : String?
     var nameOfDictionary : [String]?
     var idofDictionary : [String]?
    var idofDictionarySent : String?
    
    
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
          nameOfDictionary = Array(allTimeZone.values)
        return nameOfDictionary![row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         nameOfDictionary = Array(allTimeZone.values)
        return nameOfDictionary!.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         nameOfDictionary = Array(allTimeZone.values)
         idofDictionary = Array(allTimeZone.keys)
        pickedRow = pickerView.selectedRow(inComponent: 0)
        defualt.set(pickedRow, forKey: "pickedrow")
        
        pickedTimeZone = nameOfDictionary![row]
        defualt.set(pickedTimeZone, forKey: "pickedTimeZoneValue")
        
        idofDictionarySent = idofDictionary![row]
        defualt.set(idofDictionarySent, forKey: "pickedTimeZoneValueID")
        
        }

    
    
    @IBAction func greenBotton(_ sender: Any) {
         let greenColor = UIColor(red:0.03, green:0.96, blue:0.24, alpha:1.0)

        let colorData = NSKeyedArchiver.archivedData(withRootObject: greenColor) as NSData?
       defualt.set(colorData, forKey: "colorSet")
    
    }
    
    
    
    @IBAction func redButton(_ sender: Any) {
        let colorData = NSKeyedArchiver.archivedData(withRootObject: redcolor) as NSData?
        defualt.set(colorData, forKey: "colorSet")
        
    }
    
    
    
    @IBAction func blueBotton(_ sender: Any) {
        let colorData = NSKeyedArchiver.archivedData(withRootObject: bluecolor) as NSData?
        defualt.set(colorData, forKey: "colorSet")
    }
    
    
    
    @IBAction func limeGreenButton(_ sender: Any) {
        let colorData = NSKeyedArchiver.archivedData(withRootObject: limeGreen) as NSData?
        defualt.set(colorData, forKey: "colorSet")
    }
    
    
    
    @IBAction func HourSwitch(_ sender: UISwitch) {
        
      defualt.set(sender.isOn, forKey: "hourSwitch")
        
    }
    
    @IBOutlet weak var SwitchOnOff: UISwitch!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//  SETTING 12 HOUR DEFUALT
        
        if let setTime = defualt.value(forKey: "hourSwitch") {
            SwitchOnOff.isOn = setTime as! Bool
        }
        
// SETTING TIMEZONE DEFUALT
        if let setTimeZone = defualt.value(forKey: "pickedrow"){
            pickerView.selectRow(setTimeZone as! Int, inComponent: 0, animated: false)
        }
        
// SETTING COLOR DEFUALT
        if let setcolor = defualt.value(forKey: "colorSet") {
            let colorUI = NSKeyedUnarchiver.unarchiveObject(with: setcolor as! Data) as? UIColor
            currentColor = colorUI!
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    @IBAction func doneBotton(_ sender: Any) {
 dismiss(animated: true, completion: nil)
        }
  
    

  

    
}
