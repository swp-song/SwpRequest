//
//  SwpRequest.h
//  swp_song
//
//  Created by swp_song on 15/12/11.
//  Copyright © 2015年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

/*! ---------------------- Tool       ---------------------- !*/
#import "SwpRequestVariableType.h"        // type
/*! ---------------------- Tool       ---------------------- !*/

NS_ASSUME_NONNULL_BEGIN

@interface SwpRequest : NSObject

#pragma mark - SwpRequest Tool Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  swpPOST:parameters:isEncrypt:swpResultSuccess:swpResultError:   ( 请求网络获取数据 <POST> )
 *
 *  @ param  URLString                       请求的 url
 *
 *  @ param   parameters                      请求 需要传递的参数
 *
 *  @ param  encrypt                         请求 是否 对参数加密 (YES 加密 / NO 不加密)
 *
 *  @ param  swpResultSuccess                请求服务器成功
 *
 *  @ param  swpResultError                  请求服务器失败
 *
 *  @ return SwpRequest
 */
+ (instancetype)swpPOST:(NSString *)URLString  parameters:(nullable NSDictionary *) parameters isEncrypt:(BOOL)encrypt swpResultSuccess:(SwpResultSuccessHandle)swpResultSuccess swpResultError:(SwpResultErrorHandle)swpResultError;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpPOSTAddFile:parameters:isEncrypt:fileName:fileData:swpResultSuccess:swpResultError:   ( 请求网络获上传文件 单文件上传 <POST> )
 *
 *  @ param  URLString                       请求的 url
 *
 *  @ param  parameters                      请求 需要传递的参数
 *
 *  @ param  encrypt                         请求 是否 对参数加密 (YES 加密 / NO 不加密)
 *
 *  @ param  fileName                        请求 上传文件的名称 (和后台一致)
 *
 *  @ param  fileData                        请求 上传文件的数据流
 *
 *  @ param  swpResultSuccess                请求服务器成功
 *
 *  @ param  swpResultError                  请求服务器失败
 *
 *  @ return SwpRequest
 */
+ (instancetype)swpPOSTAddFile:(NSString *)URLString  parameters:(nullable NSDictionary *) parameters isEncrypt:(BOOL)encrypt fileName:(NSString *)fileName fileData:(NSData *)fileData swpResultSuccess:(SwpResultSuccessHandle)swpResultSuccess swpResultError:(SwpResultErrorHandle)swpResultError;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpPOSTAddFiles:parameters:isEncrypt:fileName:fileDatas:swpResultSuccess:swpResultError:    ( 请求网络获上传文件 多文件上传, 文件名称相同使用该方法 <POST> )
 *
 *  @ param  URLString                       请求的 url
 *
 *  @ param  parameters                      请求 需要传递的参数
 *
 *  @ param  encrypt                         请求 是否 对参数加密 (YES 加密 / NO 不加密)
 *
 *  @ param  fileName                        请求 上传文件的名称 (和后台一致)
 *
 *  @ param  fileDatas                       请求 上传文件的流数组
 *
 *  @ param  swpResultSuccess                请求服务器成功
 *
 *  @ param  swpResultError                  请求服务器失败
 *
 *  @ return SwpRequest
 */
+ (instancetype)swpPOSTAddFiles:(NSString *)URLString  parameters:(nullable NSDictionary *) parameters isEncrypt:(BOOL)encrypt fileName:(NSString *)fileName fileDatas:(NSArray *)fileDatas swpResultSuccess:(SwpResultSuccessHandle)swpResultSuccess swpResultError:(SwpResultErrorHandle)swpResultError;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpPOSTAddWithFiles:parameters:isEncrypt:fileNames:fileDatas:swpResultSuccess:swpResultError:   ( 请求网络获上传文件 多文件上传, 文件名称不相同相同使用该方法  <POST> )
 *
 *  @ param  URLString                       请求的 url
 *
 *  @ param  parameters                      请求 需要传递的参数
 *
 *  @ param  encrypt                         请求 是否 对参数加密 (YES 加密 / NO 不加密)
 *
 *  @ param  fileNames                       请求 上传文件的名称数组 (和后台一致)
 *
 *  @ param  fileDatas                       请求 上传文件的流数组
 *
 *  @ param  swpResultSuccess                请求服务器成功
 *
 *  @ param  swpResultError                  请求服务器失败
 *
 *  @ return SwpRequest
 */
+ (instancetype)swpPOSTAddWithFiles:(NSString *)URLString  parameters:(nullable NSDictionary *) parameters isEncrypt:(BOOL)encrypt fileNames:(NSArray *)fileNames fileDatas:(NSArray *)fileDatas swpResultSuccess:(SwpResultSuccessHandle)swpResultSuccess swpResultError:(SwpResultErrorHandle)swpResultError;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestAFNetworkingTest: parametersisEncrypt:  ( AFNetworking 测试方法 )
 *
 *  @ param  URLString                   请求的 url
 *
 *  @ param  parameters                  请求 需要传递的参数
 *
 *  @ param  encrypt                     请求 是否 对参数加密 (YES 加密 / NO 不加密)
 *
 *  @ return SwpRequest
 */
+ (instancetype)swpRequestAFNetworkingTest:(NSString *)URLString  parameters:(nullable NSDictionary *) parameters isEncrypt:(BOOL)encrypt;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpDownloadFile:swpDownloadProgress:swpCompletionHandler:   ( 请求网络 < 下载图片方法 > )
 *
 *  @ param  URLString                       请求的 url
 *
 *  @ param  swpDownloadProgress             下载进度
 *
 *  @ param  swpCompletionHandler            下载回调    ( 成功 | 失败 回调, 成功 Error 为 nil )
 */
+ (void)swpDownloadFile:(NSString *)URLString swpDownloadProgress:(void(^)(SwpDownloadProgress swpDownloadProgress))swpDownloadProgress swpCompletionHandler:(void(^)(NSString *filePath, NSString *fileName,  NSString *error))swpCompletionHandler;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestReachabilityStatusChangeBlock:    ( 验证 网路 环境 )
 *
 *  @ param  swpResultStatus
 */
+ (void)swpRequestReachabilityStatusChangeBlock:(void(^)(SwpResultReachabilityStatus swpResultStatus))swpResultStatus;

#pragma makr - SwpRequest Public Tool Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  getSwpResultAppKeyEncryptedValue    ( 取出 加密 app_key Value )
 *
 *  @ return NSString
 */
+ (NSString *)swpResultGetAppKeyEncryptedValue;

/**!
 *  @ author swp_song
 *
 *  @ brief  setSwpRequestAppKey:    ( 设置 appKey, 加密 key )
 *
 *  @ param  swpRequestAppKey
 */
+ (void)swpRequestSetAppKey:(NSString *)swpRequestAppKey;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestEncryptedParams:  ( 参数加密 )
 *
 *  @ param  dictionary
 *
 *  @ return NSDictionary
 */
+ (NSDictionary *)swpRequestEncryptedParams:(NSDictionary *)dictionary;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestYouZhiPrintDataInformation: ( 打印 YouZhi 结果集, 该方法 是打印返回 结果集 )
 *
 *  @ param  dictionary
 */
+ (void)swpRequestYouZhiPrintDataInformation:(nullable NSDictionary *)dictionary;



@end
NS_ASSUME_NONNULL_END

