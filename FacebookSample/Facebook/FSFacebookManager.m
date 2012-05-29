//
//  FSFacebookManager.m
//  FacebookSample
//
//  Created by Fukaya Akifumi on 12/05/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FSFacebookManager.h"
#import "FSFacebookObserver.h"
#import "FSFacebookRequester.h"
#import "FSFacebookInfo.h"
#import "FSCentral.h"

static FSFacebookManager *manager = nil;

@interface FSFacebookManager(){

}
@property (nonatomic, strong) Facebook *facebook;
@property (nonatomic, strong) NSArray *permissions;
@property (nonatomic, strong) FSFacebookObserver *observer;
@property (nonatomic, strong) FSFacebookRequester *requester;
@end

@implementation FSFacebookManager
@synthesize onDidLogin, onGotCurrentUserInfo, onGotCurrentUserFriendsInfo;
@synthesize facebook, permissions, observer, requester;

- (id)init{
    if (self = [super init]) {
        self.observer = [[[FSFacebookObserver alloc] init] autorelease];
        self.requester = [[[FSFacebookRequester alloc] init] autorelease];
        self.facebook = [[Facebook alloc] initWithAppId:kAppId andDelegate:self.observer];
        self.observer.facebook = self.facebook;
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        if ([defaults objectForKey:kFBAccessTokenKey] && [defaults objectForKey:kFBExpirationDateKey]) {
            self.facebook.accessToken = [defaults objectForKey:kFBAccessTokenKey];
            self.facebook.expirationDate = [defaults objectForKey:kFBExpirationDateKey];
        }
        
        self.observer.onDidLogin = ^(){
            if (self.onDidLogin) {
                self.onDidLogin();
            }
        };
        
        self.observer.onGotUserInfo = ^(){
            if (self.onGotCurrentUserInfo) {
                self.onGotCurrentUserInfo();
            }
        };
        
        self.observer.onGotFriendsInfo = ^(){
            if (self.onGotCurrentUserFriendsInfo) {
                self.onGotCurrentUserFriendsInfo();
            }
        };
    }
    return self;
}

+ (FSFacebookManager *)sharedManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

- (void)authorize{
    if (![self.facebook isSessionValid]) {
        [self.facebook authorize:self.permissions];
    }else {
        [self.requester requestUserInfoWithFacebook:self.facebook observer:self.observer];
    }        
}

- (BOOL)completedLogin{
    return [self.facebook isSessionValid];
}

- (void)requestFacebookCueentUserInfo{
    self.observer.currentAPICall = kAPIGraphMe;
    [self.requester requestUserInfoWithFacebook:self.facebook observer:self.observer];
}

- (void)requestFacebookCueentUserFriendsInfo{
    self.observer.currentAPICall = kAPIGraphFriends;
    [self.requester requestCurrentUserFriendsWithFacebook:self.facebook observer:self.observer];
}

- (void)requestFacebookUserAlbumsWith:(FSUser *)user{
    self.observer.currentAPICall = kAPIGraphAlbum;
    [self.requester requestAlbumsWithFacebook:self.facebook observer:self.observer facebookId:user.facebookId];
}


- (void)dealloc{
    [manager release];
    [super dealloc];
}

@end
