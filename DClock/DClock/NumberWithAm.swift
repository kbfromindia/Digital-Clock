//
//  NumberWithAm.swift
//  DClock
//
//  Created by Sirak Zeray on 1/24/18.
//  Copyright © 2018 Sirak Zeray. All rights reserved.
//

import UIKit

class NumberWithAm: UIView {
    
    @IBOutlet var numberWithAmConent: UIView!
    
    @IBOutlet weak var Label: UILabel!
    
    @IBOutlet weak var numbers: DigitalNumber!
    
    func colorOfAmorPm (){
        let  dataColor = UserDefaults.standard.value(forKey: "colorSet")
        let colorUI = NSKeyedUnarchiver.unarchiveObject(with: dataColor as! Data) as? UIColor
        Label.textColor = colorUI
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
        Bundle.main.loadNibNamed("NumberWithAm", owner: self, options: nil)
        self.addSubview(self.numberWithAmConent)
        self.numberWithAmConent.frame = self.bounds
    }
    
    
    
    
}
