//
//  SwpBase64.h
//  swp_song
//
//  Created by swp_song on 2017/8/18.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface SwpBase64 : NSObject

/**
 *  @author swp_song
 *
 *  @brief  swpBase64EncodedString: ( Base64 Encoded )
 *
 *  @param  string  string
 *
 *  @return NSString
 */
+ (NSString *)swpBase64EncodedString:(NSString *)string;

/**
 *  @author swp_song
 *
 *  @brief  swpBase64DecodedString: ( Base64 Decoded )
 *
 *  @param  string  string
 *
 *  @return NSString
 */
+ (NSString *)swpBase64DecodedString:(NSString *)string;

@end
NS_ASSUME_NONNULL_END
