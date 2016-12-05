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

@end
NS_ASSUME_NONNULL_END
