//
//  SwpNetworkModel.h
//  swp_song
//
//  Created by swp_song on 16/5/25.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SwpNetworkModel : NSObject
/** 获取网路 请求网络域名          */
@property (nonatomic, copy) NSString *swpNetworkDomainName;
/** 获取网路 主接口  地址          */
@property (nonatomic, copy) NSString *swpNetworkMainInterfaceURL;
/** 获取网路 接口 是否 加密        */
@property (nonatomic, assign, getter = isSwpNetworkEncrypt) BOOL swpNetworkEncrypt;
/** 获取接口数据状态返回成功       */
@property (nonatomic, assign) NSInteger swpNetworkCodeSuccess;
/** 获取接口数据状态返回失败       */
@property (nonatomic, assign) NSInteger swpNetworkCodeError;
/** 获取接口数据状态值             */
@property (nonatomic, copy  ) NSString  *swpNetworkCode;
/** 获取接口返回状态信息           */
@property (nonatomic, copy  ) NSString  *swpNetworkMessage;
/** 获取网路数据错误               */
@property (nonatomic, copy  ) NSString  *swpNetworkError;
/** 获取接口返回数据               */
@property (nonatomic, copy  ) NSString  *swpNetworkObject;
/** 用户提交数据时 显示的信息       */
@property (nonatomic, copy  ) NSString  *swpNetworkCommitDataing;
/** 用户删除数据时 显示的信息      */
@property (nonatomic, copy  ) NSString  *swpNetworkDeleteDataing;
/** 用户修改数据时 显示的信息      */
@property (nonatomic, copy  ) NSString  *swpNetworkUpdateDataing;
/** 用户修改数据时 显示的信息      */
@property (nonatomic, copy  ) NSString  *swpNetworkLogin;
/** 用户获取列表数据时 显示的信息  */
@property (nonatomic, copy  ) NSString  *swpNetworkGetDagaingTitle;
/** 用户刷新列表时 显示的信息      */
@property (nonatomic, copy  ) NSString  *swpNetworkRefreshDataTitle;
/** 用户刷新列表时 显示的信息      */
@property (nonatomic, copy  ) NSString  *swpNetworkToLoadDataTitle;
/** 获取接口数据时 没有数据显示信息 */
@property (nonatomic, copy  ) NSString  *swpNetworkNotData;
/** 获取接口数据时 返回数据为nil   */
@property (nonatomic, copy  ) NSString  *swpNetworkDataNULL;
/** 获取接口数据时, 用户登录状态   */
@property (nonatomic, assign, getter = isSwpNetworkUserLonginState) BOOL swpNetworkUserLonginState;
/** 网络是否存在   */
@property (nonatomic, assign, getter = isSwpNetworkExists) BOOL swpNetworkExists;

/**
 *  @author swp_song
 *
 *  @brief  shareInstance   ( 单利 )
 *
 *  @return SwpNetworkModel
 */
+ (instancetype)shareInstance;

/**
 *  @author swp_song
 *
 *  @brief  swpChekNetworkError:    ( 检查是否是否是返回网络异常的提示信息 )
 *
 *  @param  errorMessage    错误信息
 *
 *  @return NSString
 */
+ (nullable NSString *)swpChekNetworkError:(NSString * _Nullable)errorMessage;

/**
 *  @author swp_song
 *
 *  @brief  swpNetworkSetNetworkDomainName:setMainInterface:    ( 设置接口域名和主接口地址 )
 *
 *  @param  domainName      域名
 *
 *  @param  mainInterface   主接口地址
 */
+ (void)swpNetworkSetNetworkDomainName:(NSString *)domainName setMainInterface:(NSString *)mainInterface;


/**
 *  @author swp_song
 *
 *  @brief  swpNetworkSetNetworkGetMainInterfaceDomainName  ( 取出主接口地址 )
 *
 *  @return NSString
 */
+ (NSString *)swpNetworkSetNetworkGetMainInterfaceDomainName;


@end

NS_ASSUME_NONNULL_END
