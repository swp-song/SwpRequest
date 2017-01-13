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

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestToolsSetNetworkActivityIndicatorVisible:  ( 显示 或 隐藏 网络获取数据时 UINavigationBar 上的图标 <转圈的菊花 > )
 *
 *  @ param  networkActivityIndicatorVisible
 */
+ (void)swpRequestToolsSetNetworkActivityIndicatorVisible:(BOOL)networkActivityIndicatorVisible;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestToolsGetErrorMessage: ( 获取 错误信息 )
 *
 *  @ param  error
 *
 *  @ return NSString
 */
+ (NSString *)swpRequestToolsGetErrorMessage:(nullable NSError *)error;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestToolsGetDownloadFileName:  ( 取出 下载 文件名称 )
 *
 *  @ param  filePath
 *
 *  @ return NSString
 */
+ (NSString *)swpRequestToolsGetDownloadFileName:(NSURL *)filePath;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestToolsDownloadFilePathDispose:  ( 下载 文件 路径处理 )
 *
 *  @ param  filePath
 *
 *  @ return NSString
 */
+ (NSString *)swpRequestToolsDownloadFilePathDispose:(NSURL *)filePath;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestToolsMasterInterfaceParametersHandling:setAppKey:setAppKeyValue: ( 设置 主接口 提交数据 app_key )
 *
 *  @ param  parameters
 *
 *  @ param  appKey
 *
 *  @ param  appKeyValue
 *
 *  @ return NSDictionary
 */
+ (NSDictionary *)swpRequestToolsMasterInterfaceParametersHandling:(NSDictionary *)parameters setAppKey:(NSString *)appKey setAppKeyValue:(NSString *)appKeyValue;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestToolsUserDefaultSetObject:forKey: ( 存储 UserDefault )
 *
 *  @ param  object
 *
 *  @ param  key
 *
 *  @ return BOOL
 */
+ (BOOL)swpRequestToolsUserDefaultSetObject:(id)object forKey:(NSString *)key;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestToolsUserDefaultGetObject:    ( 取出 NSUserDefaults 存储的数据 )
 *
 *  @ param  key
 *
 *  @ return id
 */
+ (id)swpRequestToolsUserDefaultGetObject:(NSString *)key;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestToolsGetAppVersion   ( 获取 系统 版本号 < 无需自己判断 > )
 *
 *  @ return NSString
 */
+ (NSString *)swpRequestToolsGetAppVersion;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestToolsBundleVersion   ( 获取 系统 版本号 Production )
 *
 *  @ return NSString
 */
+ (NSString *)swpRequestToolsBundleVersion;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestToolsBundleVersion   ( 获取 系统 版本号 Development )
 *
 *  @ return NSString
 */
+ (NSString *)swpRequestToolsBundleShortVersionString;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestToolsBundleVersion   ( 获取 系统 版本号 Development )
 *
 *  @ param  string
 *
 *  @ return
 */
+ (NSString *)swpRequestToolsCheckStringMessage:(NSString *)string;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestToolsGetIphoneIpAddress ( 获取 当前 设备的 Ip 地址 )
 *
 *  @ return NSString Ip
 */
+ (NSString *)swpRequestToolsGetIphoneIpAddress;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestToolsDeviceDeviceType: ( 获取 设备 类型 )
 *
 *  @ return NSString
 */
+ (NSString *)swpRequestToolsDeviceDeviceType;


@end
NS_ASSUME_NONNULL_END
