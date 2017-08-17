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


/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestGetSystemMessageDictionary:  ( 获取 系统 信息 )
 *
 *  @ return NSDictionary
 */
+ (NSDictionary *)swpRequestGetSystemMessageDictionary;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestSetNetworkEnvironment:setMainInterface: ( 设置 网络环境 )
 *
 *  @ param  domainName
 *
 *  @ param  mainInterfaceURL
 */
+ (void)swpRequestSetNetworkEnvironment:(NSString *)domainName setMainInterface:(NSString *)mainInterfaceURL;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestGetMasterInterfaceData:resultSuccess:resultError: ( 获取出接口数据 )
 *
 *  @ param  parameters
 *
 *  @ param  resultSuccess
 *
 *  @ param  resultError
 */
+ (void)swpRequestGetMasterInterfaceData:(nullable NSDictionary *)parameters resultSuccess:(nullable void(^)(NSDictionary *resultObject))resultSuccess resultError:(nullable void(^)(NSInteger error, NSString *errorMessage))resultError;

#pragma mark - MainInterface Get Data 

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestGetMasterInterfaceCachedData    ( 取出 缓存 数据 )
 *
 *  @ return id
 */
+ (id)swpRequestGetMasterInterfaceCachedData;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestGetMasterInterfaceCachedDataWith:    ( 取出 根据 key 取出缓存中的数据  )
 *
 *  @ param  key
 *
 *  @ return id
 */
+ (id)swpRequestGetMasterInterfaceCachedDataWith:(NSString *)key;


/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestGetMasterInterfaceCachedDataWith:    ( 取出 根据 key 取出缓存中的数据  )
 *
 *  @ return NSDictionary
 */
+ (NSDictionary *)swpRequestGetMasterInterfaceUrls;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestGetMasterInterfaceUrl:   ( 取出 根据 key 取出缓存中的数据  )
 *
 *  @ param  key
 *
 *  @ return NSString
 */
+ (NSString *)swpRequestGetMasterInterfaceUrl:(NSString *)key;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestGetMasterInterfaceToken  ( 取出 token )
 *
 *  @ return NSString
 */
+ (NSString *)swpRequestGetMasterInterfaceToken;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestGetMasterInterfaceToken  ( 取出 TokenTimeStamp )
 *
 *  @ return NSString
 */
+ (NSString *)swpRequestGetMasterInterfaceTokenTimeStamp;

@end

NS_ASSUME_NONNULL_END
