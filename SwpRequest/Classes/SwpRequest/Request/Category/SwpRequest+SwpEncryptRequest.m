//
//  SwpRequest+SwpEncryptRequest.m
//  SwpRequestDemo
//
//  Created by swp_song on 2017/6/23.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpRequest+SwpEncryptRequest.h"


/*! ---------------------- Tool       ---------------------- !*/
#import <objc/message.h>
#import "SwpEncryptTools.h"
/*! ---------------------- Tool       ---------------------- !*/

static const char kSwpEncryptRangeKey;
static const char kSwpEncryptRequestAppKey;
static const char kSwpEncryptResultAppKeyValueKey;

@interface SwpRequest ()

#pragma mark - Data Propertys
/*! ---------------------- Data Property  ---------------------- !*/
/*! 加密位数 !*/
@property (nonatomic, assign, readonly) NSRange swpEncryptRange;
/*! 加密 appKey => key    !*/
@property (nonatomic, copy  , readonly) NSString *swpEncryptRequestAppKey;
/*! 加密 appKey => value ( 加密之后的 value )  !*/
@property (nonatomic, copy  , readonly) NSString *swpEncryptResultAppKeyValue;
/*! ---------------------- Data Property  ---------------------- !*/

@end

@implementation SwpRequest (SwpEncryptRequest)



/**!
 *  @author swp_song
 *
 *  @brief  load    ( Override load )
 */
+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method swpRequestInitMethod         = class_getInstanceMethod(self, @selector(init));
        Method swpEncryptRequestInitMethod  = class_getInstanceMethod(self, @selector(swpEncryptRequestInit));
        method_exchangeImplementations(swpRequestInitMethod, swpEncryptRequestInitMethod);
    });
    
}

#pragma mark - Public Methods

#pragma mark - Set Pproperty Methods

/**!
 *  @author swp_song
 *
 *  @brief  swpEncryptSetRange: ( 设置加密位数, NSRange location 其实位置, length 结束位置 )
 *
 *  @param  swpEncryptRange swpEncryptRange
 *
 *  @return SwpRequest
 */
+ (SwpRequest *)swpEncryptSetRange:(NSRange)swpEncryptRange {
    [SwpRequest shareInstance].swpEncryptRange = swpEncryptRange;
    return [SwpRequest shareInstance];
}

/**!
 *  @author swp_song
 *
 *  @brief  swpEncryptSetRange  ( 设置加密位数, NSRange location 其实位置, length 结束位置 )
 */
+ (SwpRequest * _Nonnull (^)(NSRange))swpEncryptSetRange {
    
    return ^(NSRange swpEncryptRange) {
        return [self.class swpEncryptSetRange:swpEncryptRange];
    };
}

/**!
 *  @author swp_song
 *
 *  @brief  swpEncryptRequestSetAppKey:    ( 设置 appKey, 加密 Key )
 *
 *  @param  swpEncryptRequestAppKey swpEncryptRequestAppKey
 *
 *  @return SwpRequest
 */
+ (instancetype)swpEncryptRequestSetAppKey:(NSString *)swpEncryptRequestAppKey {
    [SwpRequest shareInstance].swpEncryptRequestAppKey = swpEncryptRequestAppKey;
    return [SwpRequest shareInstance];
}

/**!
 *  @author swp_song
 *
 *  @brief  swpEncryptRequestSetAppKey  ( 设置 appKey, 加密 key )
 */
+ (SwpRequest * _Nonnull (^)(NSString * _Nonnull))swpEncryptRequestSetAppKey {
    
    return ^(NSString *swpEncryptRequestAppKey) {
        return [self.class swpEncryptRequestSetAppKey:swpEncryptRequestAppKey];
    };
}

/**!
 *  @author swp_song
 *
 *  @brief  swpEncryptRequestGetAppKey  ( 获取 appKey )
 *
 *  @return NSString
 */
+ (NSString *)swpEncryptRequestGetAppKey {
    return [SwpRequest shareInstance].swpEncryptRequestAppKey;
}

/**!
 *  @author swp_song
 *
 *  @brief  swpEncryptResultGetAppKeyValue  ( 获取加密 appKey Value )
 *
 *  @return NSString
 */
+ (NSString *)swpEncryptResultGetAppKeyValue {
    return [SwpRequest shareInstance].swpEncryptResultAppKeyValue;
}


#pragma mark - Network Requests Methods
/**!
 *  @author swp_song
 *
 *  @brief  swpPOSTEncrypt:encryptParameters:swpResultSuccess:swpResultError:   ( 设置 appKey, 加密 key )
 *
 *  @param  URLString           URLString
 *
 *  @param  parameters          parameters
 *
 *  @param  swpResultSuccess    swpResultSuccess
 *
 *  @param  swpResultError      swpResultError
 *
 *  @return SwpRequest
 */
