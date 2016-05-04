# SwpRequest

#####导入：

```
手动导入：

SwpRequest 文件夹 导入 项目 中, 依赖  AFNetworking3.0 以上版本, Base64
#import "SwpRequest.h"
```
---

```ruby

CocoaPods 导入:
使用  CocoaPods 会自动 pod AFNetworking
pod search SwpRequest

pod 'SwpRequest'

#import <SwpRequest/SwpRequest.h>

```
---
#####[AFNetworking](https://github.com/AFNetworking/AFNetworking)     [Base64](https://github.com/nicklockwood/Base64)

---
```Objective-C

使用方法 

NSDictionary *dictionary = [NSDictionary dictionary];
[SwpRequest swpPOST:urlString parameters:dictionary isEncrypt:YES swpResultSuccess:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull resultObject) {
	[SwpRequest swpRequestYouZhiPrintDataInformation:resultObject];
} swpResultError:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error, NSString * _Nonnull errorMessage) {
	NSLog(@"%@", errorMessage);
}];

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
+ (void)swpPOST:(NSString *)URLString parameters:(nullable NSDictionary *)parameters isEncrypt:(BOOL)encrypt swpResultSuccess:(SwpResultSuccessHandle)swpResultSuccess swpResultError:(SwpResultErrorHandle)swpResultError;

```
---

```Objective-C
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
+ (void)swpPOSTAddFile:(NSString *)URLString parameters:(nullable NSDictionary *)parameters isEncrypt:(BOOL)encrypt fileName:(NSString *)fileName fileData:(NSData *)fileData swpResultSuccess:(SwpResultSuccessHandle)swpResultSuccess swpResultError:(SwpResultErrorHandle)swpResultError;
```
---

```Objective-C
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
+ (void)swpPOSTAddFiles:(NSString *)URLString parameters:(nullable NSDictionary *)parameters isEncrypt:(BOOL)encrypt fileName:(NSString *)fileName fileDatas:(NSArray *)fileDatas swpResultSuccess:(SwpResultSuccessHandle)swpResultSuccess swpResultError:(SwpResultErrorHandle)swpResultError;
```
---

```Objective-C
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
+ (void)swpPOSTAddWithFiles:(NSString *)URLString parameters:(nullable NSDictionary *)parameters isEncrypt:(BOOL)encrypt fileNames:(NSArray *)fileNames fileDatas:(NSArray *)fileDatas swpResultSuccess:(SwpResultSuccessHandle)swpResultSuccess swpResultError:(SwpResultErrorHandle)swpResultError;
```
---


```Objective-C
/*!
 *  @author swp_song
 *
 *  @brief  swpRequestReachabilityStatusChangeBlock:    ( 验证 网路 环境 )
 *
 *  @param  swpResultStatus
 */
+ (void)swpRequestReachabilityStatusChangeBlock:(void(^)(SwpResultReachabilityStatus swpResultStatus))swpResultStatus;
```
---

#####备注：
```
O(∩_∩)O,  如果有加密相同的 欢迎使用 
```
---







