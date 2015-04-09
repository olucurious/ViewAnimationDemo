## Summary
Creating simple, cool and smooth animations in iOS does not require to use external framework, all you need is already in iOS SDK.<br>
This is an example on how to animate a UIView using the method:

	UIView.animateWithDuration(1.0, animations)
    
for create excellent animations with a few lines of code in **Swift**, using the **UIKit framework**.<br><br>
You can download my project for see the code and run the application for see the  animations, just choose one on the main menu; in my example I use the view of an UIImage for the animations on a blurred background.<br><br>
![ScreenShot](/Readme resources/menu.png)<br><br>
In addition to my code I suggest you to read the following description on how these **animations** work and how implement a **blurry effect** on UIImage. 

<br>
## Animations<br>
### 1. Growing animation
![ScreenShot](/Readme resources/growing_effect.gif) <br>
For add a growing animation to your UIView you need to set a initial and final state for the animation.
To scale a view, you need to create a **CGAffineTransformMakeScale** and set it to the transform property of your UIView. So in your **viewDidLoad** use:<br>
	
    yourView.transform = CGAffineTransformMakeScale(0.0, 0.0)
    
and in your **viewDidAppear** just use this:<br>

	UIView.animateWithDuration(1, delay: 0.0, options: nil, animations: {
        self.yourView.transform = CGAffineTransformMakeScale(1, 1)
    }, completion: nil)

The first 1 is the duration of the animation in seconds and you can obviously set what do you want. <br>

As you can see you need to write just a few lines for an impressive and smooth animation because the UIView automatically renders the animations for you, it needs only a initial and final state.

<br>
### 2. Spring animation
![ScreenShot](/Readme resources/spring_animation.gif) <br>
This animation works similar to previous; the initial state is the same and the only thing that you need to change is the method in your **viewDidAppear** with this:

	UIView.animateWithDuration(1, delay: 0.0, usingSpringWithDamping: 0.5,
	initialSpringVelocity: 0.5, options: nil, animations: {
            self.yourView.transform = CGAffineTransformMakeScale(1, 1)
        }, completion: nil)
        
As you can see this method uses two more parameters unlike the previous, the damping and initialSpringVelocity: 

- **damping** how much resistance the spring has; if you want to increase oscillation just set a lower value;
- **initialSpringVelocity** the initial spring velocity.

<br>
### 3. Slide up animation
![ScreenShot](/Readme resources/slide_up_animation.gif) <br>
For the slide up animation you need to use another transform function in sostitution to the previous, the **CGAffineTransformMakeTranslation(x, y)**. <br><br>
The reason is that for a slide up animation you need first move the view off screen and then put it back on the screen where you need.<br>
So in your **viewDidLoad** just use: 

	yourView.transform = CGAffineTransformMakeTranslation(0, 500)

This moves the view off screen, in this example at the bottom.<br>
Now in the **viewDidAppear** you can show your view with:

	UIView.animateWithDuration(1, delay: 0.0, usingSpringWithDamping: 0.5,
	initialSpringVelocity: 0.5, options: nil, animations: {
            self.yourView.transform = CGAffineTransformMakeScale(1, 1)
        }, completion: nil)

<br>
### 4. Spring + slide up
![ScreenShot](/Readme resources/spring_slide_up.gif) <br>
Finally a great example for show that you can easily combine two animations using the function:
	
    CGAffineTransformConcat(transform1, transform2)

In my code I decide to use the spring and the slide up animation together. So in the **viewDidLoad** method you need to use the two previous function for set up the animations:

	let scale = CGAffineTransformMakeScale(0.0, 0.0)
	let translate = CGAffineTransformMakeTranslation(0, 500)
	yourView.transform = CGAffineTransformConcat(scale, translate)

Intuitively in the **viewDidAppear** you need this code that use two animations:

	UIView.animateWithDuration(1, delay: 0.0, usingSpringWithDamping: 0.6,
	initialSpringVelocity: 0.5, options: nil, animations: {
            let scale = CGAffineTransformMakeScale(1, 1)
            let translate = CGAffineTransformMakeTranslation(0, 0)
            self.yourView.transform = CGAffineTransformConcat(scale, translate)
        }, completion: nil)
        
That's it! 

<br>
## Blurry effect

For conclude just a few words about the blurry effect, a cool effect but really easy to use!<br><br>
![ScreenShot](/Readme resources/blur_example.png) <br><br>

To implement this effect you need to use the **UIBlurEffect** object just like this:

	var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
	var blurEffectView = UIVisualEffectView(effect: blurEffect)
	blurEffectView.frame = view.bounds
	yourImage.addSubview(blurEffectView)
   
Just four lines and you can create cool backgrounds for your apps: create the effect, use it for a **blurEffectView**, set up the frame and add the view!<br><br>

Remember that the UIBlurEffect offers three different styles: Dark, Light and ExtraLight, so find out your favorite for your need.