+ (instancetype)swpPOST:(NSString *)URLString encryptParameters:(NSDictionary *)parameters swpResultSuccess:(SwpResultSuccessHandle)swpResultSuccess swpResultError:(SwpResultErrorHandle)swpResultError {
    return [self.class swpPOST_:URLString encryptParameters_:parameters uploadFileStatus_:SwpResultDoNotFileUpload fileNames_:nil fileDatas_:nil swpResultSuccess_:swpResultSuccess swpResultError_:swpResultError];
}

/**!
 *  @author swp_song
 *
 *  @brief  swpPOSTUploadFile:encryptParameters:fileName:fileData:swpResultSuccess:swpResultError:  ( 请求网络获上传文件, 单文件上传 <POST> )
 *
 *  @param  URLString           URLString
 *
 *  @param  parameters          parameters
 *
 *  @param  fileName            fileName
 *
 *  @param  fileData            fileData
 *
 *  @param  swpResultSuccess    swpResultSuccess
 *
 *  @param  swpResultError      swpResultError
 *
 *  @return SwpRequest
 */
+ (instancetype)swpPOSTUploadFile:(NSString *)URLString encryptParameters:(NSDictionary *)parameters fileName:(NSString *)fileName fileData:(NSData *)fileData swpResultSuccess:(SwpResultSuccessHandle)swpResultSuccess swpResultError:(SwpResultErrorHandle)swpResultError {
    
    return [self.class swpPOST_:URLString encryptParameters_:parameters uploadFileStatus_:SwpResultSingleFileUpload fileNames_:fileName fileDatas_:fileData swpResultSuccess_:swpResultSuccess swpResultError_:swpResultError];
}


/**!
 *  @author swp_song
 *
 *  @brief  swpPOSTUploadFiles:encryptParameters:fileName:fileDatas:swpResultSuccess:swpResultError:    ( 请求网络获上传文件, 多文件上传, 文件名称相同使用该方法 <POST> )
 *
 *  @param  URLString           URLString
 *
 *  @param  parameters          parameters
 *
 *  @param  fileName            fileName
 *
 *  @param  fileDatas           fileDatas
 *
 *  @param  swpResultSuccess    swpResultSuccess
 *
 *  @param  swpResultError      swpResultError
 *
 *  @return SwpRequest
 */
+ (instancetype)swpPOSTUploadFiles:(NSString *)URLString encryptParameters:(NSDictionary *)parameters fileName:(NSString *)fileName fileDatas:(NSArray *)fileDatas swpResultSuccess:(SwpResultSuccessHandle)swpResultSuccess swpResultError:(SwpResultErrorHandle)swpResultError {
    return [self.class swpPOST_:URLString encryptParameters_:parameters uploadFileStatus_:SwpResultMultiplePicturesUpload fileNames_:fileName fileDatas_:fileDatas swpResultSuccess_:swpResultSuccess swpResultError_:swpResultError];
}

/**!
 *  @author swp_song
 *
 *  @brief  swpPOSTUploadFiles:encryptParameters:fileNames:fileDatas:swpResultSuccess:swpResultError:   ( 请求网络获上传文件, 多文件上传, 文件名称不相同相同使用该方法  <POST> )
 *
 *  @param  URLString           URLString
 *
 *  @param  parameters          parameters
 *
 *  @param  fileNames           fileNames
 *
 *  @param  fileDatas           fileDatas
 *
 *  @param  swpResultSuccess    swpResultSuccess
 *
 *  @param  swpResultError      swpResultError
 *
 *  @return SwpRequest
 */
+ (instancetype)swpPOSTUploadFiles:(NSString *)URLString encryptParameters:(NSDictionary *)parameters fileNames:(NSArray *)fileNames fileDatas:(NSArray *)fileDatas swpResultSuccess:(SwpResultSuccessHandle)swpResultSuccess swpResultError:(SwpResultErrorHandle)swpResultError {
    
    return [self.class swpPOST_:URLString encryptParameters_:parameters uploadFileStatus_:SwpResultMultiplePicturesUpload fileNames_:fileNames fileDatas_:fileDatas swpResultSuccess_:swpResultSuccess swpResultError_:swpResultError];
}




#pragma mark - Private Methods
/**!
 *  @author swp_song
 *
 *  @brief  swpPOST_:encryptParameters_:uploadFileStatus_:fileNames_:fileDatas_:swpResultSuccess_:swpResultError_:  ( 发起请求 )
 *
 *  @param  URLString           URLString
 *
 *  @param  parameters          parameters
 *
 *  @param  uploadFileStatus    uploadFileStatus
 *
 *  @param  fileNames           fileNames
 *
 *  @param  fileDatas           fileDatas
 *
 *  @param  swpResultSuccess    swpResultSuccess
 *
 *  @param  swpResultError      swpResultError
 *
 *  @return SwpRequest
 */
