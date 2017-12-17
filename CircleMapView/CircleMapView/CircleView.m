//
//  CircleView.m
//  CircleMapView
//
//  Created by Levante on 2017/12/17.
//  Copyright © 2017年 Levante. All rights reserved.
//

#import "CircleView.h"
#import "CircleMapView.h"

#define TITLE_HEIGHT 60
#define PIE_HEIGHT 107
#define Radius 52 //圆形比例图的半径

@interface CircleView()
{
    CircleMapView *circleView;
    id delegate;
}
@end
@implementation CircleView

- (instancetype)initWithFrame:(CGRect)frame  dataArray:(NSMutableArray *)dataArray
{
    if (self = [super initWithFrame:frame]) {
        [self addCirclView:dataArray];
    }
    return self;
}

- (void)addCirclView:(NSMutableArray *)array{
    if (!circleView) {
        circleView = [[CircleMapView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, PIE_HEIGHT) andWithDataArray:array andWithCircleRadius:Radius];
        circleView.backgroundColor = [UIColor whiteColor];
        circleView.dataArray = array;
    }
    [self addSubview:circleView];
}
@end
