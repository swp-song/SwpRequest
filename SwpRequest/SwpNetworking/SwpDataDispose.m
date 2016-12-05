//
//  SwpDataDispose.m
//  swp_song
//
//  Created by swp_song on 16/5/17.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "SwpDataDispose.h"

/*! ---------------------- Tool       ---------------------- !*/
#import <Base64nl/Base64.h>             // Base64 加密
#import <CommonCrypto/CommonDigest.h>   // MD5    加密
/*! ---------------------- Tool       ---------------------- !*/

@implementation SwpDataDispose

#pragma mark - Request Dispose Methods

/**!
 *  @ author swp_song
 *
 *  @ brief  swpDataRequestDecryptDispose:responseObject:isBase64:   ( 返回 数据 解密 处理 )
 *
 *  @ param  responseObject
 *
 *  @ param  base64
 *
 *  @ return NSDictionary
 */
+ (NSDictionary *)swpDataRequestDecryptDispose:(id)responseObject isBase64:(BOOL)base64 {
    
    // 转换成 字符串
    NSString *decodeJson = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
    NSLog(@"responseJson === > %@", decodeJson);
    decodeJson           = base64 ? [decodeJson base64DecodedString] : decodeJson;
    
    if (!decodeJson) {
        NSLog(@"responseObject ===> %@", decodeJson);
        return nil;
    }
    
    NSLog(@"responseObject ===> %@", decodeJson);
    
    // 字符串转成流
    NSData       *data = [decodeJson dataUsingEncoding:NSUTF8StringEncoding];
    // 转换字典
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    return dictionary;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpDataEncryptParams:encryptedKey:  ( 字典 加密 )
 *
 *  @ param  dictionary
 *
 *  @ param  encryptedKey
 *
 *  @ return
 */
+ (NSDictionary *)swpDataEncryptParams:(NSDictionary *)dictionary encryptedKey:(NSString *)encryptedKey{
    
    //创建返回字典
    NSMutableDictionary* returnDict = [[NSMutableDictionary alloc]init];
    [dictionary enumerateKeysAndObjectsUsingBlock:^(NSString *  _Nonnull key, NSString * _Nonnull obj, BOOL * _Nonnull stop) {
        
        //传入字典自检 查询字典中的key和Obj是否有空值
        if (key == nil || obj == nil) {
            NSAssert(nil, @"Encryption dictionary is empty");
            *stop = YES;
        }
        //app_key 需要先进行MD5加密
        if (![key isEqualToString:encryptedKey]) {
            //对所有key和obj 进行加密
            NSString *baseObj   = [obj base64EncodedString];
            [returnDict setObject:baseObj forKey:key];
        } else {
            //地址先MD5在Base64加密
            NSString *md5String = [SwpDataDispose swpDataEncryptWithMD5:obj];
            NSString *baseObj   = [md5String base64EncodedString];
            [returnDict setObject:baseObj forKey:key];
        }
    }];
    return returnDict;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpDataEncryptWithMD5:  ( MD5 加密 第一次加密  < 原理，app_key 整体加密，加密完毕之后，截取钱10位，在进行加密 >)
 *
 *  @ param  inputStr
 *
 *  @ return swpDataEncryptWithMD5
 */
+ (NSString *)swpDataEncryptWithMD5:(NSString *)inputStr {
    const    char *cStr = [inputStr UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    NSMutableString *str=[NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    for (int i=0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [str appendFormat:@"%02X",result[i]];
    }
    return [SwpDataDispose swpDataEncryptAgaincStr:[str lowercaseString]];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpDataEncryptAgaincStr:    ( 第二次取前十位进行加密 )
 *
 *  @ param  inputStr
 *
 *  @ return NSString
 */
+ (NSString *)swpDataEncryptAgaincStr:(NSString *)inputStr {
    NSString *sstr      = [inputStr substringToIndex:10];
    const    char *cStr = [sstr UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    NSMutableString * mstr=[NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    for (int i=0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [mstr appendFormat:@"%02x",result[i]];
    }
    return [mstr lowercaseString];
}

@end
