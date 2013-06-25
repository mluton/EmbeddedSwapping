//
//  SecondViewController.m
//  EmbeddedSwapping
//
//  Created by Michael Luton on 2/15/13.
//  Copyright (c) 2013 Sandmoose Software. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	NSLog(@"SecondViewController - viewDidLoad");
    
    // Make it so any subviews can respond to user interaction. For example,
    // scroll views responding to scroll events. It's not enough for the
    // subview to have userInteractionEnabled set to true. It needs be set in
    // the container view as well. --mluton (2013-06-24)
    self.view.userInteractionEnabled = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
