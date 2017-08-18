//
//  SwpDownload.h
//  SwpRequestDemo
//
//  Created by swp_song on 2017/6/24.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpBaseRequest.h"

NS_ASSUME_NONNULL_BEGIN
@interface SwpDownload : SwpBaseRequest

/**
 *  @author swp_song
 *
 *  @brief  swpDownloadFile:swpDownloadProgress:swpCompletionHandler:   ( 请求网络 < 下载文件方法 > )
 *
 *  @param  URLString                       请求的 url
 *
 *  @param  swpDownloadProgress             下载进度
 *
 *  @param  swpCompletionHandler            下载回调    ( 成功 | 失败 回调, 成功 Error 为 nil )
 */
+ (void)swpDownloadFile:(NSString *)URLString swpDownloadProgress:(void(^ _Nullable)(SwpDownloadProgress swpDownloadProgress))swpDownloadProgress swpCompletionHandler:(void(^ _Nullable)(NSString *filePath, NSString *fileName, NSString *error))swpCompletionHandler;

@end
NS_ASSUME_NONNULL_END
