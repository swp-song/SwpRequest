//
//  SwpBaseRequest.h
//  swp_song
//
//  Created by swp_song on 2017/6/24.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

/*! ---------------------- Tool       ---------------------- !*/
#import "SwpRequestDataType.h"          // Data Type
/*! ---------------------- Tool       ---------------------- !*/

NS_ASSUME_NONNULL_BEGIN


@interface SwpBaseRequest : NSObject <NSCopying, NSMutableCopying>

/** SwpRequest 版本号  */
@property (nonatomic, copy, readonly) NSString *swpRequestVersion;

/** SwpRequest 信息   */
@property (nonatomic, copy, readonly) NSDictionary *swpRequestInformation;

/** 是否开启 Debug 模式 */
@property (nonatomic, assign, readonly, getter = isSwpRequestDebugEnabled) BOOL swpRequestDebugEnabled;

/**
 *  @author swp_song
 *
 *  @brief  shareInstance   ( 单利 )
 *
 *  @return id
 */
+ (instancetype)shareInstance;

/**
 *  @author swp_song
 *
 *  @brief  swpRequestLogInformation    ( 打印 SwpRequest 详细信息 )
 *
 *  @return id
 */
- (instancetype)swpRequestLogInformation;

/**
 *  @author swp_song
 *
 *  @brief  swpRequestSetDebugEnabled   ( 是否开启 Debug 模式，默认开启 )
 *
 *  @param  debugEnabled  YES > 开启，NO > 关闭 Debug 模式
 *
 *  @return id
 */
- (instancetype)swpRequestSetDebugEnabled:(BOOL)debugEnabled;

/**
 *  @author swp_song
 *
 *  @brief  swpRequestInformation   ( 获取 SwpRequest 详细信息 )
 *
 *  @return NSDictionary
 */
- (NSDictionary *)swpRequestInformation;

/**
 *  @author swp_song
 *
 *  @brief  swpRequestVersion   ( 获取 SwpRequest 版本号 )
 *
 *  @return NSString
 */
- (NSString *)swpRequestVersion;


@end
NS_ASSUME_NONNULL_END
