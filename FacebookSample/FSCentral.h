//
//  FSCentral.h
//  FacebookSample
//
//  Created by Fukaya Akifumi on 12/05/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^Block)();

@interface FSCentral : NSObject {

    Block onFacebookDidLogin;
    
}
@property (nonatomic, copy) Block onFacebookDidLogin;
+ (FSCentral *)sharedObject;
+ (void)authorizeFacebook;
+ (BOOL)completedLogin;
@end
