//
//  SwpRequestTools.h
//  swp_song
//
//  Created by swp_song on 16/5/17.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface SwpRequestTools : NSObject

/**
 *  @author swp_song
 *
 *  @brief  swpRequestToolsSetNetworkActivityIndicatorVisible:  ( 显示或隐藏，网络获取数据时 UINavigationBar 上的图标 < 转圈的菊花 > )
 *
 *  @param  networkActivityIndicatorVisible YES > 显示，NO > 隐藏
 */
+ (void)swpRequestToolsSetNetworkActivityIndicatorVisible:(BOOL)networkActivityIndicatorVisible;

/**
 *  @author swp_song
 *
 *  @brief  swpRequestToolsGetErrorMessage: ( 获取错误信息 )
 *
 *  @param  error   error
 *
 *  @return NSString
 */
+ (NSString *)swpRequestToolsGetErrorMessage:(NSError * _Nullable)error;


/**
 *  @author swp_song
 *
 *  @brief  swpRequestToolsGetDownloadFilePath: ( 获取文件下载路径 )
 *
 *  @param  filePath    文件存放 URL
 *
 *  @return NSString
 */
+ (NSString *)swpRequestToolsGetDownloadFilePath:(NSURL *)filePath;

/**
 *  @author swp_song
 *
 *  @brief  swpRequestToolsGetDownloadFileName:  ( 获取下载文件名称 )
 *
 *  @param  filePath    文件存放 URL
 *
 *  @return NSString
 */
+ (NSString *)swpRequestToolsGetDownloadFileName:(NSURL *)filePath;


/**
 *  @author swp_song
 *
 *  @brief  swpRequestToolsMasterInterfaceParametersHandling:setAppKey:setAppKeyValue: ( 设置主接口提交数据 App_key 的 Key 和 Value )
 *
 *  @param  parameters      提交数据参数
 *
 *  @param  appKey          Key
 *
 *  @param  appKeyValue     value
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)swpRequestToolsMasterInterfaceParametersHandling:(NSDictionary *)parameters setAppKey:(NSString *)appKey setAppKeyValue:(NSString *)appKeyValue;

/**
 *  @author swp_song
 *
 *  @brief  swpRequestToolsUserDefaultSetObject:forKey: ( 存储 UserDefault )
 *
 *  @param  value   value
 *
 *  @param  key     key
 *
 *  @return BOOL
 */
+ (BOOL)swpRequestToolsUserDefaultSetObject:(id)value forKey:(NSString *)key;

/**
 *  @author swp_song
 *
 *  @brief  swpRequestToolsUserDefaultGetObject:    ( 获取 NSUserDefaults 存储的数据 )
 *
 *  @param  key key
 *
 *  @return id
 */
+ (id)swpRequestToolsUserDefaultGetObject:(NSString *)key;

/**
 *  @author swp_song
 *
 *  @brief  swpRequestToolsGetAppVersion   ( 获取系统版本号，默认判断开发模式，生产模式 )
 *
 *  @return NSString
 */
+ (NSString *)swpRequestToolsGetAppVersion;

/**
 *  @author swp_song
 *
 *  @brief  swpRequestToolsGetProductionVersion ( 获取系统版生产模式的本号 )
 *
 *  @return NSString
 */
+ (NSString *)swpRequestToolsGetProductionVersion;

/**
 *  @author swp_song
 *
 *  @brief  swpRequestToolsDevelopmentVersion   ( 获取系统版开发模式的本号 )
 *
 *  @return NSString
 */
+ (NSString *)swpRequestToolsDevelopmentVersion;

/**
 *  @author swp_song
 *
 *  @brief  swpRequestToolsGetSwpRequestInfo    ( 获取 SwpRequest 相关信息 )
 *
 *  @return NSString
 */
+ (NSDictionary<NSString *, NSString *> *)swpRequestToolsGetSwpRequestInfo;

/**
 *  @author swp_song
 *
 *  @brief  swpRequestToolsGetSwpRequestVersion ( 获取 SwpRequest 的版本号 )
 *
 *  @return NSString
 */
+ (NSString *)swpRequestToolsGetSwpRequestVersion;


/**
 *  @author swp_song
 *
 *  @brief  swpRequestToolsCheckStringMessage   ( 验证字符串，为 null 返回 "" )
 *
 *  @param  string  string
 *
 *  @return NSString
 */
+ (NSString *)swpRequestToolsCheckStringMessage:(NSString *)string;

/**
 *  @author swp_song
 *
 *  @brief  swpRequestToolsGetDeviceIpAddress   ( 获取当前设备的 Ip 地址 )
 *
 *  @return NSString
 */
+ (NSString *)swpRequestToolsGetDeviceIpAddress;

/**
 *  @author swp_song
 *
 *  @brief  swpRequestToolsDeviceType   ( 获取设备型号 )
 *
 *  @return NSString
 */
+ (NSString *)swpRequestToolsDeviceType;


/**
 *  @author swp_song
 *
 *  @brief  swpRequestToolsGetSystemMessage ( 获取系统信息 )
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)swpRequestToolsGetSystemMessage;

/**
 *  @author swp_song
 *
 *  @brief  swpRequestToolsResultDataAnalysis:isLog:    ( 返回数据解析 )
 *
 *  @param  responseObject  解析数据源
 *
 *  @param  isLog           是否打印
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)swpRequestToolsResultDataAnalysis:(id)responseObject isLog:(BOOL)isLog;


@end
NS_ASSUME_NONNULL_END
