//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
	
	var tip = 0.10
	var numberOfPeople = 2
	var result = "0.00"
	
	@IBOutlet weak var billTextField: UITextField!
	@IBOutlet weak var zeroPctButton: UIButton!
	@IBOutlet weak var tenPctButton: UIButton!
	@IBOutlet weak var twentyPctButton: UIButton!
	@IBOutlet weak var splitNumberLabel: UILabel!

	@IBAction func tipChanged(_ sender: UIButton) {
		
		zeroPctButton.isSelected = false
		tenPctButton.isSelected = false
		twentyPctButton.isSelected = false
		
		sender.isSelected = true
		
		let buttonTitle = sender.currentTitle!
		let buttonTitleMinusPercentage = buttonTitle.dropLast()
		let buttonTitleAsNumber = Double(buttonTitleMinusPercentage)!
		tip = buttonTitleAsNumber / 100
		
		billTextField.endEditing(true)
	}
	
	@IBAction func stepperValuechanged(_ sender: UIStepper) {
		splitNumberLabel.text = String(format: "%.0f", sender.value)
		numberOfPeople = Int(sender.value)
	}
	
	@IBAction func calculatedPressed(_ sender: UIButton) {

		let bill = Double(billTextField.text ?? "0.00") ?? 0.00

		let tipAmount = bill * tip
		let totalAmount = bill + tipAmount
		let eachAmount = totalAmount / Double(numberOfPeople)
		
		result = String(format: "%.2f", eachAmount)
		
		print(result)
		
		self.performSegue(withIdentifier: "goToResult", sender: self)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "goToResult" {
			let destinationVC = segue.destination as! ResultViewController
			destinationVC.numberofPeople = numberOfPeople
			destinationVC.tip = Int(tip * 100)
			destinationVC.result = result
		}
	}
	
}

