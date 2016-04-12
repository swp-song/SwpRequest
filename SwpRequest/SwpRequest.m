//
//  SwpRequest.m
//  swp_song
//
//  Created by swp_song on 15/12/11.
//  Copyright © 2015年 swp_song. All rights reserved.
//
//  @author             --->    swp_song
//
//  @modification Time  --->    2016-04-12 10:28:11
//
//  @warning            --->    !!! < AFNetworking 二次封装 使用时 需要导入 AFNetworking 网路库  > !!!

#import "SwpRequest.h"

/*! ---------------------- Tool       ---------------------- !*/
#import <Base64nl/Base64.h>             // Base64 加密
#import <CommonCrypto/CommonDigest.h>   // MD5    加密
/*! ---------------------- Tool       ---------------------- !*/

@interface SwpRequest ()

#pragma mark - Networking Property

/*! AFHTTPSessionManager 网络请求管理者对象    !*/
@property (nonatomic, strong) AFHTTPSessionManager *swpSessionManager;
/*! 加密 appKey => key                         !*/
@property (nonatomic, copy  ) NSString             *swpRequestAppKey;
/*! 加密 appKey => value ( 加密之后的value )   !*/
@property (nonatomic, copy, readonly) NSString *swpResultAppKeyEncryptedValue;

@end

@implementation SwpRequest

#pragma mark - Init SwpRequest Method
/*!
 *  @author swp_song
 *
 *  @brief  shareInstance   ( 单利 快速初始化一个 SwpRequest )
 *
 *  @return SwpRequest
 */
+ (instancetype)shareInstance {
    static SwpRequest *swpRequest = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate,^{
        swpRequest = [[self alloc] init];
    });
    return swpRequest;
}

/*!
 *  @author swp_song
 *
 *  @brief  init    ( Override init )
 *
 *  @return SwpRequest
 */
- (instancetype)init {
    
    if (self = [super init]) {
        _swpRequestAppKey              = @"app_key";
        _swpResultAppKeyEncryptedValue = @"";
    }
    return self;
}

#pragma mark - SwpRequest Tool Methods
/*!
 *  @author swp_song
 *
 *  @brief  swpPOST:parameters:isEncrypt:swpResultSuccess:swpResultError:   ( 请求网络获取数据 <POST> )
 *
 *  @param  URLString                       请求的 url
 *
 *  @param  parameters                      请求 需要传递的参数
 *
 *  @param  encrypt                         请求 是否 对参数加密 (YES 加密 / NO 不加密)
 *
 *  @param  swpResultSuccess                请求服务器成功
 *
 *  @param  swpResultError                  请求服务器失败
 */
+ (void)swpPOST:(NSString *)URLString parameters:(NSDictionary *)parameters isEncrypt:(BOOL)encrypt swpResultSuccess:(SwpResultSuccessHandle)swpResultSuccess swpResultError:(SwpResultErrorHandle)swpResultError {
    // 初始化自定义网络请求类
    SwpRequest *swpRequest               = [SwpRequest shareInstance];
    
    // 字典加密
    NSDictionary         *dictionary     = encrypt ? [swpRequest encryptedParams:parameters] : parameters;
    // 返回结果集
    __block NSDictionary *resultObject   = [NSDictionary dictionary];
    
    // 显示 状态栏 请求数据的菊花
    [swpRequest settingNetworkPicture:YES];
    
    // 发起请求
    [swpRequest.swpSessionManager POST:URLString parameters:dictionary progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        resultObject = [swpRequest requestDispose:responseObject isBase64:encrypt];
        swpResultSuccess(task, resultObject);
        [swpRequest settingNetworkPicture:NO];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        swpResultError(task, error, [swpRequest swpGetErrorMessage:error]);
        [swpRequest settingNetworkPicture:NO];
    }];
    
}

/*!
 *  @author swp_song
 *
 *  @brief  swpPOSTAddFile:parameters:isEncrypt:fileName:fileData:swpResultSuccess:swpResultError:   ( 请求网络获上传文件 单文件上传 <POST> )
 *
 *  @param  URLString                       请求的 url
 *
 *  @param  parameters                      请求 需要传递的参数
 *
 *  @param  encrypt                         请求 是否 对参数加密 (YES 加密 / NO 不加密)
 *
 *  @param  fileName                        请求 上传文件的名称 (和后台一致)
 *
 *  @param  fileData                        请求 上传文件的数据流
 *
 *  @param  swpResultSuccess                请求服务器成功
 *
 *  @param  swpResultError                  请求服务器失败
 */
