//
//  FSNavigationController.m
//  FacebookSample
//
//  Created by Fukaya Akifumi on 12/05/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FSNavigationBar.h"

@implementation FSNavigationBar

+ (FSNavigationBar *)createWithTitle:(NSString *)title{
    FSNavigationBar *navigationBar = [[FSNavigationBar alloc] init];
    navigationBar.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40);
    
    UINavigationItem *titleItem = [[UINavigationItem alloc] initWithTitle:title];
    
    [navigationBar pushNavigationItem:titleItem animated:YES];
    
    return navigationBar;
}

@end
