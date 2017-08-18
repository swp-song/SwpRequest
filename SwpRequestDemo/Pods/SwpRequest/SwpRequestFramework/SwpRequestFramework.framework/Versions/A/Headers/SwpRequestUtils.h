//
//  SwpRequestUtils.h
//  swp_song
//
//  Created by swp_song on 2017/6/24.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpBaseRequest.h"

NS_ASSUME_NONNULL_BEGIN
@interface SwpRequestUtils : SwpBaseRequest

/**
 *  @author swp_song
 *
 *  @brief  swpRequestUtilsReachabilityStatusChangeBlock:   ( 验证网路环境 )
 *
 *  @param  swpResultStatus swpResultStatus
 */
+ (void)swpRequestUtilsReachabilityStatusChangeBlock:(void(^ _Nullable)(SwpResultReachabilityStatus swpResultStatus))swpResultStatus;

@end

NS_ASSUME_NONNULL_END
