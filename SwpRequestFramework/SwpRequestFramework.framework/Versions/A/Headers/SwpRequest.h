//
//  SwpRequest.h
//  swp_song
//
//  Created by swp_song on 2017/6/24.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpBaseRequest.h"

NS_ASSUME_NONNULL_BEGIN
@interface SwpRequest : SwpBaseRequest

/**
 *  @author swp_song
 *
 *  @brief  swpRequestInit  ( 单利 )
 */
+ (__kindof SwpRequest * _Nonnull (^)())swpRequestInit;

/**
 *  @author swp_song
 *
 *  @brief  swpRequestLogInformationChain   ( 打印 SwpRequest 详细信息 )
 */
- (__kindof SwpRequest * _Nonnull (^)())swpRequestLogInformationChain;

/**
 *  @author swp_song
 *
 *  @brief  swpRequestSetDebugEnabled   ( 是否开启 Debug 模式，默认开启 )
 */
- (__kindof SwpRequest * _Nonnull (^)(BOOL))swpRequestSetDebugEnabledChain;

/**
 *  @author swp_song
 *
 *  @brief  swpPOST:parameters:uploadFileStatus:fileNames:fileDatas:swpResultSuccess:swpResultError:    ( 发起网络请求，核心方法 )
 *
 *  @param  URLString           请求 URL
 *
 *  @param  parameters          请求传递的参数
 *
 *  @param  uploadFileStatus    请求上传文件类型
 *
 *  @param  fileNames           请求上传文件名称
 *
 *  @param  fileDatas           请求上传文件数据流
 *
 *  @param  swpResultSuccess    请求成功的回调
 *
 *  @param  swpResultError      请求失败的回调
 *
 *  @return SwpRequest
 */
+ (instancetype)swpPOST:(NSString *)URLString parameters:(NSDictionary * _Nullable)parameters uploadFileStatus:(SwpResultUploadFileStatus)uploadFileStatus fileNames:(id _Nullable)fileNames fileDatas:(id _Nullable)fileDatas swpResultSuccess:(SwpResultSuccessHandle _Nullable)swpResultSuccess swpResultError:(SwpResultErrorHandle _Nullable)swpResultError;

/**
 *  @author swp_song
 *
 *  @brief  swpPOST:parameters:swpResultSuccess:swpResultError: ( 发起网络请求，获取数据 )
 *
 *  @param  URLString           请求 URL
 *
 *  @param  parameters          请求传递的参数
 *
 *  @param  swpResultSuccess    请求成功的回调
 *
 *  @param  swpResultError      请求失败的回调
 *
 *  @return SwpRequest
 */
+ (instancetype)swpPOST:(NSString *)URLString parameters:(NSDictionary * _Nullable)parameters swpResultSuccess:(SwpResultSuccessHandle _Nullable)swpResultSuccess swpResultError:(SwpResultErrorHandle _Nullable)swpResultError;

/**
 *  @author swp_song
 *
 *  @brief  swpPOSTUploadFile:parameters:fileName:fileData:swpResultSuccess:swpResultError: ( 发起网络请求，单文件上传 )
 *
 *  @param  URLString           请求 URL
 *
 *  @param  parameters          请求传递的参数
 *
 *  @param  fileName            请求上传文件名称
 *
 *  @param  fileData            请求上传文件数据流
 *
 *  @param  swpResultSuccess    请求成功的回调
 *
 *  @param  swpResultError      请求失败的回调
 *
 *  @return SwpRequest
 */
+ (instancetype)swpPOSTUploadFile:(NSString *)URLString parameters:(NSDictionary * _Nullable)parameters fileName:(NSString *)fileName fileData:(NSData *)fileData swpResultSuccess:(SwpResultSuccessHandle _Nullable)swpResultSuccess swpResultError:(SwpResultErrorHandle _Nullable)swpResultError;


/**
 *  @author swp_song
 *
 *  @brief  swpPOSTUploadFiles:parameters:fileName:fileDatas:swpResultSuccess:swpResultError:   ( 发起网络请求，多文件上传, 文件名称相同使用该方法 )
 *
 *  @param  URLString           请求 URL
 *
 *  @param  parameters          请求传递的参数
 *
 *  @param  fileName            请求上传文件名称
 *
 *  @param  fileDatas           请求上传一组文件数据流
 *
 *  @param  swpResultSuccess    请求成功的回调
 *
 *  @param  swpResultError      请求失败的回调
 *
 *  @return SwpRequest
 */
+ (instancetype)swpPOSTUploadFiles:(NSString *)URLString parameters:(NSDictionary * _Nullable)parameters fileName:(NSString *)fileName fileDatas:(NSArray<NSData *> *)fileDatas swpResultSuccess:(SwpResultSuccessHandle _Nullable)swpResultSuccess swpResultError:(SwpResultErrorHandle _Nullable)swpResultError;

/**
 *  @author swp_song
 *
 *  @brief  swpPOSTUploadFiles:parameters:fileNames:fileDatas:swpResultSuccess:swpResultError:  ( 发起网络请求，多文件上传, 文件名称不相同，使用该方法 )
 *
 *  @param  URLString           请求 URL
 *
 *  @param  parameters          请求传递的参数
 *
 *  @param  fileNames           请求上传一组文件名称
 *
 *  @param  fileDatas           请求上传一组文件数据流
 *
 *  @param  swpResultSuccess    请求成功的回调
 *
 *  @param  swpResultError      请求失败的回调
 *
 *  @return SwpRequest
 */
+ (instancetype)swpPOSTUploadFiles:(NSString *)URLString parameters:(NSDictionary * _Nullable)parameters fileNames:(NSArray<NSString *> *)fileNames fileDatas:(NSArray<NSData *> *)fileDatas swpResultSuccess:(SwpResultSuccessHandle _Nullable)swpResultSuccess swpResultError:(SwpResultErrorHandle _Nullable)swpResultError;


@end
NS_ASSUME_NONNULL_END
