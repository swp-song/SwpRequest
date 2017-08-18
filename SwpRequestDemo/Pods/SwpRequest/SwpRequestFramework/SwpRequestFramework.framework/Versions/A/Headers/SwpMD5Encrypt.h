//
//  SwpMD5Encrypt.h
//  swp_song
//
//  Created by swp_song on 2017/8/18.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface SwpMD5Encrypt : NSObject

/**
 *  @author swp_song
 *
 *  @brief  swpMD5Encrypt:  ( 字符串 MD5 加密 )
 *
 *  @param  string  string
 *
 *  @return NSString
 */
+ (NSString *)swpMD5Encrypt:(NSString *)string;

/**
 *  @author swp_song
 *
 *  @brief  swpMD5EncryptLowercaseString:   ( 字符串中每个字母进行 MD5 转换成小写 )
 *
 *  @param  string  string
 *
 *  @return NSString
 */
+ (NSString *)swpMD5EncryptLowercaseString:(NSString *)string;

/**
 *  @author swp_song
 *
 *  @brief  swpMD5EncryptUppercaseString:   ( 字符串中每个字母进行 MD5 转换成大写 )
 *
 *  @param  string  string
 *
 *  @return NSString
 */
+ (NSString *)swpMD5EncryptUppercaseString:(NSString *)string;



@end
NS_ASSUME_NONNULL_END
