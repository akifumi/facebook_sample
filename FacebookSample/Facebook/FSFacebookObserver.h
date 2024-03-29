//
//  FSFacebookObserver.h
//  FacebookSample
//
//  Created by Fukaya Akifumi on 12/05/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Facebook.h"

typedef void (^FacebookObserverDelegateBlock)();

@interface FSFacebookObserver : NSObject <FBSessionDelegate, FBRequestDelegate> {
        
    FacebookObserverDelegateBlock onDidLogin;
    FacebookObserverDelegateBlock onGotUserInfo;
    FacebookObserverDelegateBlock onGotFriendsInfo;
    
}
@property (nonatomic, strong) Facebook *facebook;
@property (nonatomic, copy) FacebookObserverDelegateBlock onDidLogin;
@property (nonatomic, copy) FacebookObserverDelegateBlock onGotUserInfo;
@property (nonatomic, copy) FacebookObserverDelegateBlock onGotFriendsInfo;
@property (assign) int currentAPICall;
@end
