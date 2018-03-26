//
//  SwpRequestDataType.h
//  swp_song
//
//  Created by swp_song on 2017/6/24.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface SwpRequestDataType : NSObject

typedef long long swp_int64_t;

/**
 - SwpResultReachabilityStatus:                 ( 网络状态 )
 - SwpResultReachabilityStatusUnknown:          ( 未知网络 )
 - SwpResultReachabilityStatusNotReachable:     ( 未知网络 )
 - SwpResultReachabilityStatusReachableViaWWAN: ( WWAN )
 - SwpResultReachabilityStatusReachableViaWiFi: ( WiFi )
 */
typedef NS_ENUM(NSInteger, SwpResultReachabilityStatus) {
    SwpResultReachabilityStatusUnknown = -1,
    SwpResultReachabilityStatusNotReachable,
    SwpResultReachabilityStatusReachableViaWWAN,
    SwpResultReachabilityStatusReachableViaWiFi,
};


/**
 - SwpResultUploadFileStatus:       ( 文件上传状态 )
 - SwpResultDoNotFileUpload:        ( 不上传任何文件 )
 - SwpResultSingleFileUpload:       ( 单文件上传 )
 - SwpResultMultipleFilesUpload:    ( 多文件上传，文件名相同  )
 - SwpResultMultiplePicturesUpload: ( 多文件上传，文件名不同  )
 */
typedef NS_ENUM(NSInteger, SwpResultUploadFileStatus) {
    SwpResultDoNotFileUpload    = 0,
    SwpResultSingleFileUpload,
    SwpResultMultipleFilesUpload,
    SwpResultMultiplePicturesUpload,
};


/**
 - SwpRequestMasterInterfaceAppVersionStatus        ( 获取 App 版本状态  )
 - SwpRequestMasterInterfaceDefaultAppVersion:      ( 默认获取自动识别 Production | Development App 版本)
 - SwpRequestMasterInterfaceProductionAppVersion:   ( 获取 Production  App 版本 )
 - SwpRequestMasterInterfaceDevelopmentAppVersion:  ( 获取 Development App 版本 )
 */
typedef NS_ENUM(NSInteger, SwpRequestMasterInterfaceAppVersionStatus) {
    SwpRequestMasterInterfaceDefaultAppVersion = 0,
    SwpRequestMasterInterfaceProductionAppVersion,
    SwpRequestMasterInterfaceDevelopmentAppVersion,
};

/** SwpRequest 请求成功 回调 Block */
typedef void(^SwpResultSuccessHandle)(NSURLSessionDataTask *task, id resultObject);
/** SwpRequest 请求失败 回调 Block */
typedef void(^SwpResultErrorHandle)(NSURLSessionDataTask *task, NSError *error, NSString *errorMessage);
/** SwpRequestMasterInterfaceResultSuccess  主接口 请求成功 回调 Block  */
typedef void(^SwpRequestMasterInterfaceResultSuccess)(NSDictionary *resultObject);
/** SwpRequestMasterInterfaceResultError    主接口 请求失败 回调 Block  */
typedef void(^SwpRequestMasterInterfaceResultError)(NSInteger errorCode, NSString *errorMessage);

/** SwpDownloadProgress 下载进度 结构体 */
struct SwpDownloadProgress {
    double      swpFractionCompleted;       //  下载进度百分比
    swp_int64_t swpTotalUnitCount;          //  下载文件总数
    swp_int64_t swpCompletedUnitCount;      //  下载完成数
};
typedef struct SwpDownloadProgress SwpDownloadProgress;

/**
 *  @author swp_song
 *
 *  @brief  SwpDownloadProgressMake ( 快速初始化 )
 *
 *  @param  swpFractionCompleted    下载进度百分比
 *
 *  @param  swpTotalUnitCount       下载文件总数
 *
 *  @param  swpCompletedUnitCount   下载完成数
 *
 *  @return SwpDownloadProgress
 */
SwpDownloadProgress SwpDownloadProgressMake(double swpFractionCompleted, swp_int64_t swpTotalUnitCount, swp_int64_t swpCompletedUnitCount);

@end
NS_ASSUME_NONNULL_END
