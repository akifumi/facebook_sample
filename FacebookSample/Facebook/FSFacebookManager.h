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

}
@property (nonatomic, copy) FacebookManagerDelegateBlock onDidLogin;
+ (FSFacebookManager *)sharedManager;
- (void)authorize;
- (BOOL)completedLogin;
@end
