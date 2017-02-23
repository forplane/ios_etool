//
//  Api.h
//  cafe
//
//  Created by jpmac on 2017/1/7.
//  Copyright © 2017年 yidont. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoadDelegate.h"
#import "OpeDelegate.h"
@class Api;

@protocol ApiDelegate <NSObject>

@optional
-(void)apiExitLogin:(nonnull Api*)__api;//异地登录
@optional
-(BOOL)apiErrorPre:(nullable NSString*)error api:(nonnull Api*)__api;//错误信息，所有一切没有正常返回值的（注：包含服务器问题，gson解析错误，php，html问题）
@optional
-(BOOL)apiNoDataPre:(nonnull Api*)__api;//在处理没有数据的情况前调用，返回TRUE代表实现者已经处理完毕，基类不需要处理默认操作；返回FALSE反之
@optional
-(void)apiNoDataAfter:(nonnull Api*)__api;//在处理没有数据后调用
-(void)apiData:(nonnull NSDictionary*)data api:(nonnull Api*)__api;
@end


static  NSString * _Nonnull code100000,* _Nonnull code100004,* _Nonnull code100101;
static  NSString * _Nonnull DNS,* _Nonnull DNSS;
static  NSString * _Nonnull HEADKEY,* _Nonnull ACCESSKEY;
static  NSString * _Nonnull gkey,* _Nonnull gIv;

@interface Api : NSObject<LoadDelegate>
@property (nonnull,nonatomic,readonly) NSString *url;//请求接口的url
@property (nonnull,nonatomic,readonly) NSDictionary *p;//请求接口的具体参数
@property (nonnull,readonly) NSDictionary *result;//请求数据后数据


/**
 * http://api.cd6565.com/{gameview/index22.php}?act=recommendgame&page=1
 * m:上边花括号就是
 */
+(void)getm:(nonnull NSString*)m p:(nonnull NSDictionary*)p del:(nonnull id<ApiDelegate>)del opeDel:(nullable id<OpeDelegate>)opedel;

+(void)getms:(nonnull NSString*)m p:(nonnull NSDictionary*)p del:(nonnull id<ApiDelegate>)del opeDel:(nullable id<OpeDelegate>)opedel;



/**
 * http://api.cd6565.com/{gameview/index22.php}?act=recommendgame&page=1
 * m:上边花括号就是
 */
+(void)postm:(nonnull NSString*)m p:(nonnull NSDictionary*)p del:(nonnull id<ApiDelegate>)del opeDel:(nullable id<OpeDelegate>)opedel;


+(void)postms:(nonnull NSString*)m p:(nonnull NSDictionary*)p del:(nonnull id<ApiDelegate>)del opeDel:(nullable id<OpeDelegate>)opedel;

//上传方法  ukey必须是数组，并且数组元素是NSDictionary  且必须含有key（name，string类型）跟img（图片，UIImage类型）两个键值
+(void)upostms:(nonnull NSString*)m p:(nonnull NSDictionary*)p ukey:(nonnull NSArray*) ukey del:(nonnull id<ApiDelegate>)del opeDel:(nullable id<OpeDelegate>)opedel;
@end
