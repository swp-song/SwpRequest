//
//  SwpRequest.m
//  swp_song
//
//  Created by swp_song on 15/12/11.
//  Copyright © 2015年 swp_song. All rights reserved.
//

#import "SwpRequest.h"

/*! ---------------------- Tool       ---------------------- !*/
#import <AFNetworking/AFNetworking.h>       // AFNetworking 网络库
#import "SwpDataDispose.h"                  // 参数 返回值 数据处理
#import "SwpRequestTools.h"                 // 工具
/*! ---------------------- Tool       ---------------------- !*/

@interface SwpRequest ()

#pragma mark - Networking Property

/*! AFHTTPSessionManager 网络请求管理者对象    !*/
@property (nonatomic, strong) AFHTTPSessionManager *swpSessionManager;
/*! 加密 appKey => key                         !*/
@property (nonatomic, copy  ) NSString             *swpRequestAppKey;
/*! 加密 appKey => value ( 加密之后的value )   !*/
@property (nonatomic, copy, readonly) NSString     *swpResultAppKeyEncryptedValue;

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
    dispatch_once(&predicate, ^{
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
+ (instancetype)swpPOST:(NSString *)URLString parameters:(NSDictionary *)parameters isEncrypt:(BOOL)encrypt swpResultSuccess:(SwpResultSuccessHandle)swpResultSuccess swpResultError:(SwpResultErrorHandle)swpResultError {
    // 初始化自定义网络请求类
    
//    SwpRequest           *swpRequest   = [SwpRequest shareInstance];
//    
//    // 字典加密
//    NSDictionary         *dictionary   = encrypt ? [SwpDataDispose swpDataEncryptParams:parameters encryptedKey:swpRequest.swpRequestAppKey] : parameters;
//    // 返回结果集
//    __block NSDictionary *resultObject = [NSDictionary dictionary];
//    
//    // 显示 状态栏 请求数据的菊花
//    [SwpRequestTools swpRequestToolsSetNetworkActivityIndicatorVisible:YES];
//    
//    // 发起请求
//    [swpRequest.swpSessionManager POST:URLString parameters:dictionary progress:^(NSProgress * _Nonnull uploadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        resultObject = [SwpDataDispose swpDataRequestDecryptDispose:responseObject isBase64:encrypt];
//        swpResultSuccess(task, resultObject);
//        [SwpRequestTools swpRequestToolsSetNetworkActivityIndicatorVisible:NO];
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        swpResultError(task, error, [SwpRequestTools swpRequestToolsGetErrorMessage:error]);
//        [SwpRequestTools swpRequestToolsSetNetworkActivityIndicatorVisible:NO];
//    }];
  
    return [[self class] POST:URLString parameters:parameters isEncrypt:encrypt uploadFileStatus:SwpResultDoNotFileUpload fileNames:nil fileDatas:nil swpResultSuccess:swpResultSuccess swpResultError:swpResultError];
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
+ (instancetype)swpPOSTAddFile:(NSString *)URLString parameters:(NSDictionary *)parameters isEncrypt:(BOOL)encrypt fileName:(NSString *)fileName fileData:(NSData *)fileData swpResultSuccess:(SwpResultSuccessHandle)swpResultSuccess swpResultError:(SwpResultErrorHandle)swpResultError {
    
//    // 初始化自定义网络请求类
//    SwpRequest           *swpRequest   = [SwpRequest shareInstance];
//    
//    // 字典加密
//    NSDictionary         *dictionary   = encrypt ? [SwpDataDispose swpDataEncryptParams:parameters encryptedKey:swpRequest.swpRequestAppKey] : parameters;
//    // 返回结果集
//    __block NSDictionary *resultObject = [NSDictionary dictionary];
//    
//    // 显示 状态栏 请求数据的菊花
//    [SwpRequestTools swpRequestToolsSetNetworkActivityIndicatorVisible:YES];
//    
//    // 发起请求
//    [swpRequest.swpSessionManager POST:URLString parameters:dictionary constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//        [formData appendPartWithFileData:fileData name:fileName fileName:@"picture.png" mimeType:@"image/png"];
//    } progress:^(NSProgress * _Nonnull uploadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        resultObject = [SwpDataDispose swpDataRequestDecryptDispose:responseObject isBase64:encrypt];
//        swpResultSuccess(task, resultObject);
//        [SwpRequestTools swpRequestToolsSetNetworkActivityIndicatorVisible:NO];
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        swpResultError(task, error, [SwpRequestTools swpRequestToolsGetErrorMessage:error]);
//        [SwpRequestTools swpRequestToolsSetNetworkActivityIndicatorVisible:NO];
//    }];
    
    return [[self class] POST:URLString parameters:parameters isEncrypt:encrypt uploadFileStatus:SwpResultSingleFileUpload fileNames:fileName fileDatas:fileData swpResultSuccess:swpResultSuccess swpResultError:swpResultError];
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
+ (instancetype)swpPOSTAddFiles:(NSString *)URLString parameters:(NSDictionary *)parameters isEncrypt:(BOOL)encrypt fileName:(NSString *)fileName fileDatas:(NSArray *)fileDatas swpResultSuccess:(SwpResultSuccessHandle)swpResultSuccess swpResultError:(SwpResultErrorHandle)swpResultError {
    
//    // 初始化自定义网络请求类
//    SwpRequest           *swpRequest   = [SwpRequest shareInstance];
//    
//    // 字典加密
//    NSDictionary         *dictionary   = encrypt ? [SwpDataDispose swpDataEncryptParams:parameters encryptedKey:swpRequest.swpRequestAppKey] : parameters;
//    // 返回结果集
//    __block NSDictionary *resultObject = [NSDictionary dictionary];
//    
//    // 显示 状态栏 请求数据的菊花
//    [SwpRequestTools swpRequestToolsSetNetworkActivityIndicatorVisible:YES];
//    
//    // 发起请求
//    [swpRequest.swpSessionManager POST:URLString parameters:dictionary constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//      
//        for (int i=0; i<fileDatas.count; i++) {
//            NSString *imageName = [NSString stringWithFormat:@"%@[%i]", fileName, i];
//            [formData appendPartWithFileData:fileDatas[i] name:imageName fileName:imageName mimeType:@"image/png"];
//        }
//
//    } progress:^(NSProgress * _Nonnull uploadProgress) {
//    
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        resultObject = [SwpDataDispose swpDataRequestDecryptDispose:responseObject isBase64:encrypt];
//        swpResultSuccess(task, resultObject);
//        [SwpRequestTools swpRequestToolsSetNetworkActivityIndicatorVisible:NO];
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        swpResultError(task, error, [SwpRequestTools swpRequestToolsGetErrorMessage:error]);
//        [SwpRequestTools swpRequestToolsSetNetworkActivityIndicatorVisible:NO];
//    }];
    
    return [[self class] POST:URLString parameters:parameters isEncrypt:encrypt uploadFileStatus:SwpResultMultiplePicturesUpload fileNames:fileName fileDatas:fileDatas swpResultSuccess:swpResultSuccess swpResultError:swpResultError];
    
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
+ (instancetype)swpPOSTAddWithFiles:(NSString *)URLString parameters:(NSDictionary *)parameters isEncrypt:(BOOL)encrypt fileNames:(NSArray *)fileNames fileDatas:(NSArray *)fileDatas swpResultSuccess:(SwpResultSuccessHandle)swpResultSuccess swpResultError:(SwpResultErrorHandle)swpResultError {
    
//    // 初始化自定义网络请求类
//    SwpRequest           *swpRequest   = [SwpRequest shareInstance];
//    
//    // 字典加密
//    NSDictionary         *dictionary   = encrypt ? [SwpDataDispose swpDataEncryptParams:parameters encryptedKey:swpRequest.swpRequestAppKey] : parameters;
//    // 返回结果集
//    __block NSDictionary *resultObject = [NSDictionary dictionary];
//    
//    // 显示 状态栏 请求数据的菊花
//    [SwpRequestTools swpRequestToolsSetNetworkActivityIndicatorVisible:YES];
//    
//    // 发起请求
//    [swpRequest.swpSessionManager POST:URLString parameters:dictionary constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//        for (int i=0; i<fileDatas.count; i++) {
//            [formData appendPartWithFileData:fileDatas[i] name:fileNames[i] fileName:fileNames[i] mimeType:@"image/png"];
//        }
//    } progress:^(NSProgress * _Nonnull uploadProgress) {
//
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        resultObject = [SwpDataDispose swpDataRequestDecryptDispose:responseObject isBase64:encrypt];
//        swpResultSuccess(task, resultObject);
//        [SwpRequestTools swpRequestToolsSetNetworkActivityIndicatorVisible:NO];
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        swpResultError(task, error, [SwpRequestTools swpRequestToolsGetErrorMessage:error]);
//        [SwpRequestTools swpRequestToolsSetNetworkActivityIndicatorVisible:NO];
//    }];
    
     return [[self class] POST:URLString parameters:parameters isEncrypt:encrypt uploadFileStatus:SwpResultMultipleFilesUpload fileNames:fileNames fileDatas:fileDatas swpResultSuccess:swpResultSuccess swpResultError:swpResultError];
}


/*!
 *  @author swp_song
 *
 *  @brief  swpDownloadFile:swpDownloadProgress:swpCompletionHandler:   ( 请求网络 < 下载图片方法 > )
 *
 *  @param  URLString                       请求的 url
 *
 *  @param  swpDownloadProgress             下载进度
 *
 *  @param  swpCompletionHandler            下载回调    ( 成功 | 失败 回调, 成功 Error 为 nil )
 */
+ (void)swpDownloadFile:(NSString *)URLString swpDownloadProgress:(void(^)(SwpDownloadProgress swpDownloadProgress))swpDownloadProgress swpCompletionHandler:(void(^)(NSString *filePath, NSString *fileName,  NSString *error))swpCompletionHandler {
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSMutableURLRequest       *request       = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URLString]];
    AFHTTPSessionManager      *manager       = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    // 发起 请求
    [SwpRequestTools swpRequestToolsSetNetworkActivityIndicatorVisible:YES];
    NSURLSessionDownloadTask *downloadTask   = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        swpDownloadProgress(SwpDownloadProgressMake(downloadProgress.fractionCompleted, downloadProgress.totalUnitCount, downloadProgress.completedUnitCount));
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        // 返回 文件 路径
        NSURL *pathURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
        return [pathURL URLByAppendingPathComponent:[response suggestedFilename]];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        NSString *downloadFilePath = [SwpRequestTools swpRequestToolsDownloadFilePathDispose:filePath];
        if (error) [[NSFileManager defaultManager] removeItemAtPath:downloadFilePath error:nil];
        swpCompletionHandler(downloadFilePath, [SwpRequestTools swpRequestToolsGetDownloadFileName:filePath], [SwpRequestTools swpRequestToolsGetErrorMessage:error]);
        [SwpRequestTools swpRequestToolsSetNetworkActivityIndicatorVisible:NO];
    }];
    // 开始 请求
    [downloadTask resume];
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
                swpResultStatus(SwpResultReachabilityStatusUnknown);
                break;
            case AFNetworkReachabilityStatusNotReachable:
                swpResultStatus(SwpResultReachabilityStatusNotReachable);
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                swpResultStatus(SwpResultReachabilityStatusReachableViaWWAN);
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                swpResultStatus(SwpResultReachabilityStatusReachableViaWiFi);
                break;
            default:
                break;
        }
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
    
    [[self class] POST:@"" parameters:nil isEncrypt:YES uploadFileStatus:SwpResultDoNotFileUpload fileNames:@[@"", @"", @""] fileDatas:@[@"", @"", @""] swpResultSuccess:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull resultObject) {
        
    } swpResultError:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error, NSString * _Nonnull errorMessage) {
        
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
    return [SwpDataDispose swpDataEncryptParams:dictionary encryptedKey:[SwpRequest shareInstance].swpRequestAppKey];
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


#pragma mark - 

+ (instancetype)POST:(NSString *)URLString parameters:(NSDictionary *)parameters isEncrypt:(BOOL)encrypt uploadFileStatus:(SwpResultUploadFileStatus)uploadFileStatus fileNames:(id)fileNames fileDatas:(id)fileDatas swpResultSuccess:(SwpResultSuccessHandle)swpResultSuccess swpResultError:(SwpResultErrorHandle)swpResultError {
    
    
    
    NSLog(@"%@", [fileNames class]);
    NSLog(@"%@", [fileDatas class]);
    
    // 初始化自定义网络请求类
    SwpRequest           *swpRequest   = [SwpRequest shareInstance];
    
    // 字典加密
    NSDictionary         *dictionary   = encrypt ? [SwpDataDispose swpDataEncryptParams:parameters encryptedKey:swpRequest.swpRequestAppKey] : parameters;
    // 返回结果集
    __block NSDictionary *resultObject = [NSDictionary dictionary];
    
    // 显示 状态栏 请求数据的菊花
    [SwpRequestTools swpRequestToolsSetNetworkActivityIndicatorVisible:YES];
    
    // 发起请求
    [swpRequest.swpSessionManager POST:URLString parameters:dictionary constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        switch (uploadFileStatus) {
            case SwpResultDoNotFileUpload:
                break;
                
            case SwpResultSingleFileUpload: {
                [formData appendPartWithFileData:[NSData dataWithData:fileDatas] name:[NSString stringWithFormat:@"%@", fileNames] fileName:@"picture.png" mimeType:@"image/png"];
            }
                break;
                
            case SwpResultMultipleFilesUpload: {
                NSArray *datas = [NSArray arrayWithArray:fileDatas];
                for (int i=0; i<datas.count; i++) {
                    NSString *imageName = [NSString stringWithFormat:@"%@[%i]", fileNames, i];
                    [formData appendPartWithFileData:fileDatas[i] name:imageName fileName:imageName mimeType:@"image/png"];
                }
            }
                break;
                
            case SwpResultMultiplePicturesUpload: {
                
                NSArray *names = [NSArray arrayWithArray:fileNames];
                NSArray *datas = [NSArray arrayWithArray:fileDatas];
                for (int i=0; i<datas.count; i++) {
                    [formData appendPartWithFileData:datas[i] name:names[i] fileName:names[i] mimeType:@"image/png"];
                }
            }
                break;
                
            default:
                break;
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        resultObject = [SwpDataDispose swpDataRequestDecryptDispose:responseObject isBase64:encrypt];
        swpResultSuccess(task, resultObject);
        [SwpRequestTools swpRequestToolsSetNetworkActivityIndicatorVisible:NO];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        swpResultError(task, error, [SwpRequestTools swpRequestToolsGetErrorMessage:error]);
        [SwpRequestTools swpRequestToolsSetNetworkActivityIndicatorVisible:NO];
    }];
    
    return swpRequest;
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
