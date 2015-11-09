//
//  ViewController.m
//  MyHeart
//
//  Created by kungse on 15/8/21.
//  Copyright (c) 2015年 kungse. All rights reserved.
//

#import "ViewController.h"
#import "MyHeartView.h"
#import "MyButterfly.h"
#import "MyHeart.h"
#import "Brush.h"

@interface ViewController ()

@property (nonatomic, strong) MyHeartView *myHeartView;
@property (nonatomic, strong) UILabel *myLabel;
@property (nonatomic, strong) UILabel *myText;
@property (nonatomic, strong) NSArray *values;
@property (nonatomic, strong) NSArray *butterflyValues;
@property (nonatomic, strong) NSMutableDictionary *brushPahts;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.brushPahts = [NSMutableDictionary dictionary];
    [self.brushPahts setObject:[MyHeart getHeartPahtsWithmul:100 add:375.0 / 2] forKey:@"heart"];
    self.values = [self.brushPahts.allValues firstObject];
    self.myHeartView = [[MyHeartView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.myHeartView];
    [self.myHeartView setNeedsDisplay];
    CGFloat textFont = 15;
    Brush *firstBrush = [self.values firstObject];
    self.myLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [@"静" sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:textFont]}].width, [@"静" sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:textFont]}].height)];
    self.myLabel.layer.position = CGPointMake(firstBrush.X, firstBrush.Y);
    self.myLabel.text = @"静";
    self.myLabel.font = [UIFont systemFontOfSize:textFont];
    self.myLabel.textColor = firstBrush.color;
    [self.view addSubview:self.myLabel];
    self.myLabel.layer.anchorPoint = CGPointMake(-0.5, 0.5);
    UIButton *myButton = [UIButton buttonWithType:UIButtonTypeSystem];
    myButton.frame = CGRectMake(100, 0, 375 - 100 * 2, 44);
    [myButton setTitle:@"Click" forState:UIControlStateNormal];
    [myButton addTarget:self action:@selector(Click) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = myButton;
    
    self.myText = [[UILabel alloc] initWithFrame:CGRectMake(0, 400, 375, 30)];
    NSString *contextStr = @"I Love You";
    NSLog(@"%@", [UIFont familyNames]);
    NSMutableAttributedString *contentAttr = [[NSMutableAttributedString alloc] initWithString:contextStr attributes:@{NSFontAttributeName:[UIFont fontWithName:@"Times New Roman" size:30]}];
    self.myText.attributedText = contentAttr;
    self.myText.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.myText];
}
int count = 0;
UIColor *lineColor;
BOOL isStopDraw = NO;
- (void)Click
{
    [self draws];
    [self changeColor];
}

- (void)draws
{
    if (count >= self.values.count) {
        [self.myHeartView.values removeAllObjects];
        if ([[self.brushPahts.allKeys firstObject] isEqualToString:@"heart"]) {
            [self.brushPahts removeAllObjects];
            [self.brushPahts setValue:[MyButterfly getButterflyPahtsWithmul:10 add:375 / 2.0 coil:10] forKey:@"bufferfly"];
            self.values = [self.brushPahts.allValues firstObject];
        } else {
            [self.brushPahts removeAllObjects];
            [self.brushPahts setObject:[MyHeart getHeartPahtsWithmul:100 add:375 / 2.0] forKey:@"heart"];
            self.values = [self.brushPahts.allValues firstObject];
        }
        count = 0;
    }
    Brush *currentBruch = self.values[count];
    self.myLabel.layer.position = CGPointMake(currentBruch.X, currentBruch.Y);
    Brush *brush = self.values[count];
    if (!isStopDraw) {
        brush.color = [UIColor colorWithRed:arc4random() %255 / 256.0 green:arc4random() %255 / 256.0 blue:arc4random() %255 / 256.0 alpha:1.0];
        [self.myHeartView.values addObject:brush];
        [self.myHeartView setNeedsDisplay];
    }
    self.myLabel.textColor = brush.color;
    count++;
    [self performSelector:@selector(draws) withObject:nil afterDelay:brush.speed];
}
- (void)changeColor
{
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithAttributedString:self.myText.attributedText];
    for (NSInteger index = 0; index < attributeString.string.length; index++) {
        [attributeString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:arc4random() %255 / 256.0 green:arc4random() %255 / 256.0 blue:arc4random() %255 / 256.0 alpha:1.0] range:NSMakeRange(index, 1)];
        CGFloat font = arc4random() % 20;
        [attributeString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:font + 20] range:NSMakeRange(index, 1)];
    }
    self.myText.attributedText = attributeString;
    [self performSelector:@selector(changeColor) withObject:nil afterDelay:1 / 6.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
