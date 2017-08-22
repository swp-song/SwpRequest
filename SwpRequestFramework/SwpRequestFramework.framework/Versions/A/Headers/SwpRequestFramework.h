//
//  SwpRequestFramework.h
//  swp_song
//
//  Created by swp_song on 2017/8/17.
//  Copyright © 2016年 swp_song. All rights reserved.
//



#ifndef SwpRequestFramework_h
#define SwpRequestFramework_h

    #ifdef __OBJC__
        #import <UIKit/UIKit.h>
    #else
        #ifndef FOUNDATION_EXPORT
            #if defined(__cplusplus)
                #define FOUNDATION_EXPORT extern "C"
            #else
                #define FOUNDATION_EXPORT extern
            #endif
        #endif
    #endif

    FOUNDATION_EXPORT double SwpRequestFrameworkVersionNumber;
    FOUNDATION_EXPORT const unsigned char SwpRequestFrameworkVersionString[];

    #import <SwpRequestFramework/SwpRequest.h>
    #import <SwpRequestFramework/SwpDownload.h>
    #import <SwpRequestFramework/SwpRequestUtils.h>
    #import <SwpRequestFramework/SwpNetworkModel.h>
    #import <SwpRequestFramework/SwpRequest+MainInterface.h>
    #import <SwpRequestFramework/SwpRequest+SwpEncryptRequest.h>

#endif
