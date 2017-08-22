//
//  SwpRequest+SwpEncryptRequest.h
//  SwpRequestDemo
//
//  Created by swp_song on 2017/6/23.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpRequest.h"

NS_ASSUME_NONNULL_BEGIN


@interface SwpRequest (SwpEncryptRequest)

#pragma mark - Set Pproperty Methods

/**
 *  @author swp_song
 *
 *  @brief  swpRequestSetEncryptRange:  ( 设置加密位数, NSRange location 其实位置, length 结束位置 )
 *
 *  @param  swpEncryptRange     加密位数
 *
 *  @return SwpRequest
 */
+ (SwpRequest *)swpEncryptSetRange:(NSRange)swpEncryptRange;

/**
 *  @author swp_song
 *
 *  @brief  swpEncryptSetRange  ( 设置加密位数, NSRange location 其实位置, length 结束位置 )
 */
+ (SwpRequest * _Nonnull (^)(NSRange))swpEncryptSetRange;

/**
 *  @author swp_song
 *
 *  @brief  swpEncryptRequestSetAppKey: ( 设置 AppKey, 加密 Key 的值 )
 *
 *  @param  swpEncryptRequestAppKey 加密 AppKey，key 的值
 *
 *  @return SwpRequest
 */
+ (instancetype)swpEncryptRequestSetAppKey:(NSString *)swpEncryptRequestAppKey;

/**
 *  @author swp_song
 *
 *  @brief  swpEncryptRequestSetAppKey  ( 设置 AppKey, 加密 Key 的值 )
 */
+ (SwpRequest * _Nonnull (^)(NSString * _Nonnull))swpEncryptRequestSetAppKey;


/**
 *  @author swp_song
 *
 *  @brief  swpEncryptRequestGetAppKey  ( 获取 AppKey，Key )
 *
 *  @return NSString
 */
+ (NSString *)swpEncryptRequestGetAppKey;

/**
 *  @author swp_song
 *
 *  @brief  swpEncryptResultGetAppKeyValue  ( 获取加密 AppKey Value )
 *
 *  @return NSString
 */
+ (NSString *)swpEncryptResultGetAppKeyValue;


#pragma mark - Network Requests Methods
/**
 *  @author swp_song
 *
 *  @brief  swpPOSTEncrypt:encryptParameters:swpResultSuccess:swpResultError:   ( 传递参数加密，发起网络请求 )
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
+ (instancetype)swpPOST:(NSString *)URLString encryptParameters:(NSDictionary *)parameters swpResultSuccess:(SwpResultSuccessHandle _Nullable)swpResultSuccess swpResultError:(SwpResultErrorHandle _Nullable)swpResultError;

/**
 *  @author swp_song
 *
 *  @brief  swpPOSTUploadFile:encryptParameters:fileName:fileData:swpResultSuccess:swpResultError:  ( 传递参数加密，发起网络请求，单文件上传 )
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
+ (instancetype)swpPOSTUploadFile:(NSString *)URLString encryptParameters:(NSDictionary *)parameters fileName:(NSString *)fileName fileData:(NSData *)fileData swpResultSuccess:(SwpResultSuccessHandle _Nullable)swpResultSuccess swpResultError:(SwpResultErrorHandle _Nullable)swpResultError;


/**
 *  @author swp_song
 *
 *  @brief  swpPOSTUploadFiles:encryptParameters:fileName:fileDatas:swpResultSuccess:swpResultError:    ( 传递参数加密，发起网络请求，文件名称相同使用该方法 )
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
+ (instancetype)swpPOSTUploadFiles:(NSString *)URLString encryptParameters:(NSDictionary *)parameters fileName:(NSString *)fileName fileDatas:(NSArray<NSData *> *)fileDatas swpResultSuccess:(SwpResultSuccessHandle _Nullable)swpResultSuccess swpResultError:(SwpResultErrorHandle _Nullable)swpResultError;


/**
 *  @author swp_song
 *
 *  @brief  swpPOSTUploadFiles:encryptParameters:fileNames:fileDatas:swpResultSuccess:swpResultError:   ( 传递参数加密，发起网络请求，文件名称不相同，使用该方法 )
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
+ (instancetype)swpPOSTUploadFiles:(NSString *)URLString encryptParameters:(NSDictionary *)parameters fileNames:(NSArray<NSString *> *)fileNames fileDatas:(NSArray<NSData *> *)fileDatas swpResultSuccess:(SwpResultSuccessHandle _Nullable)swpResultSuccess swpResultError:(SwpResultErrorHandle _Nullable)swpResultError;

@end
NS_ASSUME_NONNULL_END
