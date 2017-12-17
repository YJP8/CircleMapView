//
//  UIColor+Y.h
//  LineView
//
//  Created by Levante on 2017/11/18.
//  Copyright © 2017年 Levante. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Y)

/**
 从hex字符串获取颜色
 
 @discussion:
 有效格式: #RGB #RGBA #RRGGBB #RRGGBBAA 0xRGB ...
 `#` 或者 "0x" 不写也可以
 alpha 默认为1.0
 解析出错返回nil
 
 Example: @"0xF0F", @"66ccff", @"#66CCFF88"
 
 @param hexStr  hex字符串
 
 @return        颜色
 */
+ (nullable UIColor *)y_colorWithHexString:(NSString *_Nullable)hexStr;


/**
 从hex字符串获取颜色
 
 @discussion:
 有效格式: #RGB #RGBA #RRGGBB #RRGGBBAA 0xRGB ...
 `#` 或者 "0x" 不写也可以
 alpha 默认为1.0
 解析出错返回nil
 
 Example: @"0xF0F", @"66ccff", @"#66CCFF88"
 
 @param hexStr hexStr  hex字符串
 @param alpha 透明度 0 - 1
 @return 颜色
 */
+ (nullable UIColor *)y_colorWithHexString:(NSString *_Nullable)hexStr alpha:(CGFloat)alpha;

@end
