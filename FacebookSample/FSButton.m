//
//  FSButton.m
//  FacebookSample
//
//  Created by Fukaya Akifumi on 12/05/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FSButton.h"

typedef void (^ActionBlock)();

@interface FSButton() {
    ActionBlock _actionBlock;
}
@end

@implementation FSButton
@synthesize size = _size, position = _position;

- (id)initWithFileName:(NSString *)fileName{
    if (self = [super init]) {
        UIImage *buttonImage = [UIImage imageNamed:fileName];
        [self setImage:buttonImage forState:UIControlStateNormal];
        self.size = CGSizeMake(buttonImage.size.width, buttonImage.size.height);
        self.frame = CGRectMake(0, 0, self.size.width, self.size.height);
    }
    return self;
}

+ (FSButton *)createWithFileName:(NSString *)fileName{
    return [[self alloc] initWithFileName:fileName];
}

- (void)setPosition:(CGPoint)position{
    self.frame = CGRectMake(position.x, position.y, self.frame.size.width, self.frame.size.height);
}

- (void)callActionBlock:(id)sender{
    _actionBlock();
}

- (void)handleControlEvent:(UIControlEvents)event block:(void(^)())block{
    _actionBlock = Block_copy(block);
    [self addTarget:self action:@selector(callActionBlock:) forControlEvents:event];
}

@end
