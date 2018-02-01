//
//  RoundetView.swift
//  DClock
//
//  Created by Sirak Zeray on 1/26/18.
//  Copyright © 2018 Sirak Zeray. All rights reserved.
//

import UIKit

class RoundetView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeRadios()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        makeRadios()
    }
    
    func makeRadios() {
        self.layer.cornerRadius = self.frame.size.height/2
        self.layer.cornerRadius = self.frame.size.height/2
    }
    
}
