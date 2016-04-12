//
//  SwpRequest.h
//  swp_song
//
//  Created by swp_song on 15/12/11.
//  Copyright © 2015年 swp_song. All rights reserved.
//
//  @author             --->    swp_song
//
//  @modification Time  --->    2016-04-12 10:28:24
//
//  @warning            --->    !!! < AFNetworking 二次封装 使用时 需要导入 AFNetworking 网路库  > !!!


#import <Foundation/Foundation.h>

/*! ---------------------- Tool       ---------------------- !*/
#import <AFNetworking/AFNetworking.h>     // AFNetworking 网络库
/*! ---------------------- Tool       ---------------------- !*/

NS_ASSUME_NONNULL_BEGIN

/*! 网络状态  !*/
typedef NS_ENUM(NSInteger, SwpResultReachabilityStatus) {
    SwpResultReachabilityStatusUnknown          = -1,   /*! 未知网络    !*/
    SwpResultReachabilityStatusNotReachable     = 0,    /*! 无网络      !*/
    SwpResultReachabilityStatusReachableViaWWAN = 1,    /*! WWAN        !*/
    SwpResultReachabilityStatusReachableViaWiFi = 2,    /*! WiFi        !*/
};

/*! SwpRequest 的请求成功 回调 Block !*/
typedef void(^SwpResultSuccessHandle)(NSURLSessionDataTask *task, id resultObject);
/*! SwpRequest 的请求失败 回调 Block !*/
typedef void(^SwpResultErrorHandle)(NSURLSessionDataTask *task, NSError *error, NSString *errorMessage);

@interface SwpRequest : NSObject

#pragma mark - SwpRequest Tool Methods
/*!
 *  @author swp_song
 *
 *  @brief  swpPOST:parameters:isEncrypt:swpResultSuccess:swpResultError:   ( 请求网络获取数据 <POST> )
 *
 *  @param  URLString                       请求的 url
 *
 *  @param  parameters                      请求 需要传递的参数
 *
 *  @param  encrypt                         请求 是否 对参数加密 (YES 加密 / NO 不加密)
 *
 *  @param  swpResultSuccess                请求服务器成功
 *
 *  @param  swpResultError                  请求服务器失败
 */
+ (void)swpPOST:(NSString *)URLString parameters:(nullable NSDictionary *)parameters isEncrypt:(BOOL)encrypt swpResultSuccess:(SwpResultSuccessHandle)swpResultSuccess swpResultError:(SwpResultErrorHandle)swpResultError;

/*!
 *  @author swp_song
 *
 *  @brief  swpPOSTAddFile:parameters:isEncrypt:fileName:fileData:swpResultSuccess:swpResultError:   ( 请求网络获上传文件 单文件上传 <POST> )
 *
 *  @param  URLString                       请求的 url
 *
 *  @param  parameters                      请求 需要传递的参数
 *
 *  @param  encrypt                         请求 是否 对参数加密 (YES 加密 / NO 不加密)
 *
 *  @param  fileName                        请求 上传文件的名称 (和后台一致)
 *
 *  @param  fileData                        请求 上传文件的数据流
 *
 *  @param  swpResultSuccess                请求服务器成功
 *
 *  @param  swpResultError                  请求服务器失败
 */
+ (void)swpPOSTAddFile:(NSString *)URLString parameters:(nullable NSDictionary *)parameters isEncrypt:(BOOL)encrypt fileName:(NSString *)fileName fileData:(NSData *)fileData swpResultSuccess:(SwpResultSuccessHandle)swpResultSuccess swpResultError:(SwpResultErrorHandle)swpResultError;

/*!
 *  @author swp_song
 *
 *  @brief  swpPOSTAddFiles:parameters:isEncrypt:fileName:fileDatas:swpResultSuccess:swpResultError:    ( 请求网络获上传文件 多文件上传, 文件名称相同使用该方法 <POST> )
 *
 *  @param  URLString                       请求的 url
 *
 *  @param  parameters                      请求 需要传递的参数
 *
 *  @param  encrypt                         请求 是否 对参数加密 (YES 加密 / NO 不加密)
 *
 *  @param  fileName                        请求 上传文件的名称 (和后台一致)
 *
 *  @param  fileDatas                       请求 上传文件的流数组
 *
 *  @param  swpResultSuccess                请求服务器成功
 *
 *  @param  swpResultError                  请求服务器失败
 */
