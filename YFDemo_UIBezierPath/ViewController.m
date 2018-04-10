//
//  ViewController.m
//  YFDemo_UIBezierPath
//
//  Created by 亚飞 on 2018/4/10.
//  Copyright © 2018年 yafei. All rights reserved.
//

#import "ViewController.h"
#import "YFUIBezierPathView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    YFUIBezierPathView *bezView = [[YFUIBezierPathView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    bezView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bezView];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
