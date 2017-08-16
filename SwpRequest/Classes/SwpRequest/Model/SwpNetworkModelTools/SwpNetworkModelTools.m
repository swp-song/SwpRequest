//
//  SwpNetworkModelTools.m
//  Demo
//
//  Created by swp_song on 2017/1/10.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpNetworkModelTools.h"

static NSString * const kSwpNetworkDomainNameKey    = @"SwpNetworkDomainNameKey";
static NSString * const kSwpNetworkMainInterfaceURL = @"SwpNetworkMainInterfaceURL";

@implementation SwpNetworkModelTools

/**!
 *  @return swp_song
 *
 *  @brief  swpNetworkModelToolsGetDomainName:setMainInterface:  ( 取出 设置的 域名 )
 *
 *  @param  domainName          domainName
 *
 *  @param  mainInterfaceURL    mainInterfaceURL
 *
 *  @return NSString
 */
+ (NSString *)swpNetworkModelToolsGetDomainName:(NSString *)domainName setMainInterface:(NSString *)mainInterfaceURL {
    return [self.class swpNetworkModelToolsDomainNameHandling:domainName setMainInterface:mainInterfaceURL][kSwpNetworkDomainNameKey];
}

/**!
 *  @return swp_song
 *
 *  @brief  swpNetworkModelToolsGetMainInterfaceURL:setMainInterface:  ( 取出 设置 主接口 名称 )
 *
 *  @param  domainName          domainName
 *
 *  @param  mainInterfaceURL    mainInterfaceURL
 *
 *  @return NSString
 */
+ (NSString *)swpNetworkModelToolsGetMainInterfaceURL:(NSString *)domainName setMainInterface:(NSString *)mainInterfaceURL {
    return [self.class swpNetworkModelToolsDomainNameHandling:domainName setMainInterface:mainInterfaceURL][kSwpNetworkMainInterfaceURL];
}



/**!
 *  @return swp_song
 *
 *  @brief  swpNetworkModelToolsDomainNameHandling:setMainInterface:( 取出 设置 主接口 名称 )
 *
 *  @param  domainName          domainName
 *
 *  @param  mainInterfaceURL    mainInterfaceURL
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)swpNetworkModelToolsDomainNameHandling:(NSString *)domainName setMainInterface:(NSString *)mainInterfaceURL {
    NSString *type0 = domainName.copy;
    NSString *type1 = mainInterfaceURL.copy;
    if (![domainName hasSuffix:@"/"] && ![type1 hasPrefix:@"/"]) {
        type0 = [NSString stringWithFormat:@"%@/", domainName];
        return [self swpNetworkModelToolsDomainNamePacking:type0 setMainInterface:type1];
    } else if ([domainName hasSuffix:@"/"] && [type1 hasPrefix:@"/"]) {
        type1 = [type1 substringFromIndex:1];
        return [self swpNetworkModelToolsDomainNamePacking:type0 setMainInterface:type1];
    }  else if (![domainName hasSuffix:@"/"] || [type1 hasPrefix:@"/"]) {
        type0 = [NSString stringWithFormat:@"%@/", type0];
        type1 = [type1 substringFromIndex:1];
        return [self swpNetworkModelToolsDomainNamePacking:type0 setMainInterface:type1];
    } else {
        return [self swpNetworkModelToolsDomainNamePacking:type0 setMainInterface:type1];
    }
}


/**!
 *  @return swp_song
 *
 *  @brief  swpNetworkModelToolsDomainNamePacking:setMainInterface:    ( 包装成 一个字典 )
 *
 *  @param  domainName          domainName
 *
 *  @param  mainInterfaceURL    mainInterfaceURL
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)swpNetworkModelToolsDomainNamePacking:(NSString *)domainName setMainInterface:(NSString *)mainInterfaceURL {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject:domainName forKey:kSwpNetworkDomainNameKey];
    [dictionary setObject:mainInterfaceURL forKey:kSwpNetworkMainInterfaceURL];
    return dictionary.copy;
}

@end
