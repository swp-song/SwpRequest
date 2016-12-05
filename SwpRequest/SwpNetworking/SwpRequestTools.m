//
//  SwpRequestTools.m
//  swp_song
//
//  Created by swp_song on 16/5/17.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "SwpRequestTools.h"

#import <UIKit/UIKit.h>

@implementation SwpRequestTools

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestToolsSetNetworkActivityIndicatorVisible:  ( 显示 或 隐藏 网络获取数据时 UINavigationBar 上的图标 <转圈的菊花 > )
 *
 *  @ param  networkActivityIndicatorVisible
 */
+ (void)swpRequestToolsSetNetworkActivityIndicatorVisible:(BOOL)networkActivityIndicatorVisible {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = networkActivityIndicatorVisible;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestToolsGetErrorMessage: ( 获取 错误信息 )
 *
 *  @ param  error
 *
 *  @ return NSString
 */
+ (NSString *)swpRequestToolsGetErrorMessage:(NSError *)error {
    return error == nil ? nil : [NSString stringWithFormat:@"错误代码%ld \n 错误信息%@", (long)error.code, error.localizedDescription];
}



/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestToolsDownloadFilePathDispose:  ( 下载 文件 路径处理 )
 *
 *  @ param  filePath
 *
 *  @ return NSString
 */
+ (NSString *)swpRequestToolsDownloadFilePathDispose:(NSURL *)filePath {
    return [NSString stringWithFormat:@"%@/%@", [self swpRequestToolsGetDocumentsPath], [self swpRequestToolsGetDownloadFileName:filePath]];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestToolsGetDownloadFileName:  ( 取出 下载 文件名称 )
 *
 *  @ param  filePath
 *
 *  @ return NSString
 */
+ (NSString *)swpRequestToolsGetDownloadFileName:(NSURL *)filePath {
    NSString *filePathString = [NSString stringWithFormat:@"%@", filePath];
    return [filePathString componentsSeparatedByString:@"/"].lastObject;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestToolsGetDocumentsPath  ( 取出 documents 文件路径 )
 *
 *  @ return NSString
 */
+ (NSString *)swpRequestToolsGetDocumentsPath {
    NSArray  *paths          = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPaths = [paths objectAtIndex:0];
    return documentsPaths;
}

@end
