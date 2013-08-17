1. Link Accounts and Social Framework in your project
2. Add the MPTwitterBones files to your project
3. Include them in whatever you want to use them in
4. Instantiate MPTwitterBones in the spot you want
5. Add `dispatch_queue_t twitterQueue` (or similar) before your implementation section
6. Use them like this - note: you can rename the queues etc to whatever you like

```objc
MPTwitterBones *twitterBones = [[MPTwitterBones alloc]init];
[twitterBones userHasAccessToTwitter];
//Testing blocks
twitterQueue = dispatch_queue_create("im.palmer.twitterQeue", nil);
dispatch_async(twitterQueue, ^{
    [twitterBones fetchTimelineForUser:^{
        //Do something with Twitter results
        NSLog(@"result data %@", [twitterBones timelineData]);
    }];
    
    

    dispatch_async(dispatch_get_main_queue(), ^{
        //UI updates have to be on the main thread
        
    });
});
```

- Error handling is pretty poor.
- Only has one function: getting a user's tweets from the people they follow (their `home_timeline`) - this can be changed in the URL declaration in MPTwitterBones.m
- Uses the first Twitter account by default. You could change this pretty easily

Contact me on [Twitter](http://twitter.com/_matthewpalmer) or open an issue if you need help or think of something else you think should be added.
