//
//  SwpNetworkModel.m
//  swp_song
//
//  Created by swp_song on 16/5/25.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "SwpNetworkModel.h"

@implementation SwpNetworkModel

/*!
 *  @author swp_song
 *
 *  @brief  shareInstance ( 单利 )
 *
 *  @return SwpNetworkModel
 */
+ (instancetype)shareInstance {
    static SwpNetworkModel *swpNetwork = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate,^{
        swpNetwork = [[self alloc] init];
    });
    return swpNetwork;
}

/*!
 *  @author swp_song
 *
 *  @brief  Override init
 *
 *  @return SwpNetworkModel
 */
- (instancetype)init {
    
    if (self = [super init]) {
        
        _swpNetworkUserLonginState  = NO;
        _swpNetworkBaseURL          = @"";
        _swpNetworkBaseSet          = @"";
        _swpNetworkEncrypt          = YES;
        _swpNetworkCodeSuccess      = 200;
        _swpNetworkCodeError        = 400;
        _swpNetworkCode             = @"code";
        _swpNetworkMessage          = @"message";
        _swpNetworkObject           = @"obj";
        _swpNetworkError            = @"网路异常";
        _swpNetworkCommitDataing    = @"数据提交中...";
        _swpNetworkDeleteDataing    = @"数据删除中...";
        _swpNetworkUpdateDataing    = @"数据修改中...";
        _swpNetworkLogin            = @"用户登陆中...";
        _swpNetworkGetDagaingTitle  = @"努力获取中...";
        _swpNetworkRefreshDataTitle = @"努力刷新中...";
        _swpNetworkToLoadDataTitle  = @"努力加载中...";
        _swpNetworkNotData          = @"没有更多数据...";
        _swpNetworkDataNULL         = @"获取数据异常...";
        
    }
    return self;
}

/*!
 *  @author swp_song
 *
 *  @brief  swpChekNetworkError: ( 检查是否 是否 是返回网络异常的提示信息 )
 *
 *  @param  errorMessage
 *
 *  @return NSString
 */
+ (NSString *)swpChekNetworkError:(NSString *)errorMessage {
    return errorMessage == nil ? [SwpNetworkModel shareInstance].swpNetworkError : errorMessage;
}

/*!
 *  @author swp_song
 *
 *  @brief  swpNetworkSetBaseURL:baseSet    ( 设置 接口 域名 和 主接口地址 )
 *
 *  @param  baseURL
 *
 *  @param  baseSet
 */
+ (void)swpNetworkSetBaseURL:(NSString *)baseURL baseSet:(NSString *)baseSet {
    [SwpNetworkModel shareInstance].swpNetworkBaseURL = baseURL;
    [SwpNetworkModel shareInstance].swpNetworkBaseSet = baseSet;
}

@end

