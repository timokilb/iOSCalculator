//
//  ViewController.swift
//  Calculator
//
//  Created by Neo on 14.04.20.
//  Copyright © 2020 Yomi. All rights reserved.
//

import SnapKit
import UIKit

class ViewController: UIViewController {

    var result = 0
    var temporary : String?
    var mode : String?
    var resultLabel = UILabel()
    var resultBox = UIView()
    var buttonBox = UIView()
    
    // Buttons
    var addButton = CalculatorButton()
    var substractButton = CalculatorButton()
    var multiplyButton = CalculatorButton()
    var divideButton = CalculatorButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .darkGray
        setUpResultBox()
        setUpButtonBox()
        setUpResultLabel()
        setUpAddButton()
        setUpSubstractButton()
        setUpMutltiplyButton()
        setUpDivideButton()
    }

    
    //MARK: Backend functions
    
    
    /// Add here and call update result label afterwards
    
    func setMode(to newMode: String) {
        mode = newMode
        print("set mode to \(newMode)")
        switch mode {
        case "add":
            resultLabel.text = "Add"
        case "substract":
            resultLabel.text = "Substract"
        case "multiply":
            resultLabel.text = "Multiply"
        case "divide":
            resultLabel.text = "Divide"
        default:
            resultLabel.text = "0"
        }
    }

    
    
    
    
    
    func updateResultLabel(){
        resultLabel.text = String(result)
    }
    
    @objc func addButtonTapped(){
        setMode(to: "add")
    }
    
    @objc func substractButtonTapped(){
        setMode(to: "substract")
    }
    
    @objc func multiplyButtonTapped(){
        setMode(to: "multiply")
    }
    
    @objc func divideButtonTapped(){
        setMode(to: "divide")
    }
    
    
    //MARK: Setting up the views
    
    func setUpAddButton() {
        buttonBox.addSubview(addButton)
        addButton.setTitle("+", for: .normal)
        addButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-90)
        }
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)

    }
    
    func setUpSubstractButton() {
        buttonBox.addSubview(substractButton)
        substractButton.setTitle("-", for: .normal)
        substractButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-30)
        }
        substractButton.addTarget(self, action: #selector(substractButtonTapped), for: .touchUpInside)
    }
    
    func setUpMutltiplyButton() {
        buttonBox.addSubview(multiplyButton)
        multiplyButton.setTitle("x", for: .normal)
        multiplyButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(30)
        }
        multiplyButton.addTarget(self, action: #selector(multiplyButtonTapped), for: .touchUpInside)

    }
    
    func setUpDivideButton() {
        buttonBox.addSubview(divideButton)
        divideButton.setTitle("%", for: .normal)
        divideButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(90)
        }
        divideButton.addTarget(self, action: #selector(divideButtonTapped), for: .touchUpInside)

    }
    
    func setUpButtonBox(){
        view.addSubview(buttonBox)
        buttonBox.backgroundColor = .black
        buttonBox.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.top.equalTo(resultBox.snp.bottom)
            make.bottom.equalToSuperview()
        }
    }
    
    func setUpResultLabel(){
        resultBox.addSubview(resultLabel)
        resultLabel.backgroundColor = .black
        resultLabel.text = String(result)
        resultLabel.textAlignment = .right
        resultLabel.textColor = .white
        resultLabel.font = .systemFont(ofSize: 80)
        resultLabel.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(100)
        }
    }
    
    func setUpResultBox(){
        view.addSubview(resultBox)
        resultBox.backgroundColor = .black
        resultBox.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(300)
        }
    }
    
    
    
}

