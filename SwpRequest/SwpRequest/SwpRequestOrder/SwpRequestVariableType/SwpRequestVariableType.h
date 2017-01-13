//
//  SwpRequestVariableType.h
//  swp_song
//
//  Created by swp_song on 16/5/17.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface SwpRequestVariableType : NSObject

typedef long long swp_int64_t;

/**!
 *  @ author swp_song
 *
 *  @ brief  SwpResultReachabilityStatus                ( 网络状态 )
 *
 *  @ - SwpResultReachabilityStatusUnknown:             ( 未知网络 )
 *
 *  @ - SwpResultReachabilityStatusNotReachable:        ( 无网络 )
 *
 *  @ - SwpResultReachabilityStatusReachableViaWWAN:    ( WWAN )
 *
 *  @ - SwpResultReachabilityStatusReachableViaWiFi:    ( WiFi )
 */
typedef NS_ENUM(NSInteger, SwpResultReachabilityStatus) {
    SwpResultReachabilityStatusUnknown          = -1,
    SwpResultReachabilityStatusNotReachable     = 0,
    SwpResultReachabilityStatusReachableViaWWAN = 1,
    SwpResultReachabilityStatusReachableViaWiFi = 2,
};

/**!
 *  @ author swp_song
 *
 *  @ brief  SwpResultUploadFileStatus ( 快速初始化 表示下载进度的结构体 )
 *
 *  @ - SwpResultDoNotFileUpload:         ( 不上传文件 )
 *
 *  @ - SwpResultSingleFileUpload:        ( 单位件上传 )
 *
 *  @ - SwpResultMultipleFilesUpload:     ( 多文件上传 < 文件名相同 > )
 *
 *  @ - SwpResultMultiplePicturesUpload:  ( 多文件上传 < 文件名不同 > )
 */
typedef NS_ENUM(NSInteger, SwpResultUploadFileStatus) {
    SwpResultDoNotFileUpload    = 0,
    SwpResultSingleFileUpload,
    SwpResultMultipleFilesUpload,
    SwpResultMultiplePicturesUpload,
};

/**!
 *  @ author swp_song
 *
 *  @ brief  SwpRequestMasterInterfaceAppVersionStatus      ( 主接口 获取 App 版本状态  )
 *
 *  @ - SwpRequestMasterInterfaceDefaultAppVersion:         ( 默认 获取 自动 识别 Production | Development App 版本)
 *
 *  @ - SwpRequestMasterInterfaceProductionAppVersion:      ( 获取 Production  App 版本 )
 *
 *  @ - SwpRequestMasterInterfaceDevelopmentAppVersion:     ( 获取 Development App 版本 )
 */
typedef NS_ENUM(NSInteger, SwpRequestMasterInterfaceAppVersionStatus) {
    SwpRequestMasterInterfaceDefaultAppVersion = 0,
    SwpRequestMasterInterfaceProductionAppVersion,
    SwpRequestMasterInterfaceDevelopmentAppVersion,
};

/*! SwpRequest 请求成功 回调 Block                                      !*/
typedef void(^SwpResultSuccessHandle)(NSURLSessionDataTask *task, id resultObject);
/*! SwpRequest 请求失败 回调 Block                                      !*/
typedef void(^SwpResultErrorHandle)(NSURLSessionDataTask *task, NSError *error, NSString *errorMessage);

/*! SwpRequestMasterInterfaceResultSuccess  主接口 请求成功 回调 Block  !*/
typedef void(^SwpRequestMasterInterfaceResultSuccess)(NSDictionary *resultObject);
/*! SwpRequestMasterInterfaceResultError    主接口 请求失败 回调 Block  !*/
typedef void(^SwpRequestMasterInterfaceResultError)(NSInteger errorCode, NSString *errorMessage);

/*! SwpDownloadProgress 下载进度 结构体 !*/
struct SwpDownloadProgress {
    double      swpFractionCompleted;
    swp_int64_t swpTotalUnitCount;
    swp_int64_t swpCompletedUnitCount;
};
typedef struct SwpDownloadProgress SwpDownloadProgress;

/**!
 *  @ author swp_song
 *
 *  @ brief  SwpDownloadProgress ( 快速初始化 表示下载进度的结构体 )
 *
 *  @ param  swpFractionCompleted
 *
 *  @ param  swpTotalUnitCount
 *
 *  @ param  swpCompletedUnitCount
 *
 *  @ return SwpDownloadProgress
 */
SwpDownloadProgress SwpDownloadProgressMake(double swpFractionCompleted, swp_int64_t swpTotalUnitCount, swp_int64_t swpCompletedUnitCount);

@end
NS_ASSUME_NONNULL_END
