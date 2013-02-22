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
    MPTwitterBones *tBones = [[MPTwitterBones alloc]init];
    [tBones userHasAccessToTwitter];
    [tBones fetchTimelineForUser:@"p_almer"];
}
@end
