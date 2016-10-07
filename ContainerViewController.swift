//
//  ContainerViewController.swift
//  OrthodoxCalendar
//
//  Created by Emil Atanasov on 9/10/16.
//  Copyright © 2016 Appose Studio Inc. All rights reserved.
//

import UIKit

//Container View Controller, which swaps between two view controllers
//based on: http://sandmoose.com/post/35714028270/storyboards-with-custom-container-view-controllers
//
class ContainerViewController: UIViewController {

    static let SegueIdentifierFirst = "embedFirst"
    static let SegueIdentifierSecond = "embedSecond"
    static let SegueIdentifierEmpty = "empty"

    internal var currentSegueIdentifier: String = "empty"

    override func viewDidLoad() {
        super.viewDidLoad()

        if self.currentSegueIdentifier == ContainerViewController.SegueIdentifierEmpty {
            self.currentSegueIdentifier = ContainerViewController.SegueIdentifierFirst
        }

        self.performSegue(withIdentifier: self.currentSegueIdentifier, sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ContainerViewController.SegueIdentifierFirst {
            if !self.childViewControllers.isEmpty {
                self.swapFromViewController(fromViewController: self.childViewControllers[0], toViewController: segue.destination, offset: 44.0)
            } else {
                segue.destination.view.frame = CGRect(origin: CGPoint.zero, size: self.view.frame.size)
                self.swapFromViewController(fromViewController: nil, toViewController: segue.destination, offset: 44.0)
            }
        } else if segue.identifier == ContainerViewController.SegueIdentifierSecond {
            if !self.childViewControllers.isEmpty {
                self.swapFromViewController(fromViewController: self.childViewControllers[0], toViewController: segue.destination, offset: 44.0)
            } else {
                segue.destination.view.frame = CGRect(origin: CGPoint.zero, size: self.view.frame.size)
                self.swapFromViewController(fromViewController: nil, toViewController: segue.destination, offset: 44.0)
            }
        }
    }

    func swapFromViewController(fromViewController: UIViewController?, toViewController: UIViewController, offset: CGFloat) -> Void {

        toViewController.view.frame = CGRect(x: 0, y: 0 + offset, width: self.view.frame.size.width, height: self.view.frame.size.height - offset)

        // DEBUG
        print("Frame: \(toViewController.view.frame)")

        if let fromViewController = fromViewController {
            fromViewController.willMove(toParentViewController: nil)
            addChildViewController(toViewController)

            transition(from: fromViewController, to: toViewController, duration: 1.0,
                       options: UIViewAnimationOptions.transitionCrossDissolve, animations: nil) { (finished) in
                        fromViewController.removeFromParentViewController()
                        toViewController.didMove(toParentViewController: self)
            }
        } else {
            addChildViewController(toViewController)
            self.view.addSubview(toViewController.view)
            toViewController.didMove(toParentViewController: self)
        }

    }

    func swapViewControllers() -> Void {
        if self.currentSegueIdentifier == ContainerViewController.SegueIdentifierFirst {
            self.currentSegueIdentifier = ContainerViewController.SegueIdentifierSecond
        } else {
            self.currentSegueIdentifier = ContainerViewController.SegueIdentifierFirst
        }

        self.performSegue(withIdentifier: self.currentSegueIdentifier, sender: nil)
    }
    
}
