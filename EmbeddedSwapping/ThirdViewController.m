//
//  ThirdViewController.m
//  EmbeddedSwapping
//
//  Created by Michael Luton on 12/10/13.
//  Copyright (c) 2013 Sandmoose Software. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

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
	NSLog(@"ThirdViewController - viewDidLoad");
    self.view.userInteractionEnabled = YES;
}

- (IBAction)saySomething
{
    [self.delegate saySomething:@"Hello from the third view controller"];
}

@end
