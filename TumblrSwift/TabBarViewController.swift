//
//  TabBarViewController.swift
//  TumblrSwift
//
//  Created by Michael Ellison on 10/11/14.
//  Copyright (c) 2014 MichaelWEllison. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    // MARK: Outlets

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var composeButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    
    // MARK: Variables
    var homeViewController : UIViewController!
    var searchViewController : UIViewController!
    var composeViewController : UIViewController!
    var accountViewController : UIViewController!
    var trendingViewController : UIViewController!
    var pressedButton : UIButton!
    var selectedViewController : UIViewController!
    var isPresenting: Bool = true
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as UIViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as UIViewController
        composeViewController = storyboard.instantiateViewControllerWithIdentifier("ComposeViewController") as UIViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as UIViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as UIViewController
        
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height)

        
        
        
        onHomeButton(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Actions
    
    @IBAction func onTabBarButton (tabBarButton: AnyObject) {
        pressedButton = tabBarButton as UIButton
        homeButton.selected = false
        searchButton.selected = false
        accountButton.selected = false
        trendingButton.selected = false
        
        pressedButton.selected = true
        
        
        if homeButton.selected == true {
            homeViewController.view.frame = scrollView.frame
            self.addChildViewController(homeViewController)
            scrollView.addSubview(homeViewController.view)
            homeViewController.didMoveToParentViewController(self)
        } else if searchButton.selected == true {
            searchViewController.view.frame = scrollView.frame
            self.addChildViewController(searchViewController)
            scrollView.addSubview(searchViewController.view)
            searchViewController.didMoveToParentViewController(self)
            
        } else if composeButton.selected == true {
          //  composeViewController.view.frame = view.frame
            // self.addChildViewController(composeViewController)
            // view.addSubview(composeViewController.view)
            // composeViewController.didMoveToParentViewController(self)
            composeButton.selected = false
            performSegueWithIdentifier("composeViewSegue", sender: self)
            
        } else if accountButton.selected == true {
            accountViewController.view.frame = scrollView.frame
            self.addChildViewController(accountViewController)
            scrollView.addSubview(accountViewController.view)
            accountViewController.didMoveToParentViewController(self)
            
        } else if trendingButton.selected == true {
            trendingViewController.view.frame = scrollView.frame
            self.addChildViewController(trendingViewController)
            scrollView.addSubview(trendingViewController.view)
            trendingViewController.didMoveToParentViewController(self)
        }
        
    }
    
    @IBAction func onHomeButton(sender: AnyObject) {
        homeViewController.view.frame = scrollView.frame
        homeButton.selected = true
        self.addChildViewController(homeViewController)
        scrollView.addSubview(homeViewController.view)
        homeViewController.didMoveToParentViewController(self)
    }

    // MARK: Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destinationViewController = segue.destinationViewController as ComposeViewController
        destinationViewController.modalPresentationStyle = .Custom
        destinationViewController.transitioningDelegate = self
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
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                toViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        } else {
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                fromViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }
    }
}

