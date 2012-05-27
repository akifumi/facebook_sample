//
//  FSButton.h
//  FacebookSample
//
//  Created by Fukaya Akifumi on 12/05/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FSButton : UIButton {

}
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint position;
+ (FSButton *)createWithFileName:(NSString *)fileName;
- (void)handleControlEvent:(UIControlEvents)event block:(void(^)())block;
@end
