//
//  FSCentral.m
//  FacebookSample
//
//  Created by Fukaya Akifumi on 12/05/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FSCentral.h"
#import "FSFacebookManager.h"

static FSCentral *object = nil;

@interface FSCentral()
@end

@implementation FSCentral
@synthesize onFacebookDidLogin;

- (id)init{
    if (self = [super init]) {
    }
    return self;
}

+ (FSCentral *)sharedObject{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object = [[self alloc] init];
        [FSFacebookManager sharedManager].onDidLogin = ^(){
            if (object.onFacebookDidLogin) {
                object.onFacebookDidLogin();
            }
        };
    });
    return object;
}

+ (void)authorizeFacebook{
    [[FSFacebookManager sharedManager] authorize];
}

+ (BOOL)completedLogin{
    return [[FSFacebookManager sharedManager] completedLogin];
}

- (void)dealloc{
    [object release];
    [super dealloc];
}

@end