+ (instancetype)swpPOST_:(NSString *)URLString encryptParameters_:(NSDictionary *)parameters uploadFileStatus_:(SwpResultUploadFileStatus)uploadFileStatus fileNames_:(id)fileNames fileDatas_:(id)fileDatas swpResultSuccess_:(SwpResultSuccessHandle)swpResultSuccess swpResultError_:(SwpResultErrorHandle)swpResultError {
    
    NSDictionary *dictionary = [SwpEncryptTools  swpEncryptToolsEncryptParams:parameters encryptedKey:[SwpRequest shareInstance].swpEncryptRequestAppKey interceptRange:[SwpRequest shareInstance].swpEncryptRange];
    
    [[SwpRequest shareInstance] setSwpEncryptResultAppKeyValue:dictionary[[SwpRequest shareInstance].swpEncryptRequestAppKey]];
    
    return [self.class swpPOST:URLString parameters:dictionary uploadFileStatus:uploadFileStatus fileNames:fileNames fileDatas:fileDatas swpResultSuccess:^( NSURLSessionDataTask * _Nonnull task, id  _Nonnull resultObject) {
        
        if (swpResultSuccess) swpResultSuccess(task, [SwpEncryptTools swpEncryptToolsResultDecrypt:resultObject]);
    } swpResultError:swpResultError];
}



/**!
 *  @author swp_song
 *
 *  @brief  swpEncryptRequestInit   ( 交换初始化方法 )
 *
 *  @return SwpRequest
 */
- (instancetype)swpEncryptRequestInit {
    
    self.swpEncryptRequestAppKey     = @"app_key";
    self.swpEncryptRange             = NSMakeRange(0, 10);;
    self.swpEncryptResultAppKeyValue = @"";
    return [self swpEncryptRequestInit];
}


#pragma mark - Property Setter Getter Methods

/**!
 *  @author swp_song
 *
 *  @brief  setSwpEncryptRange: ( Override Setter SwpEncryptRange )
 *
 *  @param  swpEncryptRange swpEncryptRange
 */
- (void)setSwpEncryptRange:(NSRange)swpEncryptRange {
    objc_setAssociatedObject(self, &kSwpEncryptRangeKey, [NSValue valueWithRange:swpEncryptRange], OBJC_ASSOCIATION_COPY);
}

/**!
 *  @author swp_song
 *
 *  @brief  swpEncryptRange ( Override Getter SwpEncryptRange )
 *
 *  @return NSRange
 */
- (NSRange)swpEncryptRange {
    return [objc_getAssociatedObject(self, &kSwpEncryptRangeKey) rangeValue];
}

/**!
 *  @author swp_song
 *
 *  @brief  setSwpEncryptRequestAppKey: ( Override Setter SwpEncryptRequestAppKey )
 *
 *  @param  swpEncryptRequestAppKey swpEncryptRequestAppKey
 */
- (void)setSwpEncryptRequestAppKey:(NSString *)swpEncryptRequestAppKey {
    objc_setAssociatedObject(self, &kSwpEncryptRequestAppKey, swpEncryptRequestAppKey, OBJC_ASSOCIATION_COPY);
}

/**!
 *  @author swp_song
 *
 *  @brief  swpEncryptRequestAppKey ( Override Getter SwpEncryptRequestAppKey )
 *
 *  @return NSString
 */
- (NSString *)swpEncryptRequestAppKey {
    return [NSString stringWithFormat:@"%@", objc_getAssociatedObject(self, &kSwpEncryptRequestAppKey)];
}


/**!
 *  @author swp_song
 *
 *  @brief  setSwpEncryptResultAppKeyValue: ( Override Setter SwpEncryptResultAppKeyValue )
 *
 *  @param  swpEncryptResultAppKeyValue swpEncryptResultAppKeyValue
 */
- (void)setSwpEncryptResultAppKeyValue:(NSString *)swpEncryptResultAppKeyValue {
    objc_setAssociatedObject(self, &kSwpEncryptResultAppKeyValueKey, swpEncryptResultAppKeyValue, OBJC_ASSOCIATION_COPY);
}

/**!
 *  @author swp_song
 *
 *  @brief  swpEncryptResultAppKeyValue ( Override Getter SwpEncryptResultAppKeyValue )
 *
 *  @return NSString
 */
- (NSString *)swpEncryptResultAppKeyValue {
    return [NSString stringWithFormat:@"%@", objc_getAssociatedObject(self, &kSwpEncryptResultAppKeyValueKey)];
}




@end

