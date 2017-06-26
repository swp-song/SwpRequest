//
//  SwpRequestUtils.m
//  swp_song
//
//  Created by swp_song on 2017/6/24.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpRequestUtils.h"

/*! ---------------------- Tool       ---------------------- !*/
#import "AFNetworking.h"            //  AFNetworking 网络库
/*! ---------------------- Tool       ---------------------- !*/

@implementation SwpRequestUtils


/**!
 *  @author swp_song
 *
 *  @brief  swpRequestUtilsReachabilityStatusChangeBlock:   ( 验证网路环境 )
 *
 *  @param  swpResultStatus swpResultStatus
 */
+ (void)swpRequestUtilsReachabilityStatusChangeBlock:(void(^)(SwpResultReachabilityStatus swpResultStatus))swpResultStatus {
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        SwpResultReachabilityStatus verificationStatus = SwpResultReachabilityStatusUnknown;
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                verificationStatus = SwpResultReachabilityStatusUnknown;
                break;
            case AFNetworkReachabilityStatusNotReachable:
                verificationStatus = SwpResultReachabilityStatusNotReachable;
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                verificationStatus = SwpResultReachabilityStatusReachableViaWWAN;
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                verificationStatus = SwpResultReachabilityStatusReachableViaWiFi;
                break;
            default:
                break;
        }
        
        if (swpResultStatus) swpResultStatus(verificationStatus);
    }];
}

@end

