//
//  FSRootViewController.m
//  FacebookSample
//
//  Created by Fukaya Akifumi on 12/05/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FSRootViewController.h"
#import "AppDelegate.h"
#import "FSNavigationBar.h"
#import "FSHeader.h"

@interface FSRootViewController ()

@end

@implementation FSRootViewController
@synthesize permissions;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        
        FSNavigationBar *navigationBar = [FSNavigationBar createWithTitle:@"Login"];
        [self.view addSubview:navigationBar];
        
        FSButton *button = [FSButton createWithFileName:@"FBConnect.bundle/images/LoginWithFacebookPressed.png"];
        button.position = CGPointMake((screenSize.width - button.size.width)/2, screenSize.height - button.size.height - 30);
        [button handleControlEvent:UIControlEventTouchUpInside block:^(){
            AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
            if (![[delegate facebook] isSessionValid]) {
                UIWebView *webView = [[UIWebView alloc] init];
                [self.view addSubview:webView];
                [delegate.facebook authorize:permissions];
            }else {
                NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                               @"SELECT uid, name, pic FROM user WHERE uid=me()", @"query",
                                               nil];
                [[delegate facebook] requestWithMethodName:@"fql.query"
                                                 andParams:params
                                             andHttpMethod:@"POST"
                                               andDelegate:delegate];
            }        
        }];
        [self.view addSubview:button];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
