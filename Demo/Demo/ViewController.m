//
//  ViewController.m
//  Demo
//
//  Created by songweiping on 16/4/12.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "ViewController.h"

#import "SwpRequestHeader.h"


static NSString * const urlString = @"http://o2oservice.youzhiapp.com/test/test_list1";

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UILabel *resultMessageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self swpRequestGetData:urlString];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)swpRequestGetData:(NSString *)urlString  {
    
    NSDictionary *dictionary = @{
                                 @"app_key" : urlString,
                                 };
    [SwpRequest swpPOST:urlString parameters:dictionary isEncrypt:YES swpResultSuccess:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull resultObject) {
        [SwpRequest swpRequestYouZhiPrintDataInformation:resultObject];
        self.resultMessageView.text = @"请求成功...";
    } swpResultError:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error, NSString * _Nonnull errorMessage) {
        NSLog(@"%@", errorMessage);
        self.resultMessageView.text = errorMessage;
    }];
    
}

@end
