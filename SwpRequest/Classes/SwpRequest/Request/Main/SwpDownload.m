//
//  SwpDownload.m
//  SwpRequestDemo
//
//  Created by swp_song on 2017/6/24.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpDownload.h"

/*! ---------------------- Tool       ---------------------- !*/
#import "AFNetworking.h"            //  AFNetworking
#import "SwpRequestTools.h"         //  SwpRequestTools.h
/*! ---------------------- Tool       ---------------------- !*/

@implementation SwpDownload

/**!
 *  @author swp_song
 *
 *  @brief  swpDownloadFile:swpDownloadProgress:swpCompletionHandler:   ( 请求网络 < 下载文件方法 > )
 *
 *  @param  URLString               请求的 url
 *
 *  @param  swpDownloadProgress     下载进度
 *
 *  @param  swpCompletionHandler    下载回调    ( 成功 | 失败 回调, 成功 Error 为 nil )
 */
+ (void)swpDownloadFile:(NSString *)URLString swpDownloadProgress:(void(^)(SwpDownloadProgress swpDownloadProgress))swpDownloadProgress swpCompletionHandler:(void(^)(NSString *filePath, NSString *fileName, NSString *error))swpCompletionHandler {
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSMutableURLRequest       *request       = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URLString]];
    AFHTTPSessionManager      *manager       = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    
    //  发起下载请求
    [SwpRequestTools swpRequestToolsSetNetworkActivityIndicatorVisible:YES];
    NSURLSessionDownloadTask *downloadTask   = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
        if (swpDownloadProgress) swpDownloadProgress(SwpDownloadProgressMake(downloadProgress.fractionCompleted, downloadProgress.totalUnitCount, downloadProgress.completedUnitCount));
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        //  返回文件路径
        NSURL *pathURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
        
        return [pathURL URLByAppendingPathComponent:[response suggestedFilename]];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        NSString *downloadFilePath = [SwpRequestTools swpRequestToolsDownloadFilePathDispose:filePath];
        if (error) [[NSFileManager defaultManager] removeItemAtPath:downloadFilePath error:nil];
        
        if (swpCompletionHandler) swpCompletionHandler(downloadFilePath, [SwpRequestTools swpRequestToolsGetDownloadFileName:filePath], [SwpRequestTools swpRequestToolsGetErrorMessage:error]);
        [SwpRequestTools swpRequestToolsSetNetworkActivityIndicatorVisible:NO];
    }];
    // 开始 请求
    [downloadTask resume];
}

@end
