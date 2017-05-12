//
//  SwpRequestTools.m
//  swp_song
//
//  Created by swp_song on 16/5/17.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "SwpRequestTools.h"

/*! ---------------------- Tool       ---------------------- !*/
#import <ifaddrs.h>                     // 获取 设备IP   使用
#import <arpa/inet.h>                   // 获取 设备IP   使用
#import <sys/utsname.h>                 // 获取 设备类型 使用
#import <UIKit/UIKit.h>                 // UIKit
/*! ---------------------- Tool       ---------------------- !*/

@implementation SwpRequestTools

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestToolsSetNetworkActivityIndicatorVisible:  ( 显示 或 隐藏 网络获取数据时 UINavigationBar 上的图标 <转圈的菊花 > )
 *
 *  @ param  networkActivityIndicatorVisible
 */
+ (void)swpRequestToolsSetNetworkActivityIndicatorVisible:(BOOL)networkActivityIndicatorVisible {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = networkActivityIndicatorVisible;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestToolsGetErrorMessage: ( 获取 错误信息 )
 *
 *  @ param  error
 *
 *  @ return NSString
 */
+ (NSString *)swpRequestToolsGetErrorMessage:(NSError *)error {
    return error == nil ? nil : [NSString stringWithFormat:@"错误代码%ld \n 错误信息%@", (long)error.code, error.localizedDescription];
}



/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestToolsDownloadFilePathDispose:  ( 下载 文件 路径处理 )
 *
 *  @ param  filePath
 *
 *  @ return NSString
 */
+ (NSString *)swpRequestToolsDownloadFilePathDispose:(NSURL *)filePath {
    return [NSString stringWithFormat:@"%@/%@", [self swpRequestToolsGetDocumentsPath], [self swpRequestToolsGetDownloadFileName:filePath]];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestToolsGetDownloadFileName:  ( 取出 下载 文件名称 )
 *
 *  @ param  filePath
 *
 *  @ return NSString
 */
+ (NSString *)swpRequestToolsGetDownloadFileName:(NSURL *)filePath {
    NSString *filePathString = [NSString stringWithFormat:@"%@", filePath];
    return [filePathString componentsSeparatedByString:@"/"].lastObject;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestToolsGetDocumentsPath  ( 取出 documents 文件路径 )
 *
 *  @ return NSString
 */
+ (NSString *)swpRequestToolsGetDocumentsPath {
    NSArray  *paths          = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPaths = [paths objectAtIndex:0];
    return documentsPaths;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestToolsMasterInterfaceParametersHandling:setAppKey:setAppKeyValue: ( 设置 主接口 提交数据 app_key )
 *
 *  @ param  parameters
 *
 *  @ param  appKey
 *
 *  @ param  appKeyValue
 *
 *  @ return NSDictionary
 */
+ (NSDictionary *)swpRequestToolsMasterInterfaceParametersHandling:(NSDictionary *)parameters setAppKey:(NSString *)appKey setAppKeyValue:(NSString *)appKeyValue {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithDictionary:parameters];
    [dictionary setObject:appKeyValue forKey:appKey];
    return dictionary.copy;
}


/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestToolsUserDefaultSetObject:forKey: ( 存储 UserDefault )
 *
 *  @ param  object
 *
 *  @ param  key
 *
 *  @ return BOOL
 */
+ (BOOL)swpRequestToolsUserDefaultSetObject:(id)object forKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:object forKey:key];
    return [defaults synchronize];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestToolsUserDefaultGetObject:    ( 取出 NSUserDefaults 存储的数据 )
 *
 *  @ param  key
 *
 *  @ return id
 */
+ (id)swpRequestToolsUserDefaultGetObject:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}



/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestToolsGetAppVersion   ( 获取 系统 版本号 < 无需自己判断 > )
 *
 *  @ return NSString
 */
+ (NSString *)swpRequestToolsGetAppVersion {
#if DEBUG
    return [[self class] swpRequestToolsBundleVersion];
#else
    return [[self class] swpRequestToolsBundleShortVersionString];
#endif
    
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestToolsBundleVersion   ( 获取 系统 版本号 Production )
 *
 *  @ return NSString
 */
+ (NSString *)swpRequestToolsBundleVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestToolsBundleVersion   ( 获取 系统 版本号 Development )
 *
 *  @ return NSString
 */
+ (NSString *)swpRequestToolsBundleShortVersionString {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}


/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestToolsCheckStringMessage: ( 验证字符串 信息 )
 *
 *  @ param  string
 *
 *  @ return NSString
 */
+ (NSString *)swpRequestToolsCheckStringMessage:(NSString *)string {
    return string ? string : @"";
}



/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestToolsGetIphoneIpAddress ( 获取 当前 设备的 Ip 地址 )
 *
 *  @ return NSString Ip
 */
+ (NSString *)swpRequestToolsGetIphoneIpAddress {
    
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr  = NULL;
    int            success     = 0;
    NSString       *address    = @"error";
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while (temp_addr != NULL) {
            if( temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if ([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
    return address;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpRequestToolsDeviceDeviceType: ( 获取 设备 类型 )
 *
 *  @ return NSString
 */
+ (NSString *)swpRequestToolsDeviceDeviceType {
   
    struct utsname systemMessage;
    uname(&systemMessage);
    NSString *deviceType = [NSString stringWithCString:systemMessage.machine encoding:NSUTF8StringEncoding];
    
    //iPhone 系列
    if ([deviceType isEqualToString:@"iPhone1,1"])  return @"iPhone 1G";
    if ([deviceType isEqualToString:@"iPhone1,2"])  return @"iPhone 3G";
    if ([deviceType isEqualToString:@"iPhone2,1"])  return @"iPhone 3GS";
    if ([deviceType isEqualToString:@"iPhone3,1"])  return @"iPhone 4";
    if ([deviceType isEqualToString:@"iPhone3,2"])  return @"Verizon iPhone 4";
    if ([deviceType isEqualToString:@"iPhone4,1"])  return @"iPhone 4S";
    if ([deviceType isEqualToString:@"iPhone5,1"])  return @"iPhone 5";
    if ([deviceType isEqualToString:@"iPhone5,2"])  return @"iPhone 5";
    if ([deviceType isEqualToString:@"iPhone5,3"])  return @"iPhone 5C";
    if ([deviceType isEqualToString:@"iPhone5,4"])  return @"iPhone 5C";
    if ([deviceType isEqualToString:@"iPhone6,1"])  return @"iPhone 5S";
    if ([deviceType isEqualToString:@"iPhone6,2"])  return @"iPhone 5S";
    if ([deviceType isEqualToString:@"iPhone7,1"])  return @"iPhone 6 Plus";
    if ([deviceType isEqualToString:@"iPhone7,2"])  return @"iPhone 6";
    if ([deviceType isEqualToString:@"iPhone8,1"])  return @"iPhone 6s";
    if ([deviceType isEqualToString:@"iPhone8,2"])  return @"iPhone 6s Plus";
    if ([deviceType isEqualToString:@"iPhone9,1"])  return @"iPhone 7 (CDMA)";
    if ([deviceType isEqualToString:@"iPhone9,3"])  return @"iPhone 7 (GSM)";
    if ([deviceType isEqualToString:@"iPhone9,2"])  return @"iPhone 7 Plus (CDMA)";
    if ([deviceType isEqualToString:@"iPhone9,4"])  return @"iPhone 7 Plus (GSM)";
    
    //iPod 系列
    if ([deviceType isEqualToString:@"iPod1,1"])   return @"iPod Touch 1G";
    if ([deviceType isEqualToString:@"iPod2,1"])   return @"iPod Touch 2G";
    if ([deviceType isEqualToString:@"iPod3,1"])   return @"iPod Touch 3G";
    if ([deviceType isEqualToString:@"iPod4,1"])   return @"iPod Touch 4G";
    if ([deviceType isEqualToString:@"iPod5,1"])   return @"iPod Touch 5G";
    
    //iPad 系列
    if ([deviceType isEqualToString:@"iPad1,1"])   return @"iPad";
    if ([deviceType isEqualToString:@"iPad2,1"])   return @"iPad 2 (WiFi)";
    if ([deviceType isEqualToString:@"iPad2,2"])   return @"iPad 2 (GSM)";
    if ([deviceType isEqualToString:@"iPad2,3"])   return @"iPad 2 (CDMA)";
    if ([deviceType isEqualToString:@"iPad2,4"])   return @"iPad 2 (32nm)";
    if ([deviceType isEqualToString:@"iPad2,5"])   return @"iPad mini (WiFi)";
    if ([deviceType isEqualToString:@"iPad2,6"])   return @"iPad mini (GSM)";
    if ([deviceType isEqualToString:@"iPad2,7"])   return @"iPad mini (CDMA)";
    
    if ([deviceType isEqualToString:@"iPad3,1"])   return @"iPad 3(WiFi)";
    if ([deviceType isEqualToString:@"iPad3,2"])   return @"iPad 3(CDMA)";
    if ([deviceType isEqualToString:@"iPad3,3"])   return @"iPad 3(4G)";
    if ([deviceType isEqualToString:@"iPad3,4"])   return @"iPad 4 (WiFi)";
    if ([deviceType isEqualToString:@"iPad3,5"])   return @"iPad 4 (4G)";
    if ([deviceType isEqualToString:@"iPad3,6"])   return @"iPad 4 (CDMA)";
    
    if ([deviceType isEqualToString:@"iPad4,1"])   return @"iPad Air";
    if ([deviceType isEqualToString:@"iPad4,2"])   return @"iPad Air";
    if ([deviceType isEqualToString:@"iPad4,3"])   return @"iPad Air";
    if ([deviceType isEqualToString:@"iPad5,3"])   return @"iPad Air 2";
    if ([deviceType isEqualToString:@"iPad5,4"])   return @"iPad Air 2";
    if ([deviceType isEqualToString:@"i386"])      return @"Simulator";
    if ([deviceType isEqualToString:@"x86_64"])    return @"Simulator";
    
    if ([deviceType isEqualToString:@"iPad4,4"] || [deviceType isEqualToString:@"iPad4,5"] || [deviceType isEqualToString:@"iPad4,6"])   return @"iPad mini 2";
    
    if ([deviceType isEqualToString:@"iPad4,7"] || [deviceType isEqualToString:@"iPad4,8"] || [deviceType isEqualToString:@"iPad4,9"])   return @"iPad mini 3";
    
    return deviceType;
}


@end
