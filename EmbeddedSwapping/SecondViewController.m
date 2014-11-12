//
    //  SecondViewController.m
//  EmbeddedSwapping
//
//  Created by Michael Luton on 2/15/13.
//  Copyright (c) 2013 Sandmoose Software. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

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
}

- (void)doSomethingWithMessage:(NSString*)message
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    self.label.text = message;
}

@end
