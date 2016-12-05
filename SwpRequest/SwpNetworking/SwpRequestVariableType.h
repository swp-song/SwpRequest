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
/*! 网络状态  !*/
typedef NS_ENUM(NSInteger, SwpResultReachabilityStatus) {
    SwpResultReachabilityStatusUnknown          = -1,   /*! 未知网络    !*/
    SwpResultReachabilityStatusNotReachable     = 0,    /*! 无网络      !*/
    SwpResultReachabilityStatusReachableViaWWAN = 1,    /*! WWAN        !*/
    SwpResultReachabilityStatusReachableViaWiFi = 2,    /*! WiFi        !*/
};


/*! 上传图片 状态  !*/
typedef NS_ENUM(NSInteger, SwpResultUploadFileStatus) {
    
    SwpResultDoNotFileUpload = 0,           /*! 不上传文件    !*/
    SwpResultSingleFileUpload,              /*! 单位件上传    !*/
    SwpResultMultipleFilesUpload,           /*! 多文件上传 < 文件名相同 >    !*/
    SwpResultMultiplePicturesUpload,        /*! 多文件上传 < 文件名不同 >  !*/
};

/*! SwpRequest 的请求成功 回调 Block !*/
typedef void(^SwpResultSuccessHandle)(NSURLSessionDataTask *task, id resultObject);
/*! SwpRequest 的请求失败 回调 Block !*/
typedef void(^SwpResultErrorHandle)(NSURLSessionDataTask *task, NSError *error, NSString *errorMessage);

/*! 表示 下载进度 结构体 !*/
struct SwpDownloadProgress {
    double      swpFractionCompleted;
    swp_int64_t swpTotalUnitCount;
    swp_int64_t swpCompletedUnitCount;
};
typedef struct SwpDownloadProgress SwpDownloadProgress;

/*!
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
