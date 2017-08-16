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

/**!
 *  @author swp_song
 *
 *  @brief  swpRequestSetEncryptRange:  ( 设置加密位数, NSRange location 其实位置, length 结束位置 )
 *
 *  @param  swpEncryptRange swpEncryptRange
 *
 *  @return SwpRequest
 */
+ (SwpRequest *)swpEncryptSetRange:(NSRange)swpEncryptRange;

/**!
 *  @author swp_song
 *
 *  @brief  swpEncryptSetRange  ( 设置加密位数, NSRange location 其实位置, length 结束位置 )
 */
+ (SwpRequest * _Nonnull (^)(NSRange))swpEncryptSetRange;

/**!
 *  @author swp_song
 *
 *  @brief  swpEncryptRequestSetAppKey:    ( 设置 appKey, 加密 Key )
 *
 *  @param  swpEncryptRequestAppKey swpEncryptRequestAppKey
 *
 *  @return SwpRequest
 */
+ (instancetype)swpEncryptRequestSetAppKey:(NSString *)swpEncryptRequestAppKey;

/**!
 *  @author swp_song
 *
 *  @brief  swpEncryptRequestSetAppKey  ( 设置 appKey, 加密 key )
 */
+ (SwpRequest * _Nonnull (^)(NSString * _Nonnull))swpEncryptRequestSetAppKey;


/**!
 *  @author swp_song
 *
 *  @brief  swpEncryptRequestGetAppKey  ( 获取 appKey )
 *
 *  @return NSString
 */
+ (NSString *)swpEncryptRequestGetAppKey;


/**!
 *  @author swp_song
 *
 *  @brief  swpEncryptResultGetAppKeyValue  ( 获取加密 appKey Value )
 *
 *  @return NSString
 */
+ (NSString *)swpEncryptResultGetAppKeyValue;


#pragma mark - Network Requests Methods
/**!
 *  @author swp_song
 *
 *  @brief  swpPOSTEncrypt:encryptParameters:swpResultSuccess:swpResultError:   ( 设置 appKey, 加密 key )
 *
 *  @param  URLString           URLString
 *
 *  @param  parameters          parameters
 *
 *  @param  swpResultSuccess    swpResultSuccess
 *
 *  @param  swpResultError      swpResultError
 *
 *  @return SwpRequest
 */
+ (instancetype)swpPOST:(NSString *)URLString encryptParameters:(NSDictionary *)parameters swpResultSuccess:(SwpResultSuccessHandle _Nullable)swpResultSuccess swpResultError:(SwpResultErrorHandle _Nullable)swpResultError;


/**!
 *  @author swp_song
 *
 *  @brief  swpPOSTUploadFile:encryptParameters:fileName:fileData:swpResultSuccess:swpResultError:  ( 请求网络获上传文件, 单文件上传 <POST> )
 *
 *  @param  URLString           URLString
 *
 *  @param  parameters          parameters
 *
 *  @param  fileName            fileName
 *
 *  @param  fileData            fileData
 *
 *  @param  swpResultSuccess    swpResultSuccess
 *
 *  @param  swpResultError      swpResultError
 *
 *  @return SwpRequest
 */
+ (instancetype)swpPOSTUploadFile:(NSString *)URLString encryptParameters:(NSDictionary *)parameters fileName:(NSString *)fileName fileData:(NSData *)fileData swpResultSuccess:(SwpResultSuccessHandle _Nullable)swpResultSuccess swpResultError:(SwpResultErrorHandle _Nullable)swpResultError;


/**!
 *  @author swp_song
 *
 *  @brief  swpPOSTUploadFiles:encryptParameters:fileName:fileDatas:swpResultSuccess:swpResultError:    ( 请求网络获上传文件, 多文件上传, 文件名称相同使用该方法 <POST> )
 *
 *  @param  URLString           URLString
 *
 *  @param  parameters          parameters
 *
 *  @param  fileName            fileName
 *
 *  @param  fileDatas           fileDatas
 *
 *  @param  swpResultSuccess    swpResultSuccess
 *
 *  @param  swpResultError      swpResultError
 *
 *  @return SwpRequest
 */
+ (instancetype)swpPOSTUploadFiles:(NSString *)URLString encryptParameters:(NSDictionary *)parameters fileName:(NSString *)fileName fileDatas:(NSArray *)fileDatas swpResultSuccess:(SwpResultSuccessHandle _Nullable)swpResultSuccess swpResultError:(SwpResultErrorHandle _Nullable)swpResultError;


/**!
 *  @author swp_song
 *
 *  @brief  swpPOSTUploadFiles:encryptParameters:fileNames:fileDatas:swpResultSuccess:swpResultError:   ( 请求网络获上传文件, 多文件上传, 文件名称不相同相同使用该方法  <POST> )
 *
 *  @param  URLString           URLString
 *
 *  @param  parameters          parameters
 *
 *  @param  fileNames           fileNames
 *
 *  @param  fileDatas           fileDatas
 *
 *  @param  swpResultSuccess    swpResultSuccess
 *
 *  @param  swpResultError      swpResultError
 *
 *  @return SwpRequest
 */
+ (instancetype)swpPOSTUploadFiles:(NSString *)URLString encryptParameters:(NSDictionary *)parameters fileNames:(NSArray *)fileNames fileDatas:(NSArray *)fileDatas swpResultSuccess:(SwpResultSuccessHandle _Nullable)swpResultSuccess swpResultError:(SwpResultErrorHandle _Nullable)swpResultError;

@end
NS_ASSUME_NONNULL_END
