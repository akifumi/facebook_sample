//
//  FSFacebookRequester.m
//  FacebookSample
//
//  Created by 深谷 哲史 on 12/05/28.
//  Copyright (c) 2012 Keio University. All rights reserved.
//

#import "FSFacebookRequester.h"

@implementation FSFacebookRequester

- (void)requestUserInfoWithFacebook:(Facebook *)facebook observer:(id)observer{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"name, picture", @"fields", nil];
    [facebook requestWithGraphPath:@"me" andParams:params andDelegate:observer];
}

- (void)requestCurrentUserFriendsWithFacebook:(Facebook *)facebook observer:(id)observer{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"name, picture", @"fields", nil];
    [facebook requestWithGraphPath:@"me/friends" andParams:params andDelegate:observer];
}

- (void)requestAlbumsWithFacebook:(Facebook *)facebook observer:(id)observer facebookId:(NSString *)facebookId{
    NSString *graphPath = [facebookId stringByAppendingPathComponent:@"albums"];
//    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"albums", @"fields", nil];
//    [facebook requestWithGraphPath:graphPath andParams:params andDelegate:observer];
//    [facebook requestWithGraphPath:graphPath andDelegate:observer];
    NSLog(@"send request");
//    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                                   [NSString stringWithFormat:@"SELECT albums FROM user WHERE uid=%@", facebookId], @"query",
//                                   nil];
//    [facebook requestWithMethodName:@"fql.query"
//                          andParams:params
//                      andHttpMethod:@"GET"
//                        andDelegate:observer];
    
    NSLog(@"%@", graphPath);
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"albums", @"connectios", nil];
    [facebook requestWithGraphPath:graphPath andParams:params andDelegate:observer];

}

@end
