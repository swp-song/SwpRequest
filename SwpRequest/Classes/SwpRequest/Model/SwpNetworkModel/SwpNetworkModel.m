//
//  SwpNetworkModel.m
//  swp_song
//
//  Created by swp_song on 16/5/25.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "SwpNetworkModel.h"

#import "SwpNetworkModelTools.h"

static NSString * const kSwpNetworkDomainNameKey    = @"SwpNetworkDomainNameKey";
static NSString * const kSwpNetworkMainInterfaceURL = @"SwpNetworkMainInterfaceURL";

@interface SwpNetworkModel () <NSCopying>

@end


@implementation SwpNetworkModel

static id _swpNetwork;

#pragma mark - Override Methods

/**!
 *  @ author swp_song
 *
 *  @ brief  allocWithZone: ( Override  allocWithZone )
 *
 *  @ param  zone
 *
 *  @ return id
 */
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _swpNetwork = [super allocWithZone:zone];
    });
    return _swpNetwork;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  copyWithZone:  ( Override  copyWithZone )
 *
 *  @ param  zone
 *
 *  @ return id
 */
- (id)copyWithZone:(NSZone *)zone {
    return  _swpNetwork;
}


/**!
 *  @ author swp_song
 *
 *  @ brief  copyWithZone:  ( Override  copyWithZone )
 *
 *  @ param  zone
 *
 *  @ return id
 */
+ (id)copyWithZone:(struct _NSZone *)zone {
    return  _swpNetwork;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  mutableCopyWithZone:   ( Override  mutableCopyWithZone )
 *
 *  @ param  zone
 *
 *  @ return id
 */
+ (id)mutableCopyWithZone:(struct _NSZone *)zone {
    return _swpNetwork;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  mutableCopyWithZone: ( Override  mutableCopyWithZone )
 *
 *  @ param  zone
 *
 *  @ return id
 */
- (id)mutableCopyWithZone:(NSZone *)zone {
    return _swpNetwork;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  init:  ( Override init )
 *
 *  @ return SwpNetworkModel
 */
- (instancetype)init {
    if (self = [super init]) {
        
        _swpNetworkUserLonginState           = NO;
        _swpNetworkDomainName                = @"";
        _swpNetworkMainInterfaceURL          = @"";
        _swpNetworkEncrypt                   = YES;
        _swpNetworkCodeSuccess               = 200;
        _swpNetworkCodeError                 = 400;
        _swpNetworkCode                      = @"code";
        _swpNetworkMessage                   = @"message";
        _swpNetworkObject                    = @"obj";
        _swpNetworkError                     = @"网路异常";
        _swpNetworkCommitDataing             = @"数据提交中...";
        _swpNetworkDeleteDataing             = @"数据删除中...";
        _swpNetworkUpdateDataing             = @"数据修改中...";
        _swpNetworkLogin                     = @"用户登陆中...";
        _swpNetworkGetDagaingTitle           = @"努力获取中...";
        _swpNetworkRefreshDataTitle          = @"努力刷新中...";
        _swpNetworkToLoadDataTitle           = @"努力加载中...";
        _swpNetworkNotData                   = @"没有更多数据...";
        _swpNetworkDataNULL                  = @"获取数据异常...";
        
    }
    return self;
}


#pragma mark - Public Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  shareInstance ( 单利 )
 *
 *  @ return SwpNetworkModel
 */
+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        _swpNetwork = [[self alloc] init];
    });
    return _swpNetwork;
}


/**!
 *  @ author swp_song
 *
 *  @ brief  swpChekNetworkError: ( 检查是否 是否 是返回网络异常的提示信息 )
 *
 *  @ param  errorMessage
 *
 *  @ return NSString
 */
+ (NSString *)swpChekNetworkError:(NSString *)errorMessage {
    return errorMessage == nil ? [SwpNetworkModel shareInstance].swpNetworkError : errorMessage;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpNetworkSetNetworkDomainName:setMainInterface:  ( 设置 接口 域名 和 主接口地址 )
 *
 *  @ param  domainName
 *
 *  @ param  mainInterfaceURL
 */
+ (void)swpNetworkSetNetworkDomainName:(NSString *)domainName setMainInterface:(NSString *)mainInterfaceURL {
    
    SwpNetworkModel *swpNetwork           = [SwpNetworkModel shareInstance];
    swpNetwork.swpNetworkDomainName       = [SwpNetworkModelTools swpNetworkModelToolsGetDomainName:domainName setMainInterface:mainInterfaceURL];
    swpNetwork.swpNetworkMainInterfaceURL = [SwpNetworkModelTools swpNetworkModelToolsGetMainInterfaceURL:domainName setMainInterface:mainInterfaceURL];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpNetworkSetNetworkGetMainInterfaceDomainName:    ( 取出主接口 域名 )
 *
 *  @ return NSString
 */
+ (NSString *)swpNetworkSetNetworkGetMainInterfaceDomainName {
    return [NSString stringWithFormat:@"%@%@", [SwpNetworkModel shareInstance].swpNetworkDomainName, [SwpNetworkModel shareInstance].swpNetworkMainInterfaceURL];
}

@end