+ (void)swpPOSTAddFiles:(NSString *)URLString parameters:(nullable NSDictionary *)parameters isEncrypt:(BOOL)encrypt fileName:(NSString *)fileName fileDatas:(NSArray *)fileDatas swpResultSuccess:(SwpResultSuccessHandle)swpResultSuccess swpResultError:(SwpResultErrorHandle)swpResultError;

/*!
 *  @author swp_song
 *
 *  @brief  swpPOSTAddWithFiles:parameters:isEncrypt:fileNames:fileDatas:swpResultSuccess:swpResultError:   ( 请求网络获上传文件 多文件上传, 文件名称不相同相同使用该方法  <POST> )
 *
 *  @param  URLString                       请求的 url
 *
 *  @param  parameters                      请求 需要传递的参数
 *
 *  @param  encrypt                         请求 是否 对参数加密 (YES 加密 / NO 不加密)
 *
 *  @param  fileNames                       请求 上传文件的名称数组 (和后台一致)
 *
 *  @param  fileDatas                       请求 上传文件的流数组
 *
 *  @param  swpResultSuccess                请求服务器成功
 *
 *  @param  swpResultError                  请求服务器失败
 */
+ (void)swpPOSTAddWithFiles:(NSString *)URLString parameters:(nullable NSDictionary *)parameters isEncrypt:(BOOL)encrypt fileNames:(NSArray *)fileNames fileDatas:(NSArray *)fileDatas swpResultSuccess:(SwpResultSuccessHandle)swpResultSuccess swpResultError:(SwpResultErrorHandle)swpResultError;

/*!
 *  @author swp_song
 *
 *  @brief  swpRequestAFNetworkingTest:parametersisEncrypt:  ( AFNetworking 测试方法 )
 *
 *  @param  URLString                   请求的 url
 *
 *  @param  parameters                  请求 需要传递的参数
 *
 *  @param  encrypt                     请求 是否 对参数加密 (YES 加密 / NO 不加密)
 */
+ (void)swpRequestAFNetworkingTest:(NSString *)URLString parameters:(nullable NSDictionary *)parameters isEncrypt:(BOOL)encrypt;

/*!
 *  @author swp_song
 *
 *  @brief  swpRequestReachabilityStatusChangeBlock:    ( 验证 网路 环境 )
 *
 *  @param  swpResultStatus
 */
+ (void)swpRequestReachabilityStatusChangeBlock:(void(^)(SwpResultReachabilityStatus swpResultStatus))swpResultStatus;

#pragma makr - SwpRequest Public Tool Methods
/*!
 *  @author swp_song
 *
 *  @brief  getSwpResultAppKeyEncryptedValue    ( 取出 加密 app_key Value )
 *
 *  @return NSString
 */
+ (NSString *)swpResultGetAppKeyEncryptedValue;

/*!
 *  @author swp_song
 *
 *  @brief  setSwpRequestAppKey:    ( 设置 appKey, 加密 key )
 *
 *  @param  swpRequestAppKey
 */
+ (void)swpRequestSetAppKey:(NSString *)swpRequestAppKey;

/*!
 *  @author swp_song
 *
 *  @brief  swpRequestEncryptedParams:  ( 参数加密 )
 *
 *  @param  dictionary
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)swpRequestEncryptedParams:(NSDictionary *)dictionary;

/*!
 *  @author swp_song
 *
 *  @brief  swpRequestYouZhiPrintDataInformation: ( 打印 YouZhi 结果集, 该方法 是打印返回 结果集 )
 *
 *  @param  dictionary
 */
+ (void)swpRequestYouZhiPrintDataInformation:(nullable NSDictionary *)dictionary;



@end
NS_ASSUME_NONNULL_END

