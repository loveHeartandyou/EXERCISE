//
//  MyHeartView.m
//  MyHeart
//
//  Created by kungse on 15/8/21.
//  Copyright (c) 2015年 kungse. All rights reserved.
//

#import "MyHeartView.h"
#import "Brush.h"

@implementation MyHeartView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.values = [NSMutableArray array];
    }
    return self;
}

#pragma mark 对视图进行重绘
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    // 获取绘图的上下文（好吧，我也不知道这是什么东西）
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillRect(context, self.bounds);
    // 设置绘制的线的宽度
//    UIBezierPath *path = [UIBezierPath bezierPathWithCGPath:<#(CGPathRef)#>]
    CGContextSetLineWidth(context, 3);
    // 设置起点和终点的点的样式
    CGContextSetLineCap(context, kCGLineCapRound);
    if (self.values.count > 1) {
        NSLog(@"%ld", self.values.count);
        // 开始绘制视图
        for (NSInteger index = 0; index < self.values.count - 1; index++) {
            Brush *value = self.values[index];
            Brush *next_value = self.values[index + 1];
            // 设置绘制的线的颜色
            CGContextSetStrokeColorWithColor(context, value.color.CGColor);
            // 起点
            CGContextMoveToPoint(context, value.X, value.Y);
            // 终点
            CGContextAddLineToPoint(context, next_value.X, next_value.Y);
            // 保存状态
            CGContextStrokePath(context); 
        }
    }

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