+ (void)swpPOSTAddFile:(NSString *)URLString parameters:(NSDictionary *)parameters isEncrypt:(BOOL)encrypt fileName:(NSString *)fileName fileData:(NSData *)fileData swpResultSuccess:(SwpResultSuccessHandle)swpResultSuccess swpResultError:(SwpResultErrorHandle)swpResultError {
    
    // 初始化自定义网络请求类
    SwpRequest *swpRequest               = [SwpRequest shareInstance];
    
    // 字典加密
    NSDictionary         *dictionary     = encrypt ? [swpRequest encryptedParams:parameters] : parameters;
    // 返回结果集
    __block NSDictionary *resultObject   = [NSDictionary dictionary];
    
    // 显示 状态栏 请求数据的菊花
    [swpRequest settingNetworkPicture:YES];
    
    // 发起请求
    [swpRequest.swpSessionManager POST:URLString parameters:dictionary constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:fileData name:fileName fileName:@"picture.png" mimeType:@"image/png"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        resultObject = [swpRequest requestDispose:responseObject isBase64:encrypt];
        swpResultSuccess(task, resultObject);
        [swpRequest settingNetworkPicture:NO];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        swpResultError(task, error, [swpRequest swpGetErrorMessage:error]);
        [swpRequest settingNetworkPicture:NO];
    }];
}

/*!
 *  @author swp_song
 *
 *  @brief  swpPOSTAddFiles:parameters:isEncrypt:fileName:fileDatas:swpResultSuccess:swpResultError:    ( 请求网络获上传文件 多文件上传, 文件名称相同使用该方法 <POST> )
 *
 *  @param  URLString                       请求的 url
 *
 *  @param  parameters                      请求 需要传递的参数
 *
 *  @param  encrypt                         请求 是否 对参数加密 (YES 加密 / NO 不加密)
 *
 *  @param  fileName                        请求 上传文件的名称 (和后台一致)
 *
 *  @param  fileDatas                       请求 上传文件的流数组
 *
 *  @param  swpResultSuccess                请求服务器成功
 *
 *  @param  swpResultError                  请求服务器失败
 */
+ (void)swpPOSTAddFiles:(NSString *)URLString parameters:(NSDictionary *)parameters isEncrypt:(BOOL)encrypt fileName:(NSString *)fileName fileDatas:(NSArray *)fileDatas swpResultSuccess:(SwpResultSuccessHandle)swpResultSuccess swpResultError:(SwpResultErrorHandle)swpResultError {
    
    // 初始化自定义网络请求类
    SwpRequest *swpRequest               = [SwpRequest shareInstance];
    
    // 字典加密
    NSDictionary         *dictionary     = encrypt ? [swpRequest encryptedParams:parameters] : parameters;
    // 返回结果集
    __block NSDictionary *resultObject   = [NSDictionary dictionary];
    
    // 显示 状态栏 请求数据的菊花
    [swpRequest settingNetworkPicture:YES];
    
    // 发起请求
    [swpRequest.swpSessionManager POST:URLString parameters:dictionary constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
      
        for (int i=0; i<fileDatas.count; i++) {
            NSString *imageName = [NSString stringWithFormat:@"%@[%i]", fileName, i];
            [formData appendPartWithFileData:fileDatas[i] name:imageName fileName:imageName mimeType:@"image/png"];
        }

    } progress:^(NSProgress * _Nonnull uploadProgress) {
    
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        resultObject = [swpRequest requestDispose:responseObject isBase64:encrypt];
        swpResultSuccess(task, resultObject);
        [swpRequest settingNetworkPicture:NO];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        swpResultError(task, error, [swpRequest swpGetErrorMessage:error]);
        [swpRequest settingNetworkPicture:NO];
    }];
    
}

/*!
 *  @author swp_song
 *
 *  @brief  swpPOSTAddWithFiles:parameters:isEncrypt:fileNames:fileDatas:swpResultSuccess:swpResultError:   ( 请求网络获上传文件 多文件上传, 文件名称不相同相同使用该方法  <POST> )
 *
 *  @param  URLString                       请求的 url
 *
 *  @param  parameters                      请求 需要传递的参数
 *
 *  @param  encrypt                         请求 是否 对参数加密 (YES 加密 / NO 不加密)
 *
 *  @param  fileNames                       请求 上传文件的名称数组 (和后台一致)
 *
 *  @param  fileDatas                       请求 上传文件的流数组
 *
 *  @param  swpResultSuccess                请求服务器成功
 *
 *  @param  swpResultError                  请求服务器失败
 */
