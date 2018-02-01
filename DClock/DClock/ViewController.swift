//
//  ViewController.swift
//  DClock
//
//  Created by Sirak Zeray on 1/22/18.
//  Copyright © 2018 Sirak Zeray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   
    
    @IBOutlet weak var firstNumber: DigitalNumber!
    
    @IBOutlet weak var secondNumber: DigitalNumber!
    
    @IBOutlet weak var secondDots: TwoDots!
    
    @IBOutlet weak var thirdNumber: DigitalNumber!
    
    @IBOutlet weak var fourthNumber: DigitalNumber!
    
    @IBOutlet weak var firstSec: NumberWithAm!
    
    @IBOutlet weak var secondSec: NumberWithAm!
    
    @IBOutlet weak var labelDate: UILabel!
    
    
    @IBAction func settingButton(_ sender: Any) {
        
      
        
    }
    var timer = Timer()
    var date: Date?
    var counter = 0
    var currentDate = NSData()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: (#selector(ViewController.updateAll)) , userInfo: nil, repeats: true)
        
          Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: (#selector(ViewController.microSecond)) , userInfo: nil, repeats: true)

        print(TwelveHour()["amPm"])

    }
    
    
    // Getting Date as an Number
    func getTodayDate() -> [String : Int]  {
        date = Date()
        let calender = Calendar.current
        let components = calender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date!)
        
        let day = components.day
        
        
        let currentDate : [String : Int] = [ "day" :day!  ]
        
        return currentDate as [String : Int]
        
    }
    
    
    
    
    func twentyFour() -> [String: String]  {
        date = Date()
        
        let pickedTimeZoneID = UserDefaults.standard.string(forKey: "pickedTimeZoneValueID")
        let dateFormatterOne = DateFormatter()
        
        dateFormatterOne.timeZone = NSTimeZone(abbreviation: "\(pickedTimeZoneID!)")! as TimeZone
        
        
        dateFormatterOne.dateFormat = "HH"
        let tweleveHour = dateFormatterOne.string(from: date!)
        let dateFormatterTwo = DateFormatter()
        dateFormatterTwo.dateFormat = "aa"
        let amOrPm = dateFormatterTwo.string(from: date!)
        let dateFormatterThree = DateFormatter()
        dateFormatterThree.timeZone = NSTimeZone(abbreviation: "\(pickedTimeZoneID!)")! as TimeZone
        dateFormatterThree.dateFormat = "mm"
        let minuites = dateFormatterThree.string(from: date!)
        
        let dataformatterFour = DateFormatter()
        dataformatterFour.dateFormat = "ss"
        dataformatterFour.timeZone = NSTimeZone(abbreviation: "\(pickedTimeZoneID!)")! as TimeZone
        let seconds = dataformatterFour.string(from: date!)
        
        
        
        
        return [ "hour24" : tweleveHour , "amPm" : amOrPm , "minuites" : minuites, "second" : seconds]
    }
    
    
    
    // Getting Month As A String
    func mounthAndDayString() -> [String : String] {
        date = Date()
        let dateFormatter = DateFormatter()
        let dateFormatterTwo = DateFormatter()
        let dateFormatterThree = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        dateFormatterTwo.dateFormat = "EEEE"
        dateFormatterThree.dateFormat = "aa"
        
        let nameOfMonth = dateFormatter.string(from: date!)
        let nameOfDay = dateFormatterTwo.string(from: date!)
        let amOrPm = dateFormatterThree.string(from: date!)
        return ["month" : nameOfMonth , "day" :nameOfDay, "amOrPm" : amOrPm ]
    }
    
    
    
    var firstDigit = 0
        var secondDigit = 0
    
    @objc func getSeconds() {
         let seconds  = twentyFour()["second"]
        let secondInt = Int(seconds!)
        if seconds?.count == 1 {
            firstDigit = 0
            secondDigit = secondInt!
        } else {
            firstDigit = secondInt!/10
            secondDigit = secondInt! % 10
        }
        
        
        firstSec.numbers.setNumber(no: firstDigit)
        secondSec.numbers.setNumber(no: secondDigit)
        
    }
    
    @objc func updateAll(){
        firstNumber.colorOfNumber()
        secondNumber.colorOfNumber()
        thirdNumber.colorOfNumber()
        fourthNumber.colorOfNumber()
        firstSec.numbers.colorOfNumber()
        secondSec.numbers.colorOfNumber()
        firstSec.colorOfAmorPm()
        secondSec.colorOfAmorPm()
  
        let  tweleveOn = UserDefaults.standard.value(forKey: "hourSwitch")
        if tweleveOn as! Int == 0 {
            
            getMinitues()
            getHours()
            getSeconds()

        } else {
            
        getHoursin12OnDigit()
        TwelevegetMinitues()
        TwelevegetSeconds()
     
        }
        
        labelDate.text = " \(mounthAndDayString()["day"]!), \(mounthAndDayString()["month"]!)  \(getTodayDate()["day"]!)"
        let  dataColor = UserDefaults.standard.value(forKey: "colorSet")
        let colorUI = NSKeyedUnarchiver.unarchiveObject(with: dataColor as! Data) as? UIColor
        labelDate.textColor = colorUI
    
    }
    

    // Gettin Minuites
    @objc func getMinitues() {
        let minuites  = twentyFour()["minuites"]
        let minuitesInt = Int(minuites!)
        if minuites?.count == 1 {
            firstDigit = 0
            secondDigit = minuitesInt!
        } else {
            firstDigit = minuitesInt!/10
            secondDigit = minuitesInt! % 10
        }
        
       thirdNumber.setNumber(no: firstDigit)
       fourthNumber.setNumber(no: secondDigit)
        
    }
    
    // Getting Hours
    @objc func getHours() {
        let hours  = twentyFour()["hour24"]
        let hoursInt = Int(hours!)
        
        if hours?.count == 1 {
            firstDigit = 0
            secondDigit = hoursInt!
        } else {
            firstDigit = hoursInt!/10
            secondDigit = hoursInt! % 10
            
        }
        
            firstSec.Label.isHidden = true
            secondSec.Label.isHidden = true
     
        
        firstNumber.setNumber(no: firstDigit)
        secondNumber.setNumber(no: secondDigit)
    }
    
