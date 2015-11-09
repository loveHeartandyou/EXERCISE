//
//  MyHeart.m
//  MyHeart
//
//  Created by kungse on 15/8/21.
//  Copyright (c) 2015年 kungse. All rights reserved.
//

#import "MyHeart.h"
#import "Brush.h"

@implementation MyHeart

+ (NSArray *)getHeartPahtsWithmul:(CGFloat)mul add:(CGFloat)add
{
    NSMutableArray *pointArray = [NSMutableArray array];
    /*
     心形曲线函数
     x=a*(2*cos(t)-cos(2*t))
     y=a*(2*sin(t)-sin(2*t))
     */
    /*
     根据函数计算坐标点
     可以看到函数的变量是角
     */
    // 设一个变量，用来设置角度的值
    CGFloat angle = 0;
    // 每次角度增加的值
    CGFloat tempAngle = M_PI / 180;
    for (NSInteger index = 0; index < 360; index++) {
        // 根据函数计算坐标点并保存
        CGFloat point_x = mul * (cos(angle)) + add;
        CGFloat firstParame = 1 - pow(cos(angle), 2);
        if (angle > M_PI_2 * 2) {
            firstParame = -pow(fabs(firstParame), 1 / 2.0);
        } else {
            firstParame = pow(fabs(firstParame), 1 / 2.0);
        }
        CGFloat point_y = mul * (firstParame - pow(pow(cos(angle), 2), 1 / 3.0)) + add;
        Brush *brush = [Brush new];
        brush.X = point_x;
        brush.Y = point_y;
        brush.speed = 1 / 36.0;
        [pointArray addObject:brush];
        angle += tempAngle;
    }
    
    return pointArray;
}

@end
