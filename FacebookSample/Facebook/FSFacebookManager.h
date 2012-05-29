//
//  FSFacebookManager.h
//  FacebookSample
//
//  Created by Fukaya Akifumi on 12/05/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSUser.h"

typedef void (^FacebookManagerDelegateBlock)();

@interface FSFacebookManager : NSObject {
    
    FacebookManagerDelegateBlock onDidLogin;
    FacebookManagerDelegateBlock onGotCurrentUserInfo;
    FacebookManagerDelegateBlock onGotCurrentUserFriendsInfo;

}
@property (nonatomic, copy) FacebookManagerDelegateBlock onDidLogin;
@property (nonatomic, copy) FacebookManagerDelegateBlock onGotCurrentUserInfo;
@property (nonatomic, copy) FacebookManagerDelegateBlock onGotCurrentUserFriendsInfo;
+ (FSFacebookManager *)sharedManager;
- (void)authorize;
- (BOOL)completedLogin;
- (void)requestFacebookCueentUserInfo;
- (void)requestFacebookUserAlbumsWith:(FSUser *)user;
- (void)requestFacebookCueentUserFriendsInfo;
@end
