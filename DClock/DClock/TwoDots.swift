//
//  TwoDots.swift
//  DClock
//
//  Created by Sirak Zeray on 1/23/18.
//  Copyright © 2018 Sirak Zeray. All rights reserved.
//

import UIKit

class TwoDots: UIView {
    
    
    @IBOutlet var TwoDotsXib: UIView! 
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var bottonView: UIView!
    @IBOutlet weak var bottomDot: UIView!
    
    @IBOutlet weak var topDot: UIView!
    
    func disMissDots() {
        topDot.isHidden = true
        bottomDot.isHidden = true
    }
    func dotsVisable () {
        topDot.isHidden = false
        bottomDot.isHidden = false
    }
    func colorOfDots (){
        let  dataColor = UserDefaults.standard.value(forKey: "colorSet")
        let colorUI = NSKeyedUnarchiver.unarchiveObject(with: dataColor as! Data) as? UIColor
        topDot.backgroundColor = colorUI
        bottomDot.backgroundColor = colorUI
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
        Bundle.main.loadNibNamed("TwoDots", owner: self, options: nil)
        self.TwoDotsXib.frame = self.bounds
        
        self.addSubview(self.TwoDotsXib)
        
    }
    
    override func layoutSubviews() {
        super .layoutSubviews()
        makecircle()
    }
    
    func makecircle(){
        
        topDot.layer.cornerRadius = topDot.frame.size.height/2
        bottomDot.layer.cornerRadius = bottomDot.frame.size.height/2

    }
    
    
    
    
}




