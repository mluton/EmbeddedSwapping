//
//  ViewController.m
//  EmbeddedSwapping
//
//  Created by Michael Luton on 11/13/12.
//  Copyright (c) 2012 Sandmoose Software. All rights reserved.
//

#import "ViewController.h"
#import "ContainerViewController.h"

@interface ViewController ()
@property (nonatomic, weak) ContainerViewController *containerViewController;
- (IBAction)swapButtonPressed:(id)sender;
@end

@implementation ViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"embedContainer"]) {
        self.containerViewController = segue.destinationViewController;
    }
}

- (IBAction)swapButtonPressed:(id)sender
{
    [self.containerViewController swapViewControllers];
}

@end
