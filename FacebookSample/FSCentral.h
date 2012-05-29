//
//  FSCentral.h
//  FacebookSample
//
//  Created by Fukaya Akifumi on 12/05/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSUser.h"

typedef void (^FSCentralBlock)();

@interface FSCentral : NSObject {

    FSCentralBlock onFacebookDidLogin;
    FSCentralBlock onFacebookGotCurrentUserInfo;
    FSCentralBlock onFacebookGotCurrentUserFriendsInfo;
    
}
@property (nonatomic, strong) FSUser *currentUser;
@property (nonatomic, strong) NSArray *curentUserFriendsInfo;
@property (nonatomic, copy) FSCentralBlock onFacebookDidLogin;
@property (nonatomic, copy) FSCentralBlock onFacebookGotCurrentUserInfo;
@property (nonatomic, copy) FSCentralBlock onFacebookGotCurrentUserFriendsInfo;
+ (FSCentral *)sharedObject;
+ (void)authorizeFacebook;
+ (BOOL)completedFacebookLogin;
+ (void)requestFacebookCueentUserInfo;
+ (void)requestFacebookCueentUserFriendsInfo;
+ (void)requestFacebookUserAlbumsWith:(FSUser *)user;
@end
