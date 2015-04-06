//
//  EffectVC.swift
//  ViewAnimationDemo
//
//  Created by Massimo Polimeni on 03/04/15.
//  Copyright (c) 2015 Massimo Polimeni. All rights reserved.
//

import UIKit

class EffectVC: UIViewController {
	
	var effect: Int = 0
	
	@IBOutlet weak var backgroundImage: UIImageView!
	@IBOutlet weak var mainImage: UIImageView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // adding blur effect to backgroundImage
		var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
		var blurEffectView = UIVisualEffectView(effect: blurEffect)
		blurEffectView.frame = view.bounds
		backgroundImage.addSubview(blurEffectView)
		
        if (effect == 1 || effect == 2) {
            // scales down the image view when it is first loaded (start state)
            mainImage.transform = CGAffineTransformMakeScale(0.0, 0.0)
        }
        else if (effect == 3) {
            // first move the image view off screen (and then bring it back to its original position)
            mainImage.transform = CGAffineTransformMakeTranslation(0, 500)
        }
        else if (effect == 4) {
            // combine two animation with scale and translation
            let scale = CGAffineTransformMakeScale(0.0, 0.0)
            let translate = CGAffineTransformMakeTranslation(0, 500)
            mainImage.transform = CGAffineTransformConcat(scale, translate)
        }
    }

	override func viewDidAppear(animated: Bool) {
		
		switch effect {
		
            case 1: // growing effect
                UIView.animateWithDuration(0.7, delay: 0.0, options: nil,
                    animations:{ self.mainImage.transform = CGAffineTransformMakeScale(1, 1) }, completion: nil);
        
            case 2: // spring animation
                UIView.animateWithDuration(0.7, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: nil,
                    animations: { self.mainImage.transform = CGAffineTransformMakeScale(1, 1) }, completion: nil);
            
            case 3: // slide up animation
                UIView.animateWithDuration(0.7, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: nil,
                    animations: { self.mainImage.transform = CGAffineTransformMakeTranslation(0, 0) }, completion: nil)
        
            case 4: // spring + slide up animations
                UIView.animateWithDuration(0.7, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: nil,
                    animations: {
                        let scale = CGAffineTransformMakeScale(1, 1)
                        let translate = CGAffineTransformMakeTranslation(0, 0)
                        self.mainImage.transform = CGAffineTransformConcat(scale, translate)
                    }, completion: nil)
            default:
                println("error");
		}
	}
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
