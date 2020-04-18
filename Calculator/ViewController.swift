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
    
    // Functional buttons
    var addButton = CalculatorButton()
    var substractButton = CalculatorButton()
    var multiplyButton = CalculatorButton()
    var divideButton = CalculatorButton()
    var equalsButton = CalculatorButton()
    var clearButton = CalculatorButton()
    var negateButton  = CalculatorButton()
    var percentButton = CalculatorButton()

    
    // Number buttons
    var pointButton  = CalculatorButton()
    var zeroButton = CalculatorButton()
    var oneButton = CalculatorButton()
    var twoButton = CalculatorButton()
    var threeButton = CalculatorButton()
    var fourButton = CalculatorButton()
    var fiveButton = CalculatorButton()
    var sixButton = CalculatorButton()
    var sevenButton = CalculatorButton()
    var eightButton = CalculatorButton()
    var nineButton = CalculatorButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .darkGray
        setUpResultBox()
        setUpButtonBox()
        setUpResultLabel()
        
        // Set up the buttons row by row

        // First row
        setUpClearButton()
        setUpNegateButton()
        setUpPercentButton()
        setUpDivideButton()

        // Second row
        setUpSevenButton()
        setUpEightButton()
        setUpNineButton()
        setUpMutltiplyButton()
        
        // Third row
        setUpFourButton()
        setUpFiveButton()
        setUpSixButton()
        setUpSubstractButton()

        
        // Fourth row
        setUpOneButton()
        setUpTwoButton()
        setUpThreeButton()
        setUpAddButton()
        
        
        // Fifth row
        setUpZeroButton()
        setUpPointButton()
        setUpEqualsButton()

    }

    
    // MARK: Business Logic
    
    
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

    
    
    // MARK: Button functions
    
    
    func updateLabel(number: String){
        resultLabel.text = String(number)
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
    
    @objc func clearButtonTapped(){
        result = 0
        resultLabel.text = "0"
    }
    
    
    // MARK: Setting up the views
    /// Think of a better way to set the constraints for all buttons - Is this overloaded VC the result of having so many buttons?
    
    func setUpResultBox(){
        view.addSubview(resultBox)
        resultBox.backgroundColor = .black
        resultBox.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(300)
        }
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
            make.rightMargin.equalTo(-15)
        }
    }
    
    // MARK: -
    // First row
    func setUpClearButton(){
        buttonBox.addSubview(clearButton)
        clearButton.setTitle("C", for: .normal)
        clearButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Config.buttonDistance)
            make.left.equalToSuperview().offset(Config.buttonDistance)
        }
    }
    
    func setUpNegateButton(){
        buttonBox.addSubview(negateButton)
        negateButton.setTitle("+/-", for: .normal)
        negateButton.snp.makeConstraints { (make) in
            make.top.equalTo(clearButton)
            make.left.equalTo(clearButton.snp.right).offset(Config.buttonDistance)
        }
    }
    
    func setUpPercentButton(){
        buttonBox.addSubview(percentButton)
        percentButton.setTitle("%", for: .normal)
        percentButton.snp.makeConstraints { (make) in
            make.top.equalTo(clearButton)
            make.left.equalTo(negateButton.snp.right).offset(Config.buttonDistance)
        }
    }
    
    func setUpDivideButton() {
        buttonBox.addSubview(divideButton)
        divideButton.setTitle("%", for: .normal)
        divideButton.snp.makeConstraints { (make) in
            make.top.equalTo(clearButton)
            make.left.equalTo(percentButton.snp.right).offset(Config.buttonDistance)
        }
        divideButton.addTarget(self, action: #selector(divideButtonTapped), for: .touchUpInside)
    }
    
    // MARK: -
    // Second row
    func setUpSevenButton(){
        buttonBox.addSubview(sevenButton)
        sevenButton.setTitle("7", for: .normal)
        sevenButton.snp.makeConstraints { (make) in
            make.top.equalTo(clearButton.snp.bottom).offset(Config.buttonDistance)
            make.left.equalToSuperview().offset(Config.buttonDistance)
        }
    }
    
    func setUpEightButton(){
        buttonBox.addSubview(eightButton)
        eightButton.setTitle("8", for: .normal)
        eightButton.snp.makeConstraints { (make) in
            make.top.equalTo(sevenButton)
            make.left.equalTo(sevenButton.snp.right).offset(Config.buttonDistance)
        }
    }
    
    func setUpNineButton(){
        buttonBox.addSubview(nineButton)
        nineButton.setTitle("9", for: .normal)
        nineButton.snp.makeConstraints { (make) in
            make.top.equalTo(sevenButton)
            make.left.equalTo(eightButton.snp.right).offset(Config.buttonDistance)
        }
    }
    
    func setUpMutltiplyButton() {
        buttonBox.addSubview(multiplyButton)
        multiplyButton.setTitle("x", for: .normal)
        multiplyButton.snp.makeConstraints { (make) in
            make.top.equalTo(sevenButton)
            make.left.equalTo(nineButton.snp.right).offset(Config.buttonDistance)
        }
        multiplyButton.addTarget(self, action: #selector(multiplyButtonTapped), for: .touchUpInside)
    }
    
    // MARK: -
    // Third row
    func setUpFourButton(){
        buttonBox.addSubview(fourButton)
        fourButton.setTitle("4", for: .normal)
        fourButton.snp.makeConstraints { (make) in
            make.top.equalTo(sevenButton.snp.bottom).offset(Config.buttonDistance)
            make.left.equalToSuperview().offset(Config.buttonDistance)
            
        }
    }
    
    func setUpFiveButton(){
        buttonBox.addSubview(fiveButton)
        fiveButton.setTitle("5", for: .normal)
        fiveButton.snp.makeConstraints { (make) in
            make.top.equalTo(fourButton)
            make.left.equalTo(fourButton.snp.right).offset(Config.buttonDistance)
        }
    }
    
    func setUpSixButton() {
        buttonBox.addSubview(sixButton)
        sixButton.setTitle("6", for: .normal)
        sixButton.snp.makeConstraints { (make) in
            make.top.equalTo(fourButton)
            make.left.equalTo(fiveButton.snp.right).offset(Config.buttonDistance)
        }
    }
    
    func setUpSubstractButton() {
        buttonBox.addSubview(substractButton)
        substractButton.setTitle("-", for: .normal)
        substractButton.snp.makeConstraints { (make) in
            make.top.equalTo(fourButton)
            make.left.equalTo(sixButton.snp.right).offset(Config.buttonDistance)
        }
        substractButton.addTarget(self, action: #selector(substractButtonTapped), for: .touchUpInside)
    }
    
    
    // MARK: -
    // Fourth row
    func setUpOneButton(){
        buttonBox.addSubview(oneButton)
        oneButton.setTitle("1", for: .normal)
        oneButton.snp.makeConstraints { (make) in
            make.top.equalTo(fourButton.snp.bottom).offset(Config.buttonDistance)
            make.left.equalToSuperview().offset(Config.buttonDistance)
        }
    }
    
    func setUpTwoButton(){
        buttonBox.addSubview(twoButton)
        twoButton.setTitle("2", for: .normal)
        twoButton.snp.makeConstraints { (make) in
            make.top.equalTo(oneButton)
            make.left.equalTo(oneButton.snp.right).offset(Config.buttonDistance)
        }
    }
    func setUpThreeButton(){
        buttonBox.addSubview(threeButton)
        threeButton.setTitle("3", for: .normal)
        threeButton.snp.makeConstraints { (make) in
            make.top.equalTo(oneButton)
            make.left.equalTo(twoButton.snp.right).offset(Config.buttonDistance)
        }
    }
    
    func setUpAddButton() {
        buttonBox.addSubview(addButton)
        addButton.setTitle("+", for: .normal)
        addButton.snp.makeConstraints { (make) in
            make.top.equalTo(oneButton)
            make.left.equalTo(threeButton.snp.right).offset(Config.buttonDistance)
        }
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    // MARK: -
    // Fifth row
    func setUpZeroButton(){
        buttonBox.addSubview(zeroButton)
        zeroButton.setTitle("0", for: .normal)
        zeroButton.snp.remakeConstraints { (make) in
            make.height.equalTo(Config.buttonSize)
            make.width.equalTo(Config.buttonSize * 2 + Config.buttonDistance)
            make.top.equalTo(oneButton.snp.bottom).offset(Config.buttonDistance)
            make.left.equalToSuperview().offset(Config.buttonDistance)
        }
    }
    
    func setUpPointButton(){
        buttonBox.addSubview(pointButton)
        pointButton.setTitle(".", for: .normal)
        pointButton.snp.makeConstraints { (make) in
            make.top.equalTo(zeroButton)
            make.left.equalTo(zeroButton.snp.right).offset(Config.buttonDistance)
        }
    }
    
    func setUpEqualsButton(){
        buttonBox.addSubview(equalsButton)
        equalsButton.setTitle("=", for: .normal)
        equalsButton.snp.makeConstraints { (make) in
            make.top.equalTo(zeroButton)
            make.left.equalTo(pointButton.snp.right).offset(Config.buttonDistance)
        }
    }

    
}

