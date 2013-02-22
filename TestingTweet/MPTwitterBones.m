//
//  MPTwitterBones.m
//  TestingTweet
//
//  Created by Matthew Palmer on 22/02/13.
//  Copyright (c) 2013 Matthew Palmer. All rights reserved.
//

#import "MPTwitterBones.h"

@implementation MPTwitterBones
-(BOOL)userHasAccessToTwitter
{
    return [SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter];
    
}
-(void)fetchTimelineForUser
{
    _accountStore = [[ACAccountStore alloc]init];
    
    
    
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        NSLog(@"SLComposeViewController is available - you're probably on the right iOS version");
        //obtain access
        ACAccountType *twitterAccountType = [[self accountStore]accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
        [[self accountStore]requestAccessToAccountsWithType:twitterAccountType options:NULL completion:^(BOOL granted, NSError *error)  {
            if (granted) {
                //create the request
                NSArray *twitterAccounts = [[self accountStore]accountsWithAccountType:twitterAccountType];
                
                ACAccount *account = [twitterAccounts objectAtIndex:0]; //gets the first useraccount in the array. If you have multiple accounts you'll have to work something out
                
                
                NSString *username = [account username];
                NSLog(@"The username for the account you are working with is '%@' \n",username);
                
                NSURL *url = [NSURL URLWithString:@"https://api.twitter.com"
                              @"/1.1/statuses/home_timeline.json"];
                
                NSDictionary *params = @{@"screen_name" : username,
                                         @"include_rts" : @"0",
                                         @"trim_user"   : @"1",
                                         @"count"       : @"1"
                                         };
                
                SLRequest *req = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:url parameters:params];
                
                //attach account to request
                [req setAccount:[twitterAccounts lastObject]];
                //execute req
                [req performRequestWithHandler:^(NSData *responseData,
                                                 NSHTTPURLResponse *urlResponse,
                                                 NSError *error) {
                    if (responseData) {
                        if ([urlResponse statusCode]>= 200 && [urlResponse statusCode]<300) {
                            NSError *jsonError;
                            NSDictionary *timelineData = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingAllowFragments error:&jsonError];
                            if (timelineData) {
                                NSLog(@"timeline: %@",timelineData);
                            } else {
                                //err
                                NSLog(@"json err %@",[jsonError localizedDescription]);
                            }
                        } else {
                            //server error
                            NSLog(@"response code %d", [urlResponse statusCode]);
                        }
                        
                    }
                }];
            } else {
                NSLog(@"Access error or something %@", [error localizedDescription]);
            }
        }];
    }

}
@end