+ (void)swpPOSTAddWithFiles:(NSString *)URLString parameters:(NSDictionary *)parameters isEncrypt:(BOOL)encrypt fileNames:(NSArray *)fileNames fileDatas:(NSArray *)fileDatas swpResultSuccess:(SwpResultSuccessHandle)swpResultSuccess swpResultError:(SwpResultErrorHandle)swpResultError {
    
    // 初始化自定义网络请求类
    SwpRequest *swpRequest               = [SwpRequest shareInstance];
    
    // 字典加密
    NSDictionary         *dictionary     = encrypt ? [swpRequest encryptedParams:parameters] : parameters;
    // 返回结果集
    __block NSDictionary *resultObject   = [NSDictionary dictionary];
    
    // 显示 状态栏 请求数据的菊花
    [swpRequest settingNetworkPicture:YES];
    
    // 发起请求
    [swpRequest.swpSessionManager POST:URLString parameters:dictionary constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (int i=0; i<fileDatas.count; i++) {
            [formData appendPartWithFileData:fileDatas[i] name:fileNames[i] fileName:fileNames[i] mimeType:@"image/png"];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        resultObject = [swpRequest requestDispose:responseObject isBase64:encrypt];
        swpResultSuccess(task, resultObject);
        [swpRequest settingNetworkPicture:NO];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        swpResultError(task, error, [swpRequest swpGetErrorMessage:error]);
        [swpRequest settingNetworkPicture:NO];
    }];
}

/*!
 *  @author swp_song
 *
 *  @brief  swpRequestAFNetworkingTest:parametersisEncrypt:  ( AFNetworking 测试方法 )
 *
 *  @param  URLString                   请求的 url
 *
 *  @param  parameters                  请求 需要传递的参数
 *
 *  @param  encrypt                     请求 是否 对参数加密 (YES 加密 / NO 不加密)
 */
+ (void)swpRequestAFNetworkingTest:(NSString *)URLString parameters:(NSDictionary *)parameters isEncrypt:(BOOL)encrypt {
    NSLog(@"This is AFNetworking Test Method");
}

/*!
 *  @author swp_song
 *
 *  @brief  swpRequestReachabilityStatusChangeBlock:    ( 验证 网路 环境 )
 *
 *  @param  swpResultStatus
 */
+ (void)swpRequestReachabilityStatusChangeBlock:(void(^)(SwpResultReachabilityStatus swpResultStatus))swpResultStatus {
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                // 回调处理
                NSLog(@"AFNetworkReachabilityStatusUnknown");
                swpResultStatus(SwpResultReachabilityStatusUnknown);
                break;
            case AFNetworkReachabilityStatusNotReachable:
                // 回调处理
                NSLog(@"AFNetworkReachabilityStatusNotReachable");
                swpResultStatus(SwpResultReachabilityStatusNotReachable);
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                // 回调处理
                NSLog(@"AFNetworkReachabilityStatusReachableViaWWAN");
                swpResultStatus(SwpResultReachabilityStatusReachableViaWWAN);
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                // 回调处理
                NSLog(@"AFNetworkReachabilityStatusReachableViaWiFi");
                swpResultStatus(SwpResultReachabilityStatusReachableViaWiFi);
                break;
            default:
                break;
        }
    }];
}

#pragma makr - SwpRequest Public Tool Methods
/*!
 *  @author swp_song
 *
 *  @brief  getSwpResultAppKeyEncryptedValue    ( 取出 加密 app_key Value )
 *
 *  @return NSString
 */
+ (NSString *)swpResultGetAppKeyEncryptedValue {
    return [SwpRequest shareInstance].swpResultAppKeyEncryptedValue;
}

/*!
 *  @author swp_song
 *
 *  @brief  setSwpRequestAppKey:    ( 设置 appKey, 加密 key )
 *
 *  @param  swpRequestAppKey
 */
+ (void)swpRequestSetAppKey:(NSString *)swpRequestAppKey {
    [[SwpRequest shareInstance] setSwpRequestAppKey:swpRequestAppKey];
}

/*!
 *  @author swp_song
 *
 *  @brief  swpRequestEncryptedParams:  ( 参数加密 )
 *
 *  @param  dictionary
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)swpRequestEncryptedParams:(NSDictionary *)dictionary {
   return [[SwpRequest shareInstance] encryptedParams:dictionary];
}

/*!
 *  @author swp_song
 *
 *  @brief  swpRequestYouZhiPrintDataInformation: ( 打印 YouZhi 结果集, 该方法 是打印返回 结果集 )
 *
 *  @param  dictionary
 */
