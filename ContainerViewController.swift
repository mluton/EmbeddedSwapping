//
//  ContainerViewController.swift
//  OrthodoxCalendar
//
//  Created by Emil Atanasov on 9/10/16.
//  Copyright © 2016 Appose Studio Inc. All rights reserved.
//

import Foundation
import UIKit

//Container View Controller, which swaps between two view controllers
//based on: http://sandmoose.com/post/35714028270/storyboards-with-custom-container-view-controllers
//
class ContainerViewController:UIViewController {

    static let SegueIdentifierFirst = "embedFirst"
    static let SegueIdentifierSecond = "embedSecond"
    static let SegueIdentifierEmpty = "empty"

    internal var currentSegueIdentifier: String = "empty";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(self.currentSegueIdentifier == ContainerViewController.SegueIdentifierEmpty) {
            self.currentSegueIdentifier = ContainerViewController.SegueIdentifierFirst;
        }
        
        self.performSegueWithIdentifier(self.currentSegueIdentifier, sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == ContainerViewController.SegueIdentifierFirst {
            if (self.childViewControllers.count > 0) {
                self.swapFromViewController(self.childViewControllers[0], toViewController: segue.destinationViewController, offset: 44.0)
            }
            else {
                segue.destinationViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
                self.swapFromViewController(nil,toViewController: segue.destinationViewController,offset: 44.0)
            }
        } else if segue.identifier == ContainerViewController.SegueIdentifierSecond {
            if (self.childViewControllers.count > 0) {
                self.swapFromViewController(self.childViewControllers[0], toViewController: segue.destinationViewController, offset:44.0)
            } else {
                segue.destinationViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
                self.swapFromViewController(nil,toViewController: segue.destinationViewController,offset: 44.0)
            }
        }
    }
    
    
    func swapFromViewController(fromViewController:UIViewController?, toViewController:UIViewController, offset:CGFloat) -> Void {
        
        toViewController.view.frame = CGRectMake(0, 0 + offset, self.view.frame.size.width, self.view.frame.size.height - offset);
        
        print("Frame: " , toViewController.view.frame)
        
        
        if let fromViewController = fromViewController {
            fromViewController.willMoveToParentViewController(nil)
            addChildViewController(toViewController)
            
            transitionFromViewController(fromViewController, toViewController: toViewController, duration: 1.0,
                                         options: UIViewAnimationOptions.TransitionCrossDissolve, animations: nil) { (finished) in
                fromViewController.removeFromParentViewController()
                toViewController.didMoveToParentViewController(self)
            }
        } else {
            addChildViewController(toViewController)
            self.view.addSubview(toViewController.view)
            toViewController.didMoveToParentViewController(self)
        }

    }

    func swapViewControllers() -> Void {
        self.currentSegueIdentifier = (self.currentSegueIdentifier == ContainerViewController.SegueIdentifierFirst) ? ContainerViewController.SegueIdentifierSecond : ContainerViewController.SegueIdentifierFirst;
        self.performSegueWithIdentifier(self.currentSegueIdentifier, sender: nil)
    }
    
}