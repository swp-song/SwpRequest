
//
//  SwpRequestDataType.m
//  swp_song
//
//  Created by swp_song on 2017/6/24.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpRequestDataType.h"

@implementation SwpRequestDataType

/**!
 *  @author swp_song
 *
 *  @brief  SwpDownloadProgressMake ( 快速初始化 )
 *
 *  @param  swpFractionCompleted    swpFractionCompleted
 *
 *  @param  swpTotalUnitCount       swpTotalUnitCount
 *
 *  @param  swpCompletedUnitCount   swpCompletedUnitCount
 *
 *  @return SwpDownloadProgress
 */
SwpDownloadProgress SwpDownloadProgressMake(double swpFractionCompleted, swp_int64_t swpTotalUnitCount, swp_int64_t swpCompletedUnitCount) {
    SwpDownloadProgress swpDownloadProgress;
    swpDownloadProgress.swpFractionCompleted  = swpFractionCompleted;
    swpDownloadProgress.swpTotalUnitCount     = swpTotalUnitCount;
    swpDownloadProgress.swpCompletedUnitCount = swpCompletedUnitCount;
    return swpDownloadProgress;
}


@end
