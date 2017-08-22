//
//  SwpNetworkModelTools.h
//  Demo
//
//  Created by swp_song on 2017/1/10.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface SwpNetworkModelTools : NSObject

/**
 *  @return swp_song
 *
 *  @brief  swpNetworkModelToolsDomainNameHandling:setMainInterface:    ( 域名处理 )
 *
 *  @param  domainName      域名
 *
 *  @param  mainInterface   主接口
 *
 *  @return NSString
 */
+ (NSString *)swpNetworkModelToolsDomainNameHandling:(NSString *)domainName mainInterface:(NSString *)mainInterface;

/**
 *  @return swp_song
 *
 *  @brief  swpNetworkModelToolsMainInterfaceHandling:mainInterface:    ( 主接口数据处理 )
 *
 *  @param  domainName      域名
 *
 *  @param  mainInterface   主接口
 *
 *  @return NSString
 */
+ (NSString *)swpNetworkModelToolsMainInterfaceHandling:(NSString *)domainName mainInterface:(NSString *)mainInterface;
@end
NS_ASSUME_NONNULL_END
