//
//  ComposeViewController.swift
//  TumblrSwift
//
//  Created by Michael Ellison on 10/11/14.
//  Copyright (c) 2014 MichaelWEllison. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

    // MARK: Outlets
   
    @IBOutlet var imagesContainerView: UIView!
    @IBOutlet weak var textImageView: UIImageView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var quoteImageView: UIImageView!
    @IBOutlet weak var linkImageView: UIImageView!
    @IBOutlet weak var chatImageView: UIImageView!
    @IBOutlet weak var videoImageView: UIImageView!
    
    // MARK: Variables
    var isPresenting: Bool = true
    let animationDuration : NSTimeInterval = 0.4
    var iconImageViews : [UIImageView] = []
    var iconImageCopyViews : [UIImageView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagesContainerView.backgroundColor = UIColor(red: 0.2, green: 0.263, blue: 0.333, alpha: 0.75)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        modalPresentationStyle = UIModalPresentationStyle.Custom
        transitioningDelegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onNevermindButton(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // Custom Functions
    
    func bounceTextImageViewIn() {
        
    }

    
    // MARK: Transition Delegate Methods
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return animationDuration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        println("animating transition")
        
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            
            // Copy the Compose View Controller in a temp View and put it on the window
            var tempView = UIView(frame: imagesContainerView.frame)
            tempView.backgroundColor = UIColor(red: 0.2, green: 0.263, blue: 0.333, alpha: 0.75)
            var window = UIApplication.sharedApplication().keyWindow
            window.addSubview(tempView)
            containerView.addSubview(toViewController.view)
            
            // Create 6 copys of of the image views and put them on the temp view
            iconImageViews = [textImageView, photoImageView, quoteImageView, linkImageView, chatImageView, videoImageView]
            
            for item in iconImageViews {
                var copyImageView = UIImageView(frame: item.frame)
                copyImageView.frame.origin.y = 568
                copyImageView.image = item.image
                tempView.addSubview(copyImageView)
                iconImageCopyViews.append(copyImageView)
                
            }

//            var textImageViewCopy = UIImageView(frame: textImageView.frame)
//            textImageViewCopy.frame.origin.y = 568
//            textImageViewCopy.image = textImageView.image
//            tempView.addSubview(textImageViewCopy)
//            
//            var photoImageViewCopy = UIImageView(frame: photoImageView.frame)
//            photoImageViewCopy.frame.origin.y = 568
//            photoImageViewCopy.image = photoImageView.image
//            tempView.addSubview(photoImageViewCopy)
            println(self.iconImageCopyViews[5])
            
            toViewController.view.alpha = 0
            
            
            // Animate the icons into the final position using spring animation
            // Remove the view from the window
            
            UIView.animateWithDuration(animationDuration, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveLinear, animations: ({
                
                self.iconImageCopyViews[1].frame.origin.y = self.iconImageViews[1].frame.origin.y
                
                UIView.animateWithDuration(self.animationDuration, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
                    self.iconImageCopyViews[0].frame.origin.y = self.iconImageViews[0].frame.origin.y
                }, completion: nil)

            }), { (finished: Bool) -> Void in
                toViewController.view.alpha = 1
                tempView.removeFromSuperview()
                transitionContext.completeTransition(true)
                })
            
            } else {
            UIView.animateWithDuration(animationDuration, animations: { () -> Void in
                fromViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }
    }
    
    // MARK: Navigation
}

