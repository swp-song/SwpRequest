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

/**!
 *  @author swp_song
 *
 *  @brief  swpNetworkModelToolsGetDomainName:setMainInterface:  ( 取出 设置的 域名 )
 *
 *  @param  domainName          domainName
 *
 *  @param  mainInterfaceURL    mainInterfaceURL
 *
 *  @return NSString
 */
+ (NSString *)swpNetworkModelToolsGetDomainName:(NSString *)domainName setMainInterface:(NSString *)mainInterfaceURL;

/**!
 *  @author swp_song
 *
 *  @brief  swpNetworkModelToolsGetMainInterfaceURL:setMainInterface:  ( 取出 设置 主接口 名称 )
 *
 *  @param  domainName          domainName
 *
 *  @param  mainInterfaceURL    mainInterfaceURL
 *
 *  @return NSString
 */
+ (NSString *)swpNetworkModelToolsGetMainInterfaceURL:(NSString *)domainName setMainInterface:(NSString *)mainInterfaceURL;

@end
NS_ASSUME_NONNULL_END
