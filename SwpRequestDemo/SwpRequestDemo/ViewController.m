//
//  ViewController.m
//  SwpRequestDemo
//
//  Created by swp_song on 2017/1/12.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "ViewController.h"

#import "SwpRequestHeader.h"

static NSString * const urlString1 = @"https://www.12306.cn/mormhweb/";

static NSString * const urlString2 = @"http://d.api.budejie.com/topic/list/chuanyue/29/bs0315-iphone-4.5.6/0-8.json";



@interface ViewController ()

@property (nonatomic, weak) IBOutlet UILabel *resultMessageLabelView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self swpRequestGetData:urlString1];
    [self swpRequestGetData:urlString2];
    
    SwpRequest *swpRequest01 = [SwpRequest shareInstance];
    SwpRequest *swpRequest02 = [SwpRequest shareInstance];
    SwpRequest *swpRequest03 = [[SwpRequest alloc] init];
    SwpRequest *swpRequest04 = [[SwpRequest alloc] init];
    SwpRequest *swpRequest05 = [SwpRequest new];
    SwpRequest *swpRequest06 = [SwpRequest new];
    SwpRequest *swpRequest07 = [swpRequest01 copy];
    SwpRequest *swpRequest08 = [swpRequest02 copy];
    SwpRequest *swpRequest09 = [swpRequest03 mutableCopy];
    SwpRequest *swpRequest10 = [swpRequest04 mutableCopy];
    
    NSLog(@"swpRequest01 = %p, swpRequest02 = %p, swpRequest03 = %p, swpRequest04 = %p, swpRequest05 = %p, swpRequest06 = %p, swpRequest07 = %p, swpRequest08 = %p, swpRequest09 = %p, swpRequest10 = %p, ",  swpRequest01, swpRequest02, swpRequest03, swpRequest04, swpRequest05, swpRequest06, swpRequest07 , swpRequest08, swpRequest09, swpRequest10);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)swpRequestGetData:(NSString *)urlString  {
    
    // http://d.api.budejie.com/topic/list/chuanyue/29/bs0315-iphone-4.5.6/0-8.json
    [SwpRequest swpPOST:urlString parameters:@{} swpResultSuccess:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull resultObject) {
        NSLog(@"%@", resultObject);
        if (!resultObject) {
            NSLog(@" resultObject = %@ \r 请求成功, 解析数据失败,", resultObject);
        }
    } swpResultError:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error, NSString * _Nonnull errorMessage) {
        
    }];
    
}


@end
