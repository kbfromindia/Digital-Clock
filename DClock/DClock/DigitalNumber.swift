//
//  customView.swift
//  DClock
//
//  Created by Sirak Zeray on 1/22/18.
//  Copyright © 2018 Sirak Zeray. All rights reserved.
//

import UIKit

class DigitalNumber: UIView {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var topbar: UIView!
    
    @IBOutlet weak var topLeftBar: UIView!
    
    @IBOutlet weak var topRightBar: UIView!
    
    @IBOutlet weak var buttomLeftBar: UIView!
    
    @IBOutlet weak var middleBar: UIView!
    
    @IBOutlet weak var buttomRightBar: UIView!
    
    @IBOutlet weak var buttomBar: UIView!

    
    var visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    
    // NUMBER MAKING FUNCTIONS
    
    func colorOfNumber (){
        
        let  dataColor = UserDefaults.standard.value(forKey: "colorSet")
        let colorUI = NSKeyedUnarchiver.unarchiveObject(with: dataColor as! Data) as? UIColor
        topbar.backgroundColor = colorUI
        topRightBar.backgroundColor = colorUI
        middleBar.backgroundColor = colorUI
        buttomRightBar.backgroundColor = colorUI
        buttomBar.backgroundColor = colorUI
        topLeftBar.backgroundColor = colorUI
        buttomLeftBar.backgroundColor = colorUI
    }
    
    func numberZero() {
        topbar.isHidden = false
        topRightBar.isHidden = false
        middleBar.isHidden = true
        buttomRightBar.isHidden = false
        buttomBar.isHidden = false
        topLeftBar.isHidden = false
        buttomLeftBar.isHidden = false
    }
    
    func numberOne() {
        topbar.isHidden = true
        topRightBar.isHidden = false
        middleBar.isHidden = true
        buttomRightBar.isHidden = false
        buttomBar.isHidden = true
        topLeftBar.isHidden = true
        buttomLeftBar.isHidden = true
    }
    
    func numberTwo() {
        topbar.isHidden = false
        topRightBar.isHidden = false
        middleBar.isHidden = false
        buttomRightBar.isHidden = true
        buttomBar.isHidden = false
        topLeftBar.isHidden = true
        buttomLeftBar.isHidden = false
    }
    
    func numberThere() {
        topbar.isHidden = false
        topRightBar.isHidden = false
        middleBar.isHidden = false
        buttomRightBar.isHidden = false
        buttomBar.isHidden = false
        topLeftBar.isHidden = true
        buttomLeftBar.isHidden = true
    }
    func numberFour() {
        topbar.isHidden = true
        topRightBar.isHidden = false
        middleBar.isHidden = false
        buttomRightBar.isHidden = false
        buttomBar.isHidden = true
        topLeftBar.isHidden = false
        buttomLeftBar.isHidden = true
    }
    
    func numberFive() {
        topbar.isHidden = false
        topRightBar.isHidden = true
        middleBar.isHidden = false
        buttomRightBar.isHidden = false
        buttomBar.isHidden = false
        topLeftBar.isHidden = false
        buttomLeftBar.isHidden = true
    }
    func numberSix() {
        topbar.isHidden = true
        topRightBar.isHidden = true
        middleBar.isHidden = false
        buttomRightBar.isHidden = false
        buttomBar.isHidden = false
        topLeftBar.isHidden = false
        buttomLeftBar.isHidden = false
    }
    func numberSeven(){
        topbar.isHidden = false
        topRightBar.isHidden = false
        middleBar.isHidden = true
        buttomRightBar.isHidden = false
        buttomBar.isHidden = true
        topLeftBar.isHidden = true
        buttomLeftBar.isHidden = true
     }
    func numberEight() {
        topbar.isHidden = false
        topRightBar.isHidden = false
        middleBar.isHidden = false
        buttomRightBar.isHidden = false
        buttomBar.isHidden = false
        topLeftBar.isHidden = false
        buttomLeftBar.isHidden = false
    }
    func numberNine() {
        topbar.isHidden = false
        topRightBar.isHidden = false
        middleBar.isHidden = false
        buttomRightBar.isHidden = false
        buttomBar.isHidden = true
        topLeftBar.isHidden = false
        buttomLeftBar.isHidden = true
    }
    
    
    func setNumber(no: Int) {
        if no == 0 {
            numberZero()
        }
        if no == 1 {
            numberOne()
        }
        if no == 2 {
            numberTwo()
        }
        if no == 3 {
            numberThere()
        }
        if no == 4 {
            numberFour()
        }
        if no == 5 {
            numberFive()
        }
        if no == 6 {
            numberSix()
        }
        if no == 7 {
            numberSeven()
        }
        if no == 8 {
            numberEight()
        }
        if no == 9 {
            numberNine()
        }
    }


    override init(frame: CGRect) {
        super.init(frame: frame)
        self.prepare()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.prepare()
    }
    
    
    func prepare() {
        Bundle.main.loadNibNamed("DigitalNumber", owner: self, options: nil)
        self.addSubview(self.contentView)
        self.contentView.frame = self.bounds
    }
    
    
}
