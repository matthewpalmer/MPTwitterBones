//
//  TTViewController.h
//  TestingTweet
//
//  Created by Matthew Palmer on 22/02/13.
//  Copyright (c) 2013 Matthew Palmer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accounts/Accounts.h>
#import <Social/Social.h>
#import "MPTwitterBones.h"

@interface TTViewController : UIViewController
@property (nonatomic) ACAccountStore *accountStore;
@end
