//
//  FSUser.m
//  FacebookSample
//
//  Created by 深谷 哲史 on 12/05/29.
//  Copyright (c) 2012 Keio University. All rights reserved.
//

#import "FSUser.h"

static FSUser *user = nil;

@implementation FSUser
@synthesize facebookId, facebookName, facebookPictureUrl;

+ (FSUser *)sharedObject{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        user = [[self alloc] init];
    });
    return user;
}

- (void)dealloc{
    [user release];
    [super dealloc];
}

@end
