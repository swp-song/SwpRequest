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

/**!
 *  @author swp_song
 *
 *  @brief  swpEncryptToolsMD5: ( 字符串 MD5 加密 )
 *
 *  @param  string  string
 *
 *  @return NSString
 */
+ (NSString *)swpEncryptToolsMD5:(NSString *)string;

/**!
 *  @author swp_song
 *
 *  @brief  swpEncryptToolsResultDecrypt:   ( 返回数据解密处理 )
 *
 *  @param  responseObject  responseObject
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)swpEncryptToolsResultDecrypt:(id)responseObject;

/**!
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