// Getting MicroSecond
    
    @objc func microSecond()  {
         if counter % 2 == 0 {
        secondDots.disMissDots()
            counter += 1
        } else {
          secondDots.dotsVisable()
            counter  += 1
        }
        secondDots.colorOfDots()
    }
    // Getting 12 Hour Time 
    
    func TwelveHour() -> [String: String]  {
        date = Date()
        
        let pickedTimeZoneID = UserDefaults.standard.string(forKey: "pickedTimeZoneValueID")
        let dateFormatterOne = DateFormatter()
    
        dateFormatterOne.timeZone = NSTimeZone(abbreviation: "\(pickedTimeZoneID!)")! as TimeZone
    
        dateFormatterOne.dateFormat = "hh"
        let tweleveHour = dateFormatterOne.string(from: date!)
        let dateFormatterTwo = DateFormatter()
        dateFormatterTwo.timeZone = NSTimeZone(abbreviation: "\(pickedTimeZoneID!)")! as TimeZone
       
        dateFormatterTwo.dateFormat = "aa"
        let amOrPm = dateFormatterTwo.string(from: date!)
        let dateFormatterThree = DateFormatter()
         dateFormatterThree.timeZone = NSTimeZone(abbreviation: "\(pickedTimeZoneID!)")! as TimeZone
        dateFormatterThree.dateFormat = "mm"
        let minuites = dateFormatterThree.string(from: date!)
        
        let dataformatterFour = DateFormatter()
        dataformatterFour.dateFormat = "ss"
        dataformatterFour.timeZone = NSTimeZone(abbreviation: "\(pickedTimeZoneID!)")! as TimeZone
        let seconds = dataformatterFour.string(from: date!)
        
    
        
        
        return [ "hour12" : tweleveHour , "amPm" : amOrPm , "minuites" : minuites, "second" : seconds]
    }
    
    @objc func TwelevegetMinitues() {
        let minuites  = TwelveHour()["minuites"]!
        
        
        let minituesInt = Int(minuites)
        if minuites.count == 1 {
            firstDigit = 0
            secondDigit = minituesInt!
        } else {
            firstDigit = minituesInt!/10
            secondDigit = minituesInt! % 10
        }
        
        thirdNumber.setNumber(no: firstDigit)
        fourthNumber.setNumber(no: secondDigit)
        
    }
    @objc func TwelevegetSeconds() {
        let seconds  = TwelveHour()["second"]!
        let secondInt = Int(seconds)
        if seconds.count == 1 {
            firstDigit = 0
            secondDigit = secondInt!
        } else {
            firstDigit = secondInt!/10
            secondDigit = secondInt! % 10
        }
        
        
        firstSec.numbers.setNumber(no: firstDigit)
        secondSec.numbers.setNumber(no: secondDigit)
        
    }
    
    
   
    @objc func getHoursin12OnDigit() {
        let hours  = TwelveHour()["hour12"]
        let hourAsInt = Int(hours!)
        if hours!.count == 1 {
            firstDigit = 0
            secondDigit = hourAsInt!
        } else {
            firstDigit = hourAsInt!/10
            secondDigit = hourAsInt! % 10
        
    
        }
        
        firstNumber.setNumber(no: firstDigit)
        secondNumber.setNumber(no: secondDigit)
        
        let amorPm = TwelveHour()["amPm"]!
        if amorPm == "AM" {
            firstSec.Label.isHidden = false
            secondSec.Label.isHidden = true
            firstSec.Label.text = "AM"
        } else {
            firstSec.Label.text = "PM"
            firstSec.Label.isHidden = false
            secondSec.Label.isHidden = true
        }
        
    }
    
    
    
    // Getting Size Of Dots After Being Loaded
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        secondDots.makecircle()

    }
  
   

}

