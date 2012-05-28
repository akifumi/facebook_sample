//
//  FSFacebookRequester.h
//  FacebookSample
//
//  Created by 深谷 哲史 on 12/05/28.
//  Copyright (c) 2012 Keio University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Facebook.h"

@interface FSFacebookRequester : NSObject {
    
}
- (void)requestUserInfoWithFacebook:(Facebook *)facebook observer:(id)observer;
@end
