//
//  Brush.h
//  MyHeart
//
//  Created by kungse on 15/8/21.
//  Copyright (c) 2015年 kungse. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Brush : NSObject

- (instancetype)initWithX:(CGFloat)X Y:(CGFloat)Y;

@property (nonatomic, assign) CGFloat X;
@property (nonatomic, assign) CGFloat Y;
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) CGFloat speed;

@end
