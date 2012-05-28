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
@synthesize currentUser, friendsInfo, onFacebookDidLogin, onFacebookGotFriendsInfo;

- (id)init{
    if (self = [super init]) {
        self.currentUser = [[FSUser sharedObject] retain];
        
        [FSFacebookManager sharedManager].onDidLogin = ^(){
            if (self.onFacebookDidLogin) {
                self.onFacebookDidLogin();
            }
        };
        
        [FSFacebookManager sharedManager].onGotFriendsInfo = ^(){
            if (self.onFacebookGotFriendsInfo) {
                self.onFacebookGotFriendsInfo();
            }
        };
    }
    return self;
}

+ (FSCentral *)sharedObject{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object = [[self alloc] init];
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
    [self.currentUser release];
    [super dealloc];
}

@end
