//
//  FSFacebookManager.h
//  FacebookSample
//
//  Created by Fukaya Akifumi on 12/05/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^FacebookManagerDelegateBlock)();

@interface FSFacebookManager : NSObject {
    
    FacebookManagerDelegateBlock onDidLogin;
    FacebookManagerDelegateBlock onGotUserInfo;
    FacebookManagerDelegateBlock onGotFriendsInfo;

}
@property (nonatomic, copy) FacebookManagerDelegateBlock onDidLogin;
@property (nonatomic, copy) FacebookManagerDelegateBlock onGotUserInfo;
@property (nonatomic, copy) FacebookManagerDelegateBlock onGotFriendsInfo;
+ (FSFacebookManager *)sharedManager;
- (void)authorize;
- (BOOL)completedLogin;
@end
