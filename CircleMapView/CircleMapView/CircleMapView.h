//
//  CircleMapView.h
//  CircleMapView
//
//  Created by Levante on 2017/12/17.
//  Copyright © 2017年 Levante. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleMapView : UIView

/**
 * 框架
 */
@property(nonatomic , assign) CGRect fFrame;
/**
 * 数据数组
 */
@property(nonatomic , strong) NSMutableArray *dataArray;
/**
 * 半径
 */
@property(nonatomic , assign) CGFloat circleRadius;
/**
 * 初始化

 @param frame 框架
 @param dataArray 数据数组
 @param circleRadius 半径
 @return 实例
 */
- (instancetype)initWithFrame:(CGRect)frame andWithDataArray:(NSMutableArray *)dataArray andWithCircleRadius:(CGFloat)circleRadius;

@end