+ (void)swpRequestYouZhiPrintDataInformation:(NSDictionary *)dictionary {
    if (dictionary == nil) return;
    NSLog(@"dict    : ===> %@",  dictionary);
    NSLog(@"code    : ===> %@",  [dictionary objectForKey:@"code"]);
    NSLog(@"message : ===> %@",  [dictionary objectForKey:@"message"]);
    NSLog(@"obj     : ===> %@",  [dictionary objectForKey:@"obj"]);
}


#pragma mark - POST Parameters Encrypt Methods
/*!
 *  @author swp_song, 2015-12-11 16:56:43
 *
 *  @brief  encryptedParamsWithDict     ( 对字典 进行加密 返回 加密之后的字典 )
 *
 *  @param  dict
 *
 *  @return NSDictionary
 */
- (NSDictionary *)encryptedParams:(NSDictionary *)dictionary {
    
    //创建返回字典
    NSMutableDictionary* returnDict = [[NSMutableDictionary alloc]init];
    [dictionary enumerateKeysAndObjectsUsingBlock:^(NSString *  _Nonnull key, NSString * _Nonnull obj, BOOL * _Nonnull stop) {
        
        //传入字典自检 查询字典中的key和Obj是否有空值
        if (key == nil || obj == nil) {
            NSAssert(nil, @"Encryption dictionary is empty");
            *stop = YES;
        }
        
        //app_key 需要先进行MD5加密
        if (![key isEqualToString:self.swpRequestAppKey]) {
            //对所有key和obj 进行加密
            NSString *baseObj   = [obj base64EncodedString];
            [returnDict setObject:baseObj forKey:key];
        } else {
            //地址先MD5在Base64加密
            NSString *md5String            = [self encryptedWithMD5:obj];
            NSString *baseObj              = [md5String base64EncodedString];
            _swpResultAppKeyEncryptedValue = baseObj;
            [returnDict setObject:_swpResultAppKeyEncryptedValue forKey:key];
        }

    }];
    return returnDict;
}

/*!
 *  @author swp_song, 2015-12-11 16:57:20
 *
 *  @brief  encryptedWithMD5        ( MD5 加密 第一次加密  < 原理，app_key 整体加密，加密完毕之后，截取钱10位，在进行加密 >)
 *
 *  @param  inputStr
 *
 *  @return NSString
 */
- (NSString *)encryptedWithMD5:(NSString *)inputStr {
    const    char *cStr = [inputStr UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    NSMutableString *str=[NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    for (int i=0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [str appendFormat:@"%02X",result[i]];
    }
    return [self againcStr:[str lowercaseString]];
}

/*!
 *  @author swp_song
 *
 *  @brief  againcStr   ( 第二次取前十位进行加密 )
 *
 *  @param  inputStr
 *
 *  @return NSString
 */
- (NSString *)againcStr:(NSString *)inputStr {
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

/*!
 *  @author swp_song, 2015-12-11 16:59:57
 *
 *  @brief  settingNetworkPicture   ( 显示 或隐藏 网络获取数据时 UINavigationBar 上的图标(转圈的菊花) )
 *
 *  @param  isShow                  networkActivityIndicatorVisible YES 显示，NO 隐藏
 */
- (void)settingNetworkPicture:(BOOL)isShow {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = isShow;
}

#pragma mark - Request Dispose Methods
/*!
 *  @author swp_song
 *
 *  @brief  requestDispose      ( 返回 网络 结果集 处理 )
 *
 *  @param  responseObject
 *
 *  @param  base64              是否base64加密
 *
 *  @return NSDictionary
 */
- (NSDictionary *)requestDispose:(id)responseObject isBase64:(BOOL)base64 {
    
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

/*!
 *  @author swp_song
 *
 *  @brief  getErrorMessage:    ( 获取 错误信息 )
 *
 *  @param  error
 *
 *  @return NSString
 */
- (NSString *)swpGetErrorMessage:(NSError *)error {
    return error == nil ? nil : [NSString stringWithFormat:@"错误代码%ld \n 错误信息%@", (long)error.code, error.localizedDescription];
}

/*!
 *  @author swp_song
 *
 *  @brief  setSwpRequestAppKey:    ( Override Setter swpRequestAppKey )
 *
 *  @param  swpRequestAppKey
 */
- (void)setSwpRequestAppKey:(NSString *)swpRequestAppKey {
    _swpRequestAppKey = swpRequestAppKey;
}


#pragma Init AFHTTPSessionManager Methods
- (AFHTTPSessionManager *)swpSessionManager {
    
    if (!_swpSessionManager) {
        _swpSessionManager                    = [AFHTTPSessionManager manager];
        _swpSessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
        [_swpSessionManager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/html", @"text/css", @"text/javascript", nil]];
    }
    return _swpSessionManager;
}


@end
