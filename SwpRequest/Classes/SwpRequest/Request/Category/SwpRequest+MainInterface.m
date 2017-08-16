//
//  SwpRequest+MainInterface.m
//  swp_song
//
//  Created by swp_song on 2017/1/10.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpRequest+MainInterface.h"

/*! ---------------------- Tool       ---------------------- !*/
#import <UIKit/UIKit.h>
#import "SwpNetworkModel.h"
#import "SwpRequestTools.h"
#import "SwpRequest+SwpEncryptRequest.h"
/*! ---------------------- Tool       ---------------------- !*/

/*! 缓存数据 key !*/
NSString * const kSwpRequestCachedDataKey = @"SwpRequest Main Interface Cache Data Key";

@implementation SwpRequest (MainInterface)

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestGetSystemMessageDictionary:  ( 获取 系统 信息 )
 *
 *  @ return NSDictionary
 */
+ (NSDictionary *)swpRequestGetSystemMessageDictionary {
    return [SwpRequestTools swpRequestToolsGetSystemMessageDictionary];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestSetNetworkEnvironment:setMainInterface: ( 设置 网络环境 )
 *
 *  @ param  domainName
 *
 *  @ param  mainInterfaceURL
 */
+ (void)swpRequestSetNetworkEnvironment:(NSString *)domainName setMainInterface:(NSString *)mainInterfaceURL {
    [SwpNetworkModel swpNetworkSetNetworkDomainName:domainName setMainInterface:mainInterfaceURL];
}

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
+ (void)swpRequestGetMasterInterfaceData:(NSDictionary *)parameters resultSuccess:(SwpRequestMasterInterfaceResultSuccess)resultSuccess resultError:(SwpRequestMasterInterfaceResultError)resultError {
    
    parameters = !parameters || !parameters.count ? [self.class swpRequestGetSystemMessageDictionary] : parameters;
    SwpNetworkModel *swpNetwork = [SwpNetworkModel shareInstance];
    NSString        *url        = [SwpNetworkModel swpNetworkSetNetworkGetMainInterfaceDomainName];
    NSDictionary    *dictionary = [SwpRequestTools swpRequestToolsMasterInterfaceParametersHandling:parameters setAppKey:[SwpRequest swpEncryptRequestGetAppKey] setAppKeyValue:url];

    [SwpRequest swpPOST:url encryptParameters:dictionary swpResultSuccess:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull resultObject) {
        
        if (swpNetwork.swpNetworkCodeSuccess == [resultObject[swpNetwork.swpNetworkCode] intValue]) {
            [self.class swpRequestCachedData:resultObject[swpNetwork.swpNetworkObject] cachedDataSuccess:resultSuccess cachedDataError:resultError];
        } else {
            if (resultError) resultError([resultObject[swpNetwork.swpNetworkCode] integerValue], resultObject[swpNetwork.swpNetworkMessage]);
        }

    } swpResultError:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error, NSString * _Nonnull errorMessage) {
        NSLog(@"error ==> %@, errorMessage ==> %@", error, errorMessage);
        if (resultError) resultError(error.code, [SwpNetworkModel swpChekNetworkError:errorMessage]);
    }];
    
}

#pragma mark - MainInterface Get Data
/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestGetMasterInterfaceCachedData    ( 取出 缓存 数据 )
 *
 *  @ return id
 */
+ (id)swpRequestGetMasterInterfaceCachedData {
    return [SwpRequestTools swpRequestToolsUserDefaultGetObject:kSwpRequestCachedDataKey];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestGetMasterInterfaceCachedDataWith:    ( 取出 根据 key 取出缓存中的数据  )
 *
 *  @ param  key
 *
 *  @ return id
 */
+ (id)swpRequestGetMasterInterfaceCachedDataWith:(NSString *)key {
    NSDictionary *dictionary = [[self class] swpRequestGetMasterInterfaceCachedData];
    return dictionary[key];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestGetMasterInterfaceCachedDataWith:    ( 取出 根据 key 取出缓存中的数据  )
 *
 *  @ return NSDictionary
 */
+ (NSDictionary *)swpRequestGetMasterInterfaceUrls {
    NSDictionary *dictionary = [[self class] swpRequestGetMasterInterfaceCachedDataWith:@"api"];
    return dictionary;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestGetMasterInterfaceUrl:   ( 取出 根据 key 取出缓存中的数据  )
 *
 *  @ param  key
 *
 *  @ return NSString
 */
+ (NSString *)swpRequestGetMasterInterfaceUrl:(NSString *)key {
    return [SwpRequestTools swpRequestToolsCheckStringMessage:[self.class swpRequestGetMasterInterfaceUrls][key]];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestGetMasterInterfaceToken  ( 取出 token )
 *
 *  @ return NSString
 */
+ (NSString *)swpRequestGetMasterInterfaceToken {
    return [SwpRequestTools swpRequestToolsCheckStringMessage:[self.class swpRequestGetMasterInterfaceCachedDataWith:@"token"]];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestGetMasterInterfaceToken  ( 取出 TokenTimeStamp )
 *
 *  @ return NSString
 */
+ (NSString *)swpRequestGetMasterInterfaceTokenTimeStamp {
    return [SwpRequestTools swpRequestToolsCheckStringMessage:[self.class swpRequestGetMasterInterfaceCachedDataWith:@"timestamp"]];
}


#pragma mark - Private -
/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestCachedData:cachedDataSuccess:cachedDataError:    ( 缓存数据 )
 *
 *  @ param  cachedData
 *
 *  @ param  cachedDataSuccess
 *
 *  @ param  cachedDataError
 */
+ (void)swpRequestCachedData:(NSDictionary *)cachedData cachedDataSuccess:(SwpRequestMasterInterfaceResultSuccess)cachedDataSuccess cachedDataError:(SwpRequestMasterInterfaceResultError)cachedDataError {
    
    if ([SwpRequestTools swpRequestToolsUserDefaultSetObject:cachedData forKey:kSwpRequestCachedDataKey]) {
        if (cachedDataSuccess) cachedDataSuccess(cachedData);
    } else {
        if (cachedDataError) cachedDataError(5000, @"缓存数据失败");
    }
}


@end

