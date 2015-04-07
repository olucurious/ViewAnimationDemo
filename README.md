## Summary
Creating sophisticated animations in iOS does not require to use external framework.<br>
This is an example on how to use the method:

	UIView.animateWithDuration(1.0, animations)
    
for create excellent and smooth animations with a few lines of code in **Swift**, using the **UIKit framework**.<br><br>
You can download my project for see the code and run the application for see the  animations, just choose one on the main menu; in my example I use the view of an UIImage for the animations on a blurred background.<br><br>
In addition to my code I suggest you to read the following description on how these **animations** work and how implement a **blurry effect** on UIImage. 

--------- _work in progress_ ---------

<br>
## Animations
### 1. Growing animation
For use a simple growing animation you need to set a start and an end state for the animation: 

- start state, the view is in zero size
- end state, the view is in its regular size<br>

To scale a view, you need to create a **CGAffineTransformMakeScale** and set it to the transform property of a UIView. So in your **viewDidLoad** use:<br>
	
    yourView.transform = CGAffineTransformMakeScale(0.0, 0.0)
    
and in your **viewDidAppear** just use this:<br>

	UIView.animateWithDuration(0.7, delay: 0.0, options: nil, animations: {
        self.yourView.transform = CGAffineTransformMakeScale(1, 1)
    }, completion: nil)

0.7 is the duration of the animation in seconds and you can obviously set what do you want. <br><br>
As you can see you need to write just a few lines for an impressive and smooth animation because the UIView automatically renders the animations for you.

### 2. Spring animation
This animation works similar to previous; the only thing that you need to change is the method in your **viewDidAppear** with this:

	UIView.animateWithDuration(0.7, delay: 0.0, usingSpringWithDamping: 0.5,
	initialSpringVelocity: 0.5, options: nil, animations: {
            self.yourView.transform = CGAffineTransformMakeScale(1, 1)
        }, completion: nil)
        
As you can see this method uses two more parameters unlike the previous, the damping and initialSpringVelocity: 

- **damping** controls how much resistance the spring has at the end state of the animation; so if you want to increase oscillation just set a lower value;
- **initialSpringVelocity** specifies the initial spring velocity.

<br>
## Blurry effect
--------- _work in progress_ ---------
 
