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
@synthesize currentUser, curentUserFriendsInfo, onFacebookDidLogin, onFacebookGotCurrentUserInfo, onFacebookGotCurrentUserFriendsInfo;

- (id)init{
    if (self = [super init]) {
        self.currentUser = [[[FSUser alloc] init] retain];
        
        [FSFacebookManager sharedManager].onDidLogin = ^(){
            if (self.onFacebookDidLogin) {
                self.onFacebookDidLogin();
            }
        };
        
        [FSFacebookManager sharedManager].onGotCurrentUserInfo = ^(){
            if (self.onFacebookGotCurrentUserInfo) {
                self.onFacebookGotCurrentUserInfo();
            }

        };
        
        [FSFacebookManager sharedManager].onGotCurrentUserFriendsInfo = ^(){
            if (self.onFacebookGotCurrentUserFriendsInfo) {
                self.onFacebookGotCurrentUserFriendsInfo();
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

+ (BOOL)completedFacebookLogin{
    return [[FSFacebookManager sharedManager] completedLogin];
}

+ (void)requestFacebookCueentUserInfo;{
    [[FSFacebookManager sharedManager] requestFacebookCueentUserInfo];
}

+ (void)requestFacebookCueentUserFriendsInfo{
    [[FSFacebookManager sharedManager] requestFacebookCueentUserFriendsInfo];
}

+ (void)requestFacebookUserAlbumsWith:(FSUser *)user{
    [[FSFacebookManager sharedManager] requestFacebookUserAlbumsWith:user];
}

- (void)dealloc{
    [object release];
    [self.currentUser release];
    [super dealloc];
}

@end
