//
//  ToolConfig.h
//  etool
//
//  Created by jpmac on 2017/2/22.
//  Copyright © 2017年 yidont. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Global.h"
#import "AFNetworkReachabilityManager.h"





@interface ToolConfig : NSObject
@property (readonly) AFNetworkReachabilityStatus netWorkStatus;


+(void)config;
+(BOOL)isNetWork;


#pragma mark 图片相关操作

/**
 * 默认加载图片配置
 * 默认的加载图片,banner图片，垂直图片
 */
+(void)setDef:(NSString*)__def icon:(NSString*)__icon banner:(NSString*)__banner vertical:(NSString*)__vertical;

#pragma mark 请求网络返回相关操作
/**
 *  网络请求返回code配置
 */
+(void)code_100000:(NSString*)__100000 _100004:(NSString*)__100004 _100101:(NSString*)__100101;
/**
 *  域名配置
 */
+(void)DNS:(NSString*)__dns;
/**
 * 头部加密以及access加密的秘药
 */
+(void)headKey:(NSString*)__headKey accessKey:(NSString*)__accessKey;

/**
 *  3DES 加密
 */
+(void)gKey:(NSString*)__gKey gIv:(NSString*)__gIv;

@end
