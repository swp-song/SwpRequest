//
//  SwpRequest.m
//  swp_song
//
//  Created by swp_song on 2017/6/24.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpRequest.h"

/*! ---------------------- Tool       ---------------------- !*/
#import "AFNetworking.h"            //  AFNetworking
#import "SwpEncryptTools.h"         //  SwpEncryptTools
#import "SwpRequestTools.h"         //  SwpRequestTools
/*! ---------------------- Tool       ---------------------- !*/

@interface SwpRequest ()

#pragma mark - Networking Property
/*! ----------------------  Networking Property  ---------------------- !*/
/*! AFHTTPSessionManager 网络请求管理者对象    !*/
@property (nonatomic, strong) AFHTTPSessionManager  *swpSessionManager;
/*! ----------------------  Networking Property  ---------------------- !*/

@end


@implementation SwpRequest


#pragma mark - SwpRequest Methods
/**!
 *  @author swp_song
 *
 *  @brief  swpPOST:parameters:uploadFileStatus:fileNames:fileDatas:swpResultSuccess:swpResultError:    ( 网络请求核心方法 )
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
+ (instancetype)swpPOST:(NSString *)URLString parameters:(NSDictionary *)parameters uploadFileStatus:(SwpResultUploadFileStatus)uploadFileStatus fileNames:(id)fileNames fileDatas:(id)fileDatas swpResultSuccess:(SwpResultSuccessHandle)swpResultSuccess swpResultError:(SwpResultErrorHandle)swpResultError {
    
    // 初始化自定义网络请求类
    SwpRequest           *swpRequest   = [SwpRequest shareInstance];
    
    // 显示 状态栏 请求数据的菊花
    [SwpRequestTools swpRequestToolsSetNetworkActivityIndicatorVisible:YES];
    
    // 发起请求
    [swpRequest.swpSessionManager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        switch (uploadFileStatus) {
                // 不上传 文件
            case SwpResultDoNotFileUpload:
                break;
                
                // 单文件
            case SwpResultSingleFileUpload: {
                [formData appendPartWithFileData:[NSData dataWithData:fileDatas] name:[NSString stringWithFormat:@"%@", fileNames] fileName:@"picture.png" mimeType:@"image/png"];
            }
                break;
                
                // 文件名称 不同
            case SwpResultMultipleFilesUpload: {
                NSArray *names = [NSArray arrayWithArray:fileNames];
                NSArray *datas = [NSArray arrayWithArray:fileDatas];
                for (int i=0; i<datas.count; i++) {
                    [formData appendPartWithFileData:datas[i] name:names[i] fileName:names[i] mimeType:@"image/png"];
                }
                
            }
                break;
                
                // 文件 名称 相同
            case SwpResultMultiplePicturesUpload: {
                NSArray *datas = [NSArray arrayWithArray:fileDatas];
                for (int i=0; i<datas.count; i++) {
                    NSString *imageName = [NSString stringWithFormat:@"%@[%i]", fileNames, i];
                    [formData appendPartWithFileData:fileDatas[i] name:imageName fileName:imageName mimeType:@"image/png"];
                }
            }
                break;
            default:
                break;
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        swpResultSuccess(task, responseObject);
        [SwpRequestTools swpRequestToolsSetNetworkActivityIndicatorVisible:NO];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        swpResultError(task, error, [SwpRequestTools swpRequestToolsGetErrorMessage:error]);
        [SwpRequestTools swpRequestToolsSetNetworkActivityIndicatorVisible:NO];
    }];
    
    return swpRequest;
}

/**!
 *  @author swp_song
 *
 *  @brief  swpPOST:parameters:swpResultSuccess:swpResultError: ( 请求网络获取数据 <POST> )
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
+ (instancetype)swpPOST:(NSString *)URLString parameters:(NSDictionary *)parameters swpResultSuccess:(SwpResultSuccessHandle)swpResultSuccess swpResultError:(SwpResultErrorHandle)swpResultError {
    return [self swpPOST_:URLString parameters_:parameters uploadFileStatus_:SwpResultDoNotFileUpload fileNames_:nil fileDatas_:nil swpResultSuccess_:swpResultSuccess swpResultError_:swpResultError];
}

/**!
 *  @author swp_song
 *
 *  @brief  swpPOSTUploadFile:parameters:fileName:fileData:swpResultSuccess:swpResultError: ( 请求网络获上传文件, 单文件上传 <POST> )
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
+ (instancetype)swpPOSTUploadFile:(NSString *)URLString parameters:(NSDictionary *)parameters fileName:(NSString *)fileName fileData:(NSData *)fileData swpResultSuccess:(SwpResultSuccessHandle)swpResultSuccess swpResultError:(SwpResultErrorHandle)swpResultError {
    return [self swpPOST_:URLString parameters_:parameters uploadFileStatus_:SwpResultSingleFileUpload fileNames_:fileName fileDatas_:fileData swpResultSuccess_:swpResultSuccess swpResultError_:swpResultError];
}

/**!
 *  @author swp_song
 *
 *  @brief  swpPOSTUploadFiles:parameters:fileName:fileDatas:swpResultSuccess:swpResultError:   ( 请求网络获上传文件, 多文件上传, 文件名称相同使用该方法 <POST> )
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
+ (instancetype)swpPOSTUploadFiles:(NSString *)URLString parameters:(NSDictionary *)parameters fileName:(NSString *)fileName fileDatas:(NSArray *)fileDatas swpResultSuccess:(SwpResultSuccessHandle)swpResultSuccess swpResultError:(SwpResultErrorHandle)swpResultError {

    return [self swpPOST_:URLString parameters_:parameters uploadFileStatus_:SwpResultMultiplePicturesUpload fileNames_:fileName fileDatas_:fileDatas swpResultSuccess_:swpResultSuccess swpResultError_:swpResultError];
}

/**!
 *  @author swp_song
 *
 *  @brief  swpPOSTUploadFiles:parameters:fileNames:fileDatas:swpResultSuccess:swpResultError:  ( 请求网络获上传文件, 多文件上传, 文件名称不相同相同使用该方法  <POST> )
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
+ (instancetype)swpPOSTUploadFiles:(NSString *)URLString parameters:(NSDictionary *)parameters fileNames:(NSArray *)fileNames fileDatas:(NSArray *)fileDatas swpResultSuccess:(SwpResultSuccessHandle)swpResultSuccess swpResultError:(SwpResultErrorHandle)swpResultError {
    
    return [self swpPOST_:URLString parameters_:parameters uploadFileStatus_:SwpResultMultipleFilesUpload fileNames_:fileNames fileDatas_:fileDatas swpResultSuccess_:swpResultSuccess swpResultError_:swpResultError];
}


#pragma makr -

/**!
 *  @brief  swpPOST_:parameters_:uploadFileStatus_:fileNames_:fileDatas_:swpResultSuccess_:swpResultError_: ( 网络请求私有方法, 处理返回数据 )
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
+ (instancetype)swpPOST_:(NSString *)URLString parameters_:(NSDictionary *)parameters uploadFileStatus_:(SwpResultUploadFileStatus)uploadFileStatus fileNames_:(id)fileNames fileDatas_:(id)fileDatas swpResultSuccess_:(SwpResultSuccessHandle)swpResultSuccess swpResultError_:(SwpResultErrorHandle)swpResultError {
    
    return [self.class swpPOST:URLString parameters:parameters uploadFileStatus:uploadFileStatus fileNames:fileNames fileDatas:fileDatas swpResultSuccess:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull resultObject) {
        swpResultSuccess(task, [SwpRequestTools swpRequestToolsResultDecrypt:resultObject]);
    } swpResultError:swpResultError];
    
}

#pragma Init AFHTTPSessionManager Methods
- (AFHTTPSessionManager *)swpSessionManager {
    
    return !_swpSessionManager ? _swpSessionManager = ({
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/html", @"text/css", @"text/javascript", nil]];
        manager.securityPolicy                          = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        manager.securityPolicy.allowInvalidCertificates = YES;
        manager.securityPolicy.validatesDomainName      = NO;
        
        manager;
    }) : _swpSessionManager;
}



@end
