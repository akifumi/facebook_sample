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
    FSCentralBlock onFacebookGotFriendsInfo;
    
}
@property (nonatomic, strong) FSUser *currentUser;
@property (nonatomic, strong) NSArray *friendsInfo;
@property (nonatomic, copy) FSCentralBlock onFacebookDidLogin;
@property (nonatomic, copy) FSCentralBlock onFacebookGotFriendsInfo;
+ (FSCentral *)sharedObject;
+ (void)authorizeFacebook;
+ (BOOL)completedLogin;
@end
