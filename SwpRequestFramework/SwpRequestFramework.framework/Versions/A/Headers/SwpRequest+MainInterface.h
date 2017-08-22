//
//  SwpRequest+MainInterface.h
//  swp_song
//
//  Created by swp_song on 2017/1/10.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpRequest.h"

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString * const kSwpRequestCachedDataKey;

@interface SwpRequest (MainInterface)


/**
 *  @author swp_song
 *
 *  @brief  swpRequestGetSystemMessage  ( 获取系统信息 )
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)swpRequestGetSystemMessage;

/**
 *  @author swp_song
 *
 *  @brief  swpRequestSetNetworkEnvironment:setMainInterface:   ( 设置网络环境 )
 *
 *  @param  domainName      域名
 *
 *  @param  mainInterface   主接口
 */
+ (void)swpRequestSetNetworkEnvironment:(NSString *)domainName setMainInterface:(NSString *)mainInterface;

/**
 *  @author swp_song
 *
 *  @brief  swpRequestGetMasterInterfaceData:resultSuccess:resultError: ( 发起请求，获接主接口数据 )
 *
 *  @param  parameters      请求传递的参数
 *
 *  @param  resultSuccess   请求成功的回调
 *
 *  @param  resultError     请求失败的回调
 */
+ (void)swpRequestGetMasterInterfaceData:(NSDictionary * _Nullable)parameters resultSuccess:(void(^ _Nullable)(NSDictionary *resultObject))resultSuccess resultError:(void(^ _Nullable)(NSInteger error, NSString *errorMessage))resultError;

#pragma mark - MainInterface Get Data 

/**
 *  @author swp_song
 *
 *  @brief  swpRequestGetMasterInterfaceCachedEntireData    ( 取出缓存全部数据 )
 *
 *  @return id
 */
+ (id)swpRequestGetMasterInterfaceCachedEntireData;

/**
 *  @author swp_song
 *
 *  @brief  swpRequestGetMasterInterfaceCachedData: ( 取出根据 Key 取出缓存中的数据 )
 *
 *  @param  key key
 *
 *  @return id
 */
+ (id)swpRequestGetMasterInterfaceCachedData:(NSString *)key;


/**
 *  @author swp_song
 *
 *  @brief  swpRequestGetMasterInterfaceApi ( 取出主接 Api 中缓存数据 )
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)swpRequestGetMasterInterfaceApi;

/**
 *  @author swp_song
 *
 *  @brief  swpRequestGetInterface  ( 根据 Key 取出接口数据 )
 *
 *  @param  key key
 *
 *  @return NSString
 */
+ (NSString *)swpRequestGetInterface:(NSString *)key;

/**
 *  @author swp_song
 *
 *  @brief  swpRequestGetMasterInterfaceToken   ( 取出 Token )
 *
 *  @return NSString
 */
+ (NSString *)swpRequestGetMasterInterfaceToken;

/**
 *  @author swp_song
 *
 *  @brief  swpRequestGetMasterInterfaceTokenTimeStamp  ( 取出 TimeStamp )
 *
 *  @return NSString
 */
+ (NSString *)swpRequestGetMasterInterfaceTokenTimeStamp;

@end

NS_ASSUME_NONNULL_END
