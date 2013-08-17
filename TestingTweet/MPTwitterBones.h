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

typedef void (^CallbackBlock)();

@interface MPTwitterBones : NSObject
@property (copy) CallbackBlock cb;
@property (nonatomic) ACAccountStore *accountStore;
@property (nonatomic, strong) NSMutableArray *arrayOfTweets;
@property (nonatomic, strong) NSDictionary *timelineData;

-(void)fetchTimelineForUser:(CallbackBlock)block;
-(BOOL)userHasAccessToTwitter;
@end
