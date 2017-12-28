//
//  ViewController.m
//  NS_REQUIRES_NIL_TERMINATION
//
//  Created by zhaohang on 2017/12/28.
//  Copyright © 2017年 HangZhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  NSArray *arrays = [self arrayWithObjects:@"1",@"2",@"3",nil];
    [arrays enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"%@",obj);
    }];
}
//原理
-(NSArray *)arrayWithObjects:(id)firstObject,...{
    NSMutableArray *array = [NSMutableArray array];
    va_list arglist;
    id temp;
    if (firstObject) {
        [array addObject:firstObject];
        va_start(arglist, firstObject);
        while ((temp = va_arg(arglist, id))) {
            [array addObject:temp];
        }
    }
   
    return array;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
