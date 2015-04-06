//
//  EffectVC.swift
//  ViewAnimationDemo
//
//  Created by Massimo Polimeni on 03/04/15.
//  Copyright (c) 2015 massimopolimeni. All rights reserved.
//

import UIKit

class EffectVC: UIViewController {
	
	var effect: Int = 0
	
	@IBOutlet weak var backgroundImage: UIImageView!
	@IBOutlet weak var mainImage: UIImageView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		//  blur effect
		var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
		var blurEffectView = UIVisualEffectView(effect: blurEffect)
		blurEffectView.frame = view.bounds
		backgroundImage.addSubview(blurEffectView)
		
		// scales down the image view when it is first loaded, need for implement the animation
		mainImage.transform = CGAffineTransformMakeScale(0.0, 0.0)
    }

	override func viewDidAppear(animated: Bool) {
		
		switch effect {
		
			case 1: // growing effect
				UIView.animateWithDuration(0.7, delay: 0.0, options: nil, animations:
				{ self.mainImage.transform = CGAffineTransformMakeScale(1, 1) }, completion: nil);
		
			case 2: // spring Animation
				UIView.animateWithDuration(0.7, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: nil, animations:
				{ self.mainImage.transform = CGAffineTransformMakeScale(1, 1) }, completion: nil);
	
			default:
				println("error");
		}
	}
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
