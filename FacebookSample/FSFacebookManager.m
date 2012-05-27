//
//  FSFacebookManager.m
//  FacebookSample
//
//  Created by Fukaya Akifumi on 12/05/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FSFacebookManager.h"
#import "FSFacebookObserver.h"

static FSFacebookManager *manager = nil;

@interface FSFacebookManager(){

}
@property (nonatomic, strong) FSFacebookObserver *observer;
@end

@implementation FSFacebookManager
@synthesize onDidLogin;
@synthesize observer;

- (id)init{
    if (self = [super init]) {
        self.observer = [FSFacebookObserver create];
        self.observer.onDidLogin = ^(){
            if (self.onDidLogin) {
                self.onDidLogin();
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

- (BOOL)completedLogin{
    return [self.observer completedLogin];
}

- (void)authorize{
    [self.observer authorize];
}

@end
