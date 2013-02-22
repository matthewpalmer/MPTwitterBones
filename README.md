1. Link Accounts and Social Framework in your project
2. Add the MPTwitterBones files to your project
3. Include them in whatever you want to use them in
4. Instantiate MPTwitterBones in the spot you want
5. Call `userHasAccessToTwitter` on this new object - you might want to add your own if/else scenarios to deal with errors
6. Then call `fetchTimelineForUser`.

- Error handling is pretty poor.
- Only has one function: getting a user's tweets from the people they follow (their `home_timeline`) - this can be changed in the URL declaration in MPTwitterBones.m

Contact me on [Twitter](http://twitter.com/p_almer) if you need help or think of something else you think should be added.
