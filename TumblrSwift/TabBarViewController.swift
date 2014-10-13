//
//  TabBarViewController.swift
//  TumblrSwift
//
//  Created by Michael Ellison on 10/11/14.
//  Copyright (c) 2014 MichaelWEllison. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {
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
            composeViewController.view.frame = scrollView.frame
            self.addChildViewController(composeViewController)
            scrollView.addSubview(composeViewController.view)
            composeViewController.didMoveToParentViewController(self)
            composeButton.selected = false
            
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

}

