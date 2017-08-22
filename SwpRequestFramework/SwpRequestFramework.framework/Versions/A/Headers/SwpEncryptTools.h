//
//  SwpEncryptTools.h
//  swp_song
//
//  Created by swp_song on 2017/6/23.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface SwpEncryptTools : NSObject

/**
 *  @author swp_song
 *
 *  @brief  swpEncryptToolsResultDecrypt:isLog: ( 返回数据解密 )
 *
 *  @param  responseObject  解密数据源
 *
 *  @param  isLog           是否打印
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)swpEncryptToolsResultDecrypt:(id)responseObject isLog:(BOOL)isLog;

/**
 *  @author swp_song
 *
 *  @brief  swpEncryptToolsEncryptParams:encryptedKey:interceptRange:   ( 参数加密 )
 *
 *  @param  dictionary      dictionary
 *
 *  @param  encryptedKey    encryptedKey
 *
 *  @param  interceptRange  interceptRange
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)swpEncryptToolsEncryptParams:(NSDictionary *)dictionary encryptedKey:(NSString *)encryptedKey interceptRange:(NSRange)interceptRange;

@end
NS_ASSUME_NONNULL_END
