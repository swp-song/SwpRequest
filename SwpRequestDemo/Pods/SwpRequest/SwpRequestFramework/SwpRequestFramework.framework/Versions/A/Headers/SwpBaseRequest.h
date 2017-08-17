//
//  SwpBaseRequest.h
//  swp_song
//
//  Created by swp_song on 2017/6/24.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

/*! ---------------------- Tool       ---------------------- !*/
#import "SwpRequestDataType.h"          // Data Type
/*! ---------------------- Tool       ---------------------- !*/

NS_ASSUME_NONNULL_BEGIN
@interface SwpBaseRequest : NSObject <NSCopying, NSMutableCopying>

/**!
 *  @author swp_song
 *
 *  @brief  shareInstance   ( 单利快速初始 )
 *
 *  @return id
 */
+ (instancetype)shareInstance;


@end
NS_ASSUME_NONNULL_END
