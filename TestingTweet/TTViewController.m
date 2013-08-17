//
//  TTViewController.m
//  TestingTweet
//
//  Created by Matthew Palmer on 22/02/13.
//  Copyright (c) 2013 Matthew Palmer. All rights reserved.
//

#import "TTViewController.h"

@interface TTViewController ()

@end

dispatch_queue_t twitterQueue;

@implementation TTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self SCTwitter];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)SCTwitter
{
    MPTwitterBones *twitterBones = [[MPTwitterBones alloc]init];
    [twitterBones userHasAccessToTwitter];
    //Testing blocks
    twitterQueue = dispatch_queue_create("im.palmer.twitterQeue", nil);
    dispatch_async(twitterQueue, ^{
        [twitterBones fetchTimelineForUser:^{
            NSLog(@"inside block %@", [twitterBones timelineData]);
        }];
        
        
        //Do something with Twitter results
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //UI updates have to be on the main thread
            
        });
    });
}
@end
