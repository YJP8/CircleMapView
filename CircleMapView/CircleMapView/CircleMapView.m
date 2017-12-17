//
//  CircleMapView.m
//  CircleMapView
//
//  Created by Levante on 2017/12/17.
//  Copyright © 2017年 Levante. All rights reserved.
//

#import "CircleMapView.h"
#import "YUIColor/UIColor+Y.h"

#define PI 3.14159265358979323846
#define degreesToRadian(x) ( 180.0 / PI * (x))
// 颜色
#define RGB_A(r, g, b, a) ([UIColor colorWithRed:(r)/255.0f \
green:(g)/255.0f \
blue:(b)/255.0f \
alpha:(a)/255.0f])

#define radiu 35.0 //中心白色圆的半径
@implementation CircleMapView

- (instancetype)initWithFrame:(CGRect)frame andWithDataArray:(NSMutableArray *)dataArray andWithCircleRadius:(CGFloat)circleRadius {
    if (self = [super initWithFrame:frame]) {
        _dataArray = [[NSMutableArray alloc] init];
        _circleRadius = circleRadius;
    }
    return self;
}

-(CGFloat)getShareNumber:(NSMutableArray *)arr{  //比例
    CGFloat f = 0.0;
    for (int  i = 0; i < arr.count; i++) {
        f += [arr[i][@"number"] floatValue];
    }
    return M_PI*2 / f;
}

#pragma mark 画外圆
-(void)drawRect:(CGRect)rect{
    CGFloat bl = [self getShareNumber:_dataArray];
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGFloat angle_start = 0;
    CGFloat ff = 0;
    [self drawArcWithCGContextRef:ctx andWithPoint:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2) andWithAngle_start:angle_start andWithAngle_end:8 andWithColor:[UIColor y_colorWithHexString:@"F5FAFF"] andInt:1];
    for (int i = 0; i < _dataArray.count; i++) {
        CGFloat angle_end =([_dataArray[i][@"number"]  floatValue] *bl + ff);
        ff += [_dataArray[i][@"number"] floatValue] *bl;
        [self drawArcWithCGContextRef:ctx andWithPoint:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2) andWithAngle_start:angle_start andWithAngle_end:angle_end andWithColor:[UIColor y_colorWithHexString: _dataArray[i][@"color"]] andInt:i];
        angle_start = angle_end;
    }
    
    [self addCenterCircle];
}

-(void)addCenterCircle{
    UIBezierPath *arcPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2) radius:radiu startAngle:0 endAngle:PI * 2 clockwise:YES];
    
    [[UIColor whiteColor] set];
    [arcPath fill];
    [arcPath stroke];
    
    UILabel *totalasseLabel = [[UILabel alloc] initWithFrame:CGRectMake(36, 13, 35, 80)];
    totalasseLabel.text = @"资产结构";
    totalasseLabel.numberOfLines = 0;
    totalasseLabel.textColor = [UIColor blackColor];
    [totalasseLabel setFont:[UIFont systemFontOfSize:13]];
    totalasseLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:totalasseLabel];
    
}

-(CGFloat)radians:(CGFloat)degrees {
    return degrees * M_PI / 180;
}

-(void)drawArcWithCGContextRef:(CGContextRef)ctx
                  andWithPoint:(CGPoint) point
            andWithAngle_start:(float)angle_start
              andWithAngle_end:(float)angle_end
                  andWithColor:(UIColor *)color
                        andInt:(int)n {
    
    CGContextMoveToPoint(ctx, point.x, point.y);
    CGContextSetFillColor(ctx, CGColorGetComponents( color.CGColor));
    CGContextAddArc(ctx, point.x, point.y, _circleRadius,  angle_start, angle_end, 0);
    CGContextFillPath(ctx);
}

- (void)setDataArray:(NSMutableArray *)dataArray{
    _dataArray = dataArray;
    [self setNeedsDisplay];
}


@end
