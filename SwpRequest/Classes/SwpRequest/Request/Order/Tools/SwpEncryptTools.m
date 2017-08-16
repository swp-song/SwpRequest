//
//  SwpEncryptTools.m
//  swp_song
//
//  Created by swp_song on 2017/6/23.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpEncryptTools.h"

/*! ---------------------- Tool       ---------------------- !*/
#import <Base64nl/Base64.h>             // Base64 加密
#import <CommonCrypto/CommonDigest.h>   // MD5    加密
/*! ---------------------- Tool       ---------------------- !*/

@implementation SwpEncryptTools

/**!
 *  @author swp_song
 *
 *  @brief  swpEncryptToolsResultDecrypt:   ( 返回数据解密处理 )
 *
 *  @param  responseObject  responseObject
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)swpEncryptToolsResultDecrypt:(id)responseObject {
    
    NSString *decodeJson = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
    NSLog(@" request the result = %@", decodeJson);
    
    decodeJson           = [decodeJson base64DecodedString];
    
    NSLog(@" result decrypt = %@", decodeJson);

    if (!decodeJson) return nil;
    
    // 字符串转成流
    NSData       *data = [decodeJson dataUsingEncoding:NSUTF8StringEncoding];
    // 转换字典
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@" data analysis = %@", dictionary);
    
    return dictionary;
}


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
+ (NSDictionary *)swpEncryptToolsEncryptParams:(NSDictionary *)dictionary encryptedKey:(NSString *)encryptedKey interceptRange:(NSRange)interceptRange {
    
    //  创建返回字典
    NSMutableDictionary* returnDict = [[NSMutableDictionary alloc]init];
    [dictionary enumerateKeysAndObjectsUsingBlock:^(NSString *  _Nonnull key, NSString * _Nonnull obj, BOOL * _Nonnull stop) {
        
        //  传入字典自检 查询字典中的key和Obj是否有空值
        if (key == nil || obj == nil) {
            NSAssert(nil, @"Encryption dictionary is empty");
            *stop = YES;
        }
        
        
        //  app_key 需要先进行MD5加密
        if (![key isEqualToString:encryptedKey]) {
            
            //  对所有key和obj 进行加密
            NSString *baseObj   = [obj base64EncodedString];
            [returnDict setObject:baseObj forKey:key];
            
        } else {
            NSString *encryptionString = [[self class] swpDataDisposeEncryption:obj interceptRange:interceptRange];
            [returnDict setObject:encryptionString forKey:key];
        }
    }];
    return returnDict;
}

/**!
 *  @author swp_song
 *
 *  @brief  swpEncryptToolsMD5: ( 字符串 MD5 加密 )
 *
 *  @param  string  string
 *
 *  @return NSString
 */
+ (NSString *)swpEncryptToolsMD5:(NSString *)string {
    const    char *cStr = [string UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    NSMutableString *encryptString = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    for (int i=0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [encryptString appendFormat:@"%02x",result[i]];
    }
    return encryptString.copy;
}


#pragma mark -
/**!
 *  @author swp_song
 *
 *  @brief  swpDataDisposeEncryption:interceptRange:    ( 参数加密方法, <  第一次 MD5 加密, 第二次截取固定范围 MD5 加密, Base64 返回 > )
 *
 *  @param  encryptionString    encryptionString
 *
 *  @param  interceptRange      interceptRange
 *
 *  @return NSString
 */
+ (NSString *)swpDataDisposeEncryption:(NSString *)encryptionString interceptRange:(NSRange)interceptRange {
    
    //  第一次加密
    NSString *firstEncryptionString     = [[self class] swpEncryptToolsFirstEncryption:encryptionString];
    
    //  第二次加密
    NSString *theSecondEncryptionString = [[self class] swpEncryptToolsFirstTheSecondEncryption:firstEncryptionString interceptRange:interceptRange];
    
    //  Base64 返回
    return [theSecondEncryptionString base64EncodedString];
}

/**!
 *  @author swp_song
 *
 *  @brief  swpEncryptToolsFirstEncryption: ( 第一次加密, 字符串 MD5 加密 )
 *
 *  @param  encryptionString    encryptionString
 *
 *  @return NSString
 */
+ (NSString *)swpEncryptToolsFirstEncryption:(NSString *)encryptionString {
    return [[self class] swpEncryptToolsMD5LowercaseString:encryptionString];
}

/**!
 *  @author swp_song
 *
 *  @brief  swpEncryptToolsFirstTheSecondEncryption:interceptRange: ( 第二次加密, 截取字符串长度 MD5 加密 )
 *
 *  @param  encryptionString    encryptionString
 *
 *  @param  interceptRange      interceptRange
 *
 *  @return NSString
 */
+ (NSString *)swpEncryptToolsFirstTheSecondEncryption:(NSString *)encryptionString interceptRange:(NSRange)interceptRange {
    return [[self class] swpEncryptToolsMD5LowercaseString:[encryptionString substringWithRange:interceptRange.location == interceptRange.length ? NSMakeRange(0, 10) : interceptRange]];
}

/**!
 *  @author swp_song
 *
 *  @brief  swpDataEncryptMD5LowercaseString:   ( 字符串中每个字母进行 MD5 转换成小写 )
 *
 *  @param  string      string
 *
 *  @return NSString
 */
+ (NSString *)swpEncryptToolsMD5LowercaseString:(NSString *)string {
    return [self.class swpEncryptToolsMD5:string].lowercaseString;
}


/**!
 *  @author swp_song
 *
 *  @brief  logMessage: ( 打印数据 )
 *
 *  @param  message message
 */
+ (void)logMessage:(NSString *)message {
#if DEBUG
    NSLog(@"%@", message);
#else
    
#endif
}

@end
