//
//  ViewController.m
//  SwpRequestDemo
//
//  Created by swp_song on 2017/1/12.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "ViewController.h"

#import "SwpRequestHeader.h"

static NSString * const urlString2 = @"https://www.12306.cn/mormhweb/";

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UILabel *resultMessageLabelView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self swpRequestGetData:urlString2];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)swpRequestGetData:(NSString *)urlString  {
    
    NSDictionary *dictionary = @{
                                 @"app_key" : urlString,
                                 };
    [SwpRequest swpPOST:urlString parameters:dictionary isEncrypt:NO swpResultSuccess:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull resultObject) {
        self.resultMessageLabelView.text = @"请求成功...";
    } swpResultError:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error, NSString * _Nonnull errorMessage) {
        NSLog(@"%@", errorMessage);
        self.resultMessageLabelView.text = errorMessage;
    }];
    
}


@end
