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

        if currentSegueIdentifier == ContainerViewController.SegueIdentifierEmpty {
            currentSegueIdentifier = ContainerViewController.SegueIdentifierFirst
        }

        performSegue(withIdentifier: currentSegueIdentifier, sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ContainerViewController.SegueIdentifierFirst {
            if !childViewControllers.isEmpty {
                swapFromViewController(fromViewController: childViewControllers[0], toViewController: segue.destination, offset: 44.0)
            } else {
                segue.destination.view.frame = CGRect(origin: CGPoint.zero, size: view.frame.size)
                swapFromViewController(fromViewController: nil, toViewController: segue.destination, offset: 44.0)
            }
        } else if segue.identifier == ContainerViewController.SegueIdentifierSecond {
            if !childViewControllers.isEmpty {
                swapFromViewController(fromViewController: childViewControllers[0], toViewController: segue.destination, offset: 44.0)
            } else {
                segue.destination.view.frame = CGRect(origin: CGPoint.zero, size: view.frame.size)
                swapFromViewController(fromViewController: nil, toViewController: segue.destination, offset: 44.0)
            }
        }
    }

    func swapFromViewController(fromViewController: UIViewController?, toViewController: UIViewController, offset: CGFloat) -> Void {

        toViewController.view.frame = CGRect(x: 0, y: 0 + offset, width: view.frame.size.width, height: view.frame.size.height - offset)

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
            view.addSubview(toViewController.view)
            toViewController.didMove(toParentViewController: self)
        }

    }

    func swapViewControllers() -> Void {
        if currentSegueIdentifier == ContainerViewController.SegueIdentifierFirst {
            currentSegueIdentifier = ContainerViewController.SegueIdentifierSecond
        } else {
            currentSegueIdentifier = ContainerViewController.SegueIdentifierFirst
        }

        performSegue(withIdentifier: currentSegueIdentifier, sender: nil)
    }
    
}
