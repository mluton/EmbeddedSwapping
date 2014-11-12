//
//  ContainerViewController.h
//  EmbeddedSwapping
//
//  Created by Michael Luton on 11/13/12.
//  Copyright (c) 2012 Sandmoose Software. All rights reserved.
//

@protocol EmbeddedDelegate <NSObject>

- (void)doSomethingWithMessage:(NSString*)message;

@end

@interface ContainerViewController : UIViewController

- (void)swapViewControllers;
- (void)passDataToEmbeddedViewController:(NSString*)message;

@end
