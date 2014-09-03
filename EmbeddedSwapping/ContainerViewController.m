//
//  ContainerViewController.m
//  EmbeddedSwapping
//
//  Created by Michael Luton on 11/13/12.
//  Copyright (c) 2012 Sandmoose Software. All rights reserved.
//  Heavily inspired by http://orderoo.wordpress.com/2012/02/23/container-view-controllers-in-the-storyboard/
//

#import "ContainerViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

#define SegueIdentifierFirst @"embedFirst"
#define SegueIdentifierSecond @"embedSecond"
#define SegueIdentifierThird @"embedThird"

#define BUTTON_ONE 1
#define BUTTON_TWO 2
#define BUTTON_THREE 3

@interface ContainerViewController () <SpeakingDelegate>

@property (strong, nonatomic) NSString *currentSegueIdentifier;
@property (strong, nonatomic) FirstViewController *firstViewController;
@property (strong, nonatomic) SecondViewController *secondViewController;
@property (strong, nonatomic) ThirdViewController *thirdViewController;
@property (assign, nonatomic) BOOL transitionInProgress;

@end

@implementation ContainerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.transitionInProgress = NO;
    self.currentSegueIdentifier = SegueIdentifierFirst;
    [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    int buttonTag = ((UIButton*)sender).tag;

    if (buttonTag == 0) {
        buttonTag = 1;
    }
    
    // Instead of creating new VCs on each seque we want to hang on to existing
    // instances if we have it. Remove the second condition of the following
    // two if statements to get new VC instances instead.
    if (([segue.identifier isEqualToString:SegueIdentifierFirst]) && !self.firstViewController) {
        self.firstViewController = segue.destinationViewController;
        self.firstViewController.delegate = self;
    }

    if (([segue.identifier isEqualToString:SegueIdentifierSecond]) && !self.secondViewController) {
        self.secondViewController = segue.destinationViewController;
        self.secondViewController.delegate = self;
    }

    if (([segue.identifier isEqualToString:SegueIdentifierThird]) && !self.thirdViewController) {
        self.thirdViewController = segue.destinationViewController;
        self.thirdViewController.delegate = self;
    }
    
    switch (buttonTag) {
        case BUTTON_ONE:
            // If this is not the first time we're loading this.
            if (self.childViewControllers.count > 0) {
                [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:self.firstViewController];
            }
            else {
                // If this is the very first time we're loading this we need to do
                // an initial load and not a swap.
                [self addChildViewController:segue.destinationViewController];
                UIView* destView = ((UIViewController *)segue.destinationViewController).view;
                destView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
                destView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
                [self.view addSubview:destView];
                [segue.destinationViewController didMoveToParentViewController:self];
            }

            break;

        case BUTTON_TWO:
            [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:self.secondViewController];
            break;

        case BUTTON_THREE:
            [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:self.thirdViewController];
            break;

        default:
            break;
    }
}

- (void)swapFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController
{
    toViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);

    [fromViewController willMoveToParentViewController:nil];
    [self addChildViewController:toViewController];

    [self transitionFromViewController:fromViewController toViewController:toViewController duration:1.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        [fromViewController removeFromParentViewController];
        [toViewController didMoveToParentViewController:self];
        self.transitionInProgress = NO;
    }];
}

- (void)swapViewControllers:(id)sender
{
    if (self.transitionInProgress) {
        return;
    }
    
    self.transitionInProgress = YES;
    
    switch (((UIButton*)sender).tag) {
        case BUTTON_ONE:
            if (![self.currentSegueIdentifier isEqualToString:SegueIdentifierFirst]) {
                self.currentSegueIdentifier = SegueIdentifierFirst;
            }
            else {
                self.transitionInProgress = NO;
                return;
            }
            
            break;

        case BUTTON_TWO:
            if (![self.currentSegueIdentifier isEqualToString:SegueIdentifierSecond]) {
                self.currentSegueIdentifier = SegueIdentifierSecond;
            }
            else {
                self.transitionInProgress = NO;
                return;
            }

            break;

        case BUTTON_THREE:
            if (![self.currentSegueIdentifier isEqualToString:SegueIdentifierThird]) {
                self.currentSegueIdentifier = SegueIdentifierThird;
            }
            else {
                self.transitionInProgress = NO;
                return;
            }

            break;

        default:
            break;
    }

    [self performSegueWithIdentifier:self.currentSegueIdentifier sender:sender];
}

#pragma mark - SpeakingDelegate

- (void)saySomething:(NSString *)message
{
    NSLog(@"message: %@", message);
}

@end
