//
//  SwpDataDispose.h
//  swp_song
//
//  Created by swp_song on 16/5/17.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface SwpDataDispose : NSObject


/*!
 *  @author swp_song
 *
 *  @brief  swpDataRequestDecryptDispose:responseObject:isBase64:   ( 返回 数据 解密 处理 )
 *
 *  @param  responseObject
 *
 *  @param  base64
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)swpDataRequestDecryptDispose:(id)responseObject isBase64:(BOOL)base64;

/*!
 *  @author swp_song
 *
 *  @brief  swpDataEncryptParams:encryptedKey:  ( 字典 加密 )
 *
 *  @param  dictionary
 *
 *  @param  encryptedKey
 *
 *  @return
 */
+ (NSDictionary *)swpDataEncryptParams:(NSDictionary *)dictionary encryptedKey:(NSString *)encryptedKey;

@end
NS_ASSUME_NONNULL_END
