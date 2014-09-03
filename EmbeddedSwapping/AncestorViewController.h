//
//  AncestorViewController.h
//  EmbeddedSwapping
//
//  Created by Michael Luton on 9/2/14.
//  Copyright (c) 2014 Sandmoose Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SpeakingDelegate
- (void) saySomething:(NSString*)message;
@end

@interface AncestorViewController : UIViewController

@property (nonatomic, weak) id<SpeakingDelegate> delegate;

@end
