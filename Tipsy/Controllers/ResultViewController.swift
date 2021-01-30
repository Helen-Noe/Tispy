//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Thin Myat Noe on 30/1/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

	var numberofPeople = 2
	var tip = 10
	var result = "0.00"
	
	@IBOutlet weak var totalLabel: UILabel!
	@IBOutlet weak var settingLabel: UILabel!
	
	
	override func viewDidLoad() {
        super.viewDidLoad()

		totalLabel.text = result
		settingLabel.text = "Split between \(numberofPeople) people, with \(tip)% tip."
        // Do any additional setup after loading the view.
    }
    
	@IBAction func recalculatePressed(_ sender: UIButton) {
		dismiss(animated: true, completion: nil)
	}
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
