//
//  MPTwitterBones.h
//  TestingTweet
//
//  Created by Matthew Palmer on 22/02/13.
//  Copyright (c) 2013 Matthew Palmer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Accounts/Accounts.h>
#import <Social/Social.h>

@interface MPTwitterBones : NSObject

@property (nonatomic) ACAccountStore *accountStore;

-(BOOL)userHasAccessToTwitter;
-(void)fetchTimelineForUser;
@end
