//
//  ViewController.m
//  HH_ObjectSafe
//
//  Created by mac on 2018/6/10.
//  Copyright © 2018年 JS. All rights reserved.
//

#import "ViewController.h"
#import "HH_ObjectSafe.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // __NSCFConstantString 类型
    NSString *tmpConstantString = @"432423432432432432";
    NSLog(@"%@",[tmpConstantString substringFromIndex:10000]) ;
    NSLog(@"%@",[tmpConstantString substringToIndex:1000]);
    NSLog(@"%@",[tmpConstantString substringWithRange:NSMakeRange(100, 10000)]);
    NSLog(@"%@",[tmpConstantString rangeOfString:nil]);
    
    // NSTaggedPointerString 类型
    NSString *tmpPointerString = [NSString stringWithFormat:@"4"];
    [tmpPointerString substringFromIndex:10000];
    [tmpPointerString substringToIndex:1000];
    [tmpPointerString substringWithRange:NSMakeRange(100, 10000)];
    [tmpPointerString rangeOfString:nil];
    
    
    NSMutableString *tmpCFString = [NSMutableString stringWithFormat:@"4535435435435"];
    [tmpCFString substringFromIndex:10000];
    [tmpCFString substringToIndex:1000];
    [tmpCFString substringWithRange:NSMakeRange(100, 10000)];
    [tmpCFString rangeOfString:nil];
    [tmpCFString appendString:nil];
    
    // __NSArray0 类型
    NSArray *tmpZoroArray = [NSArray array];
    tmpZoroArray[100];
    [tmpZoroArray objectAtIndex:1000];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
