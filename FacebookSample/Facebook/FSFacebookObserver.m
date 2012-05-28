//
//  FSFacebookObserver.m
//  FacebookSample
//
//  Created by Fukaya Akifumi on 12/05/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FSFacebookObserver.h"
#import "JSON.h"
#import "FSFacebookInfo.h"

@interface FSFacebookObserver () {

}
@property (nonatomic, strong) NSArray *permissions;
@end

@implementation FSFacebookObserver
@synthesize facebook, permissions, onDidLogin, currentAPICall;

- (void)authorize{
    if (![self.facebook isSessionValid]) {
        [self.facebook authorize:self.permissions];
    }else {
        NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                       @"SELECT uid, name, pic FROM user WHERE uid=me()", @"query",
                                       nil];
        [self.facebook requestWithMethodName:@"fql.query"
                                         andParams:params
                                     andHttpMethod:@"POST"
                                       andDelegate:self];
    }        
}

- (BOOL)completedLogin{
    return [self.facebook isSessionValid];
}

- (void)fbDidLogin{
    if (self.onDidLogin) {
        self.onDidLogin();
    }
}

/**
 * Called when the user dismissed the dialog without logging in.
 */
- (void)fbDidNotLogin:(BOOL)cancelled{
}

/**
 * Called after the access token was extended. If your application has any
 * references to the previous access token (for example, if your application
 * stores the previous access token in persistent storage), your application
 * should overwrite the old access token with the new one in this method.
 * See extendAccessToken for more details.
 */
- (void)fbDidExtendToken:(NSString*)accessToken expiresAt:(NSDate*)expiresAt{
}

/**
 * Called when the user logged out.
 */
- (void)fbDidLogout{
}

/**
 * Called when the current session has expired. This might happen when:
 *  - the access token expired
 *  - the app has been disabled
 *  - the user revoked the app's permissions
 *  - the user changed his or her password
 */
- (void)fbSessionInvalidated{
}


/**
 * Called just before the request is sent to the server.
 */
- (void)requestLoading:(FBRequest *)request{
}

/**
 * Called when the Facebook API request has returned a response.
 *
 * This callback gives you access to the raw response. It's called before
 * (void)request:(FBRequest *)request didLoad:(id)result,
 * which is passed the parsed response object.
 */
- (void)request:(FBRequest *)request didReceiveResponse:(NSURLResponse *)response{
}

/**
 * Called when an error prevents the request from completing successfully.
 */
- (void)request:(FBRequest *)request didFailWithError:(NSError *)error{
}

/**
 * Called when a request returns and its response has been parsed into
 * an object.
 *
 * The resulting object may be a dictionary, an array or a string, depending
 * on the format of the API response. If you need access to the raw response,
 * use:
 *
 * (void)request:(FBRequest *)request
 *      didReceiveResponse:(NSURLResponse *)response
 */
- (void)request:(FBRequest *)request didLoad:(id)result{
    
    if (self.currentAPICall == kAPIGraphMe) {
        if ([result isKindOfClass:[NSArray class]] && ([result count] > 0)) {
            result = [result objectAtIndex:0];
        }
//        NSLog(@"result:%@", result);
//        NSString *userId = [result objectForKey:@"id"];
//        NSString *name = [result objectForKey:@"name"];
//        NSString *pictureURL = [result objectForKey:@"picture"];
    }
}

/**
 * Called when a request returns a response.
 *
 * The result object is the raw response from the server of type NSData
 */
- (void)request:(FBRequest *)request didLoadRawResponse:(NSData *)data{
}

@end