//
//  Button.swift
//  Calculator
//
//  Created by Neo on 15.04.20.
//  Copyright © 2020 Yomi. All rights reserved.
//

import Foundation
import SnapKit

class CalculatorButton: UIButton {
    
    var buttonSize : CGFloat = 50
    var fontSize : CGFloat = 30
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.snp.makeConstraints { (make) in
            make.width.height.equalTo(buttonSize)
        }
        self.backgroundColor = .systemOrange
        self.layer.cornerRadius = buttonSize/2
        self.layer.masksToBounds = true
        self.titleLabel?.font = .systemFont(ofSize: fontSize)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buttonTapped(){
        
    }
    
}
