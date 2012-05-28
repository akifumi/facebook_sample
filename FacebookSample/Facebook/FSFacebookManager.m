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

static FSFacebookManager *manager = nil;

@interface FSFacebookManager(){

}
@property (nonatomic, strong) Facebook *facebook;
@property (nonatomic, strong) NSArray *permissions;
@property (nonatomic, strong) FSFacebookObserver *observer;
@property (nonatomic, strong) FSFacebookRequester *requester;
@end

@implementation FSFacebookManager
@synthesize onDidLogin;
@synthesize facebook, permissions, observer, requester;

- (id)init{
    if (self = [super init]) {
        self.observer = [[[FSFacebookObserver alloc] init] autorelease];
        self.requester = [[[FSFacebookRequester alloc] init] autorelease];
        self.facebook = [[Facebook alloc] initWithAppId:kAppId andDelegate:self.observer];
        self.observer.facebook = self.facebook;
        
        self.observer.onDidLogin = ^(){
            self.observer.currentAPICall = kAPIGraphMe;
            if (self.onDidLogin) {
                self.onDidLogin();
            }
            [self.requester requestUserInfoWithFacebook:self.facebook observer:self.observer];
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

- (BOOL)completedLogin{
    return [self.observer completedLogin];
}

- (void)authorize{
    [self.observer authorize];
}

@end
