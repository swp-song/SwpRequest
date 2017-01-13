//
//  SwpRequestVariableType.m
//  swp_song
//
//  Created by swp_song on 16/5/17.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "SwpRequestVariableType.h"

@implementation SwpRequestVariableType

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
SwpDownloadProgress SwpDownloadProgressMake(double swpFractionCompleted, swp_int64_t swpTotalUnitCount, swp_int64_t swpCompletedUnitCount) {
    SwpDownloadProgress swpDownloadProgress;
    swpDownloadProgress.swpFractionCompleted  = swpFractionCompleted;
    swpDownloadProgress.swpTotalUnitCount     = swpTotalUnitCount;
    swpDownloadProgress.swpCompletedUnitCount = swpCompletedUnitCount;
    return swpDownloadProgress;
}

@end
