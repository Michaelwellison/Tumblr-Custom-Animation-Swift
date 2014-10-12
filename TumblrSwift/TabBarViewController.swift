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
    @IBOutlet weak var contentView: UIView!
    
    // MARK: Variables
    var homeViewController : UIViewController!
    var searchViewController : UIViewController!
    var composeViewController : UIViewController!
    var accountViewController : UIViewController!
    var trendingViewController : UIViewController!
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as UIViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as UIViewController
        composeViewController = storyboard.instantiateViewControllerWithIdentifier("ComposeViewController") as UIViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as UIViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as UIViewController
        
        onHomeButton(self)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Actions
    
    @IBAction func onHomeButton(sender: AnyObject) {
        homeViewController.view.frame = contentView.frame
        contentView.addSubview(homeViewController.view)
    }

    
    @IBAction func onSearchButton(sender: UIButton) {
        searchViewController.view.frame = contentView.frame
        contentView.addSubview(searchViewController.view)
    }
    
    @IBAction func onComposeButton(sender: UIButton) {
        composeViewController.view.frame = contentView.frame
        contentView.addSubview(composeViewController.view)
    }
   
    @IBAction func onAccountButton(sender: UIButton) {
        accountViewController.view.frame = contentView.frame
        contentView.addSubview(accountViewController.view)
    }
   
    @IBAction func onTrendingButton(sender: UIButton) {
        trendingViewController.view.frame = contentView.frame
        contentView.addSubview(trendingViewController.view)
    }
    

    

}

