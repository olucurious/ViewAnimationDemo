//
//  ChooseEffectVC.swift
//  ViewAnimationDemo
//
//  Created by Massimo Polimeni on 03/04/15.
//  Copyright (c) 2015 massimopolimeni. All rights reserved.
//

import UIKit

class ChooseEffectVC: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	// need for dismiss the modal view EffectVC
	@IBAction func close(segue:UIStoryboardSegue) {
 	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
		let viewController:EffectVC = segue.destinationViewController as EffectVC
		
		// set the effect chosen for EffectVC
		if (segue.identifier == "showEffect1") {
			viewController.effect = 1
		} else if (segue.identifier == "showEffect2") {
			viewController.effect = 2
		}
	}

}

