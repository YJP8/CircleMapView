//
//  ViewController.m
//  CircleMapView
//
//  Created by Levante on 2017/12/17.
//  Copyright © 2017年 Levante. All rights reserved.
//

#import "ViewController.h"
#import "CircleView.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIView *backGroundView;

@property(nonatomic , strong) CircleView *circleView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *dataArray = [[NSMutableArray alloc]initWithArray:@[
                                                                        @{@"number":@"300", @"color":@"#FF424C"},
                                                                        @{@"number":@"500", @"color":@"#FFD240"},
                                                                        @{@"number":@"800", @"color":@"#8E44AD"},
                                                                        @{@"number":@"200", @"color":@"#4B95EC",}]];
    _circleView = [[CircleView alloc]initWithFrame:self.backGroundView.bounds dataArray:dataArray];
    
    [self.backGroundView addSubview:self.circleView];

}
@end
