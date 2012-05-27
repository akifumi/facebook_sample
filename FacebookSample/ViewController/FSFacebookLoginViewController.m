//
//  FSFacebookLoginViewController.m
//  FacebookSample
//
//  Created by Fukaya Akifumi on 12/05/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FSFacebookLoginViewController.h"
#import "FSHeader.h"
#import "FSCentral.h"

@interface FSFacebookLoginViewController ()

@end

@implementation FSFacebookLoginViewController

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
            [FSCentral authorizeFacebook];
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