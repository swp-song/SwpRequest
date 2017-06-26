//
//  SwpBaseRequest.m
//  swp_song
//
//  Created by swp_song on 2017/6/24.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpBaseRequest.h"

/*! ---------------------- Tool       ---------------------- !*/
#import "SwpRequestTools.h"
/*! ---------------------- Tool       ---------------------- !*/


@interface SwpBaseRequest ()

#pragma mark - Data Propertys
/*! ---------------------- Data Property  ---------------------- !*/
/*! ---------------------- Data Property  ---------------------- !*/

@end

@implementation SwpBaseRequest

static id _swpBaseRequest;

#pragma mark - Override Methods
/**!
 *  @author swp_song
 *
 *  @brief  allocWithZone: ( Override  allocWithZone )
 *
 *  @param  zone    zone
 *
 *  @return id  SwpBaseRequest
 */
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _swpBaseRequest = [super allocWithZone:zone];
    });
    return _swpBaseRequest;
}

/**!
 *  @author swp_song
 *
 *  @brief  copyWithZone:  ( Override  copyWithZone )
 *
 *  @param  zone    zone
 *
 *  @return id
 */
- (id)copyWithZone:(NSZone *)zone {
    return  _swpBaseRequest;
}


/**!
 *  @author swp_song
 *
 *  @brief  copyWithZone:  ( Override  copyWithZone )
 *
 *  @param  zone    zone
 *
 *  @return id
 */
+ (id)copyWithZone:(struct _NSZone *)zone {
    return  _swpBaseRequest;
}

/**!
 *  @author swp_song
 *
 *  @brief  mutableCopyWithZone:   ( Override  mutableCopyWithZone )
 *
 *  @param  zone    zone
 *
 *  @return id
 */
+ (id)mutableCopyWithZone:(struct _NSZone *)zone {
    return _swpBaseRequest;
}

/**!
 *  @author swp_song
 *
 *  @brief  mutableCopyWithZone: ( Override  mutableCopyWithZone )
 *
 *  @param  zone    zone
 *
 *  @return id
 */
- (id)mutableCopyWithZone:(NSZone *)zone {
    return _swpBaseRequest;
}


/**!
 *  @author swp_song
 *
 *  @brief  init    ( Override init )
 *
 *  @return id
 */
- (instancetype)init {
    
    if (self = [super init]) {
        
    }
    return self;
}

#pragma mark - Public Methods
/**!
 *  @author swp_song
 *
 *  @brief  shareInstance   ( 单利快速初始 )
 *
 *  @return id
 */
+ (instancetype)shareInstance {
    
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        _swpBaseRequest = [[self alloc] init];
    });
    return _swpBaseRequest;
}


@end
