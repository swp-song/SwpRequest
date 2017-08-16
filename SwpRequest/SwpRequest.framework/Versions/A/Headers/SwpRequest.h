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

/**!
 *  @author swp_song
 *
 *  @brief  swpPOST:parameters:uploadFileStatus:fileNames:fileDatas:swpResultSuccess:swpResultError:    ( 网络请求核心方法 )
 *
 *  @param  URLString           URLString
 *
 *  @param  parameters          parameters
 *
 *  @param  uploadFileStatus    uploadFileStatus
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
+ (instancetype)swpPOST:(NSString *)URLString parameters:(NSDictionary * _Nullable)parameters uploadFileStatus:(SwpResultUploadFileStatus)uploadFileStatus fileNames:(id _Nullable)fileNames fileDatas:(id _Nullable)fileDatas swpResultSuccess:(SwpResultSuccessHandle _Nullable)swpResultSuccess swpResultError:(SwpResultErrorHandle _Nullable)swpResultError;

/**!
 *  @author swp_song
 *
 *  @brief  swpPOST:parameters:swpResultSuccess:swpResultError: ( 请求网络获取数据 <POST> )
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
+ (instancetype)swpPOST:(NSString *)URLString parameters:(NSDictionary * _Nullable)parameters swpResultSuccess:(SwpResultSuccessHandle _Nullable)swpResultSuccess swpResultError:(SwpResultErrorHandle _Nullable)swpResultError;

/**!
 *  @author swp_song
 *
 *  @brief  swpPOSTUploadFile:parameters:fileName:fileData:swpResultSuccess:swpResultError: ( 请求网络获上传文件, 单文件上传 <POST> )
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
+ (instancetype)swpPOSTUploadFile:(NSString *)URLString parameters:(NSDictionary * _Nullable)parameters fileName:(NSString *)fileName fileData:(NSData *)fileData swpResultSuccess:(SwpResultSuccessHandle _Nullable)swpResultSuccess swpResultError:(SwpResultErrorHandle _Nullable)swpResultError;


/**!
 *  @author swp_song
 *
 *  @brief  swpPOSTUploadFiles:parameters:fileName:fileDatas:swpResultSuccess:swpResultError:   ( 请求网络获上传文件, 多文件上传, 文件名称相同使用该方法 <POST> )
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
+ (instancetype)swpPOSTUploadFiles:(NSString *)URLString parameters:(NSDictionary * _Nullable)parameters fileName:(NSString *)fileName fileDatas:(NSArray *)fileDatas swpResultSuccess:(SwpResultSuccessHandle _Nullable)swpResultSuccess swpResultError:(SwpResultErrorHandle _Nullable)swpResultError;

/**!
 *  @author swp_song
 *
 *  @brief  swpPOSTUploadFiles:parameters:fileNames:fileDatas:swpResultSuccess:swpResultError:  ( 请求网络获上传文件, 多文件上传, 文件名称不相同相同使用该方法  <POST> )
 *
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
+ (instancetype)swpPOSTUploadFiles:(NSString *)URLString parameters:(NSDictionary * _Nullable)parameters fileNames:(NSArray *)fileNames fileDatas:(NSArray *)fileDatas swpResultSuccess:(SwpResultSuccessHandle _Nullable)swpResultSuccess swpResultError:(SwpResultErrorHandle _Nullable)swpResultError;


@end
NS_ASSUME_NONNULL_END
