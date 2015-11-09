//
//  Brush.m
//  MyHeart
//
//  Created by kungse on 15/8/21.
//  Copyright (c) 2015年 kungse. All rights reserved.
//

#import "Brush.h"

@implementation Brush

- (instancetype)init
{
    self = [super init];
    if (self) {
        _color = [UIColor magentaColor];
    }
    return self;
}

- (instancetype)initWithX:(CGFloat)X Y:(CGFloat)Y
{
    self = [super init];
    if (self) {
        _X = X;
        _Y = Y;
        _color = [UIColor magentaColor];
    }
    return self;
}

@end
