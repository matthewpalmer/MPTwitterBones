//
//  TTAppDelegate.h
//  TestingTweet
//
//  Created by Matthew Palmer on 22/02/13.
//  Copyright (c) 2013 Matthew Palmer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TTViewController;

@interface TTAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) TTViewController *viewController;

@end
