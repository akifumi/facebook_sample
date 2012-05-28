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
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"name,picture", @"fields", nil];
    [facebook requestWithGraphPath:@"me" andParams:params andDelegate:observer];
}

@end
