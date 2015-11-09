//
//  MyButterfly.m
//  MyHeart
//
//  Created by kungse on 15/8/23.
//  Copyright (c) 2015年 kungse. All rights reserved.
//

#import "MyButterfly.h"
#import "Brush.h"

@implementation MyButterfly

+ (NSArray *)getButterflyPahtsWithmul:(CGFloat)mul add:(CGFloat)add coil:(NSInteger)coil
{
    CGFloat temp = M_PI_2 / 90; // 角度增量
    CGFloat angle = 0; // 初始角度
    CGFloat E = 2.718281828459; // e
    NSMutableArray *mutableArry = [NSMutableArray array];
    for (NSInteger index = 0; index < coil; index++) {
        UIColor *brushColor = [UIColor colorWithRed:arc4random() %255 / 256.0 green:arc4random() %255 / 256.0 blue:arc4random() %255 / 256.0 alpha:1.0];
        while (angle <= M_PI * 2) {
            CGFloat X = sin(angle) * (pow(E, cos(angle)) - 2 * cos(4 * angle) - pow(angle / 12, 5)) * mul + add;
            CGFloat Y = cos(angle) * (pow(E, cos(angle)) - 2 * cos(4 * angle) - pow(angle / 12, 5)) * mul + add;
            Brush *brush = [[Brush alloc] initWithX:X Y:Y];
            brush.color = brushColor;
            brush.speed = 1 / 3600.0;
            [mutableArry addObject:brush];
            angle += temp;
        }
        angle = 0;
        mul += 10;
    }
    
    return mutableArry;
}

@end
