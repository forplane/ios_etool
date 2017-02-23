
//
//  Api.m
//  cafe
//
//  Created by jpmac on 2017/1/7.
//  Copyright © 2017年 yidont. All rights reserved.
//
#import "Api.h"
#import "AFNetworking.h"
#import "AppDelegate.h"
#import "UHUDUtil.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>
#import <CommonCrypto/CommonCryptor.h>
//#import "LoginView.h"







typedef void (^ApiError)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull);
typedef void (^ApiSuccess)(NSURLSessionDataTask * _Nonnull, id _Nullable responseObject);
typedef void (^ApiProgress)(NSProgress * _Nonnull downloadProgress);
typedef void (^ApiUpload)(id <AFMultipartFormData> formData);

@interface Api()<ApiDelegate>{
@private id<ApiDelegate> defdel;//默认的请求网络代理
@private id<ApiDelegate>delegate;
@private id<OpeDelegate>opedelegate;
@private BOOL isPost;//是否是post请求，默认不是
@private BOOL isUpload;//是否是上传，默认不是
@private NSArray *ukey;//上传头像的key字典
}

@end

@implementation Api



#pragma mark 请求网络代理方法
-(BOOL)apiErrorPre:(NSString *)error api:(nonnull Api *)__api{
    
    NSLog(@"error === %@",error.debugDescription);
    [self showMsg:error];
    return FALSE;
}
-(void)apiExitLogin:(Api *)__api{
//    [LoginView exitLogin];
    NSLog(@"请求接口返回重复登录");
}
-(BOOL)apiNoDataPre:(Api *)__api{
    NSLog(@"请求接口返回没有数据的情况");
    return FALSE;//默认的没有数据处理前的方法，表示未处理
}

-(void)apiNoDataAfter:(Api *)__api{
    //nothing
}
-(void)apiData:(NSDictionary *)data api:(Api *)__api{
    NSLog(@"调用者没有实现处理数据方法");
}



#pragma mark LoadDelegate 本身方法
-(void)loadNet{
    if (isPost) {
        [self POST];
    }else{
        [self GET];
    }
}

#pragma mark api 本身方法
-(void)dealErrorMsg:(NSError*)error{
    //这里必须要之前先收集错误信息然后记录起来
    Boolean isDeal=FALSE;
    if ([delegate respondsToSelector:@selector(apiErrorPre:api:)]) {
        isDeal=[delegate apiErrorPre:error.domain api:self];
    }
    if (!isDeal) {
        [self->defdel apiErrorPre:error.domain api:self];
    }
    if (opedelegate!=nil){
        SEL selnonet=@selector(opeNoNet);
        SEL selerror=@selector(opeError);
        SEL sel=[ToolConfig isNetWork]?selerror:selnonet;
        if ([opedelegate respondsToSelector:sel]){
//            SuppressPerformSelectorLeakWarning(
//                [self performSelector:sel withObject:self]
//            );
            [opedelegate performSelector:sel];
//
//            SEL selector = NSSelectorFromString(@"someMethod");
//            IMP imp = [opedelegate methodForSelector:selector];
//            void (*func)(id, SEL) = (void *)imp;
//            func(self, selector);
        }
    }
}

-(void)dealNoData{
    if (opedelegate!=nil && [opedelegate respondsToSelector:@selector(opeNoData)]) {
        [opedelegate opeNoData];
    }
}

-(void)showMsg:(NSString*)msg{
    NSLog(@"msg=%@",msg);
    if ([msg isEqualToString:@"NSURLErrorDomain"]) {
        msg =@"请检查网络状态";
    }
    
    if ([self isChinese:msg]) {
        UIView *vv= [UIApplication sharedApplication].keyWindow.rootViewController.view;
        [UHUDUtil showTrueHUD:vv andText:msg];
    }
    
}
-(BOOL)isChinese:(NSString *)str{
    
    for (int i =1; i<[str length]; i++) {
        int a=[str characterAtIndex:i];
        if (a > 0x4e00 && a < 0x9fff) {
            return YES;
        }
        
    }
    return NO;
    
}

-(void)GET{
    if (opedelegate!=nil) {
        [opedelegate opeShow];
    }
    NSString *time=[Api getTime];
    NSString *headKey=[Api getHeadKey:time];
    NSString *clouid=[Api getClueid:time];
    AFHTTPSessionManager *manager=[self managerSetting];
    [manager.requestSerializer setValue:headKey forHTTPHeaderField:@"key"];
    [manager.requestSerializer setValue:clouid forHTTPHeaderField:@"clueid"];
    NSString *__url=[NSString stringWithFormat:@"%@/?",self.url];
    NSString *accessSign= [Api accessSign:self.p];
    NSMutableDictionary *__p= [NSMutableDictionary dictionaryWithDictionary:_p];
    [__p setObject:accessSign forKey:@"accessSign"];
    _p=[NSDictionary dictionaryWithDictionary:__p];
    NSArray *keys= [self.p allKeys];
    for (int a=0; a<keys.count; a++) {
        NSString *key=keys[a];
        NSString *value= self.p[key];
        __url=[NSString stringWithFormat:@"%@%@=%@&",__url,key,value];
    }
    __url=[__url substringToIndex:__url.length-1];
 

    [manager GET:__url parameters:nil
        progress:[self apiProgressBlock]
        success:[self apiSuccessBlock]
        failure:[self apiErrorBlock]];
    
    //主要是调试的时候，查看参数，可以注释掉
    [__p setObject:headKey forKey:@"key"];
    [__p setObject:clouid forKey:@"clueid"];
    _p=[NSDictionary dictionaryWithDictionary:__p];
}

-(void)POST{
    if (opedelegate!=nil) {
        [opedelegate opeShow];
    }
    isPost=TRUE;
    NSString *time=[Api getTime];
    NSString *headKey=[Api getHeadKey:time];
    NSString *clouid=[Api getClueid:time];
    AFHTTPSessionManager *manager=[self managerSetting];
    
    NSString *accessSign= [Api accessSign:self.p];
    NSMutableDictionary *__p= [NSMutableDictionary dictionaryWithDictionary:_p];
    [__p setObject:headKey forKey:@"key"];
    [__p setObject:clouid forKey:@"clueid"];
    [__p setObject:accessSign forKey:@"accessSign"];
    _p=[NSDictionary dictionaryWithDictionary:__p];
    NSString *__url=[NSString stringWithFormat:@"%@/?",self.url];
    
    
    ApiUpload uploadBlock=nil;
    if (isUpload) {
        uploadBlock=[self apiUploadBlock];
    }
    [manager POST:__url parameters:self.p
        constructingBodyWithBlock:uploadBlock
         progress:[self apiProgressBlock]
          success:[self apiSuccessBlock]
          failure:[self apiErrorBlock]];
}

-(AFHTTPSessionManager*)managerSetting{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    return manager;
}

-(ApiProgress)apiProgressBlock{
    return ^(NSProgress * _Nonnull downloadProgress) {
        
    };
}

-(ApiUpload)apiUploadBlock{
    return ^(id <AFMultipartFormData> formData){
        for (int i = 0; i < ukey.count; i++) {
            UIImage *image = ukey[i][@"img"];
            NSString *key=ukey[i][@"key"];
            NSData *data = UIImagePNGRepresentation(image);
            [formData appendPartWithFileData:data name:key fileName:key mimeType:@"image/png"];
        }
    };
}

-(ApiError) apiErrorBlock{
    return ^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (opedelegate!=nil && [opedelegate respondsToSelector:@selector(opeDismiss)]){
            [opedelegate performSelector:@selector(opeDismiss)];
        }
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        [self dealErrorMsg:error];
    };
}

-(NSDictionary *)convertToJsonData:(NSDictionary *)dict

{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString;
    if (!jsonData) {
        NSLog(@"%@",error);
    }else{
        
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
//    NSRange range = {0,jsonString.length};
    
    //去掉字符串中的空格
//    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    NSRange range2 = {0,mutStr.length};
    //去掉字符串中的换行符
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    jsonData=[mutStr dataUsingEncoding:NSUTF8StringEncoding];
    dict=[NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    return dict;
    
}

-(ApiSuccess) apiSuccessBlock{
    return ^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (opedelegate!=nil && [opedelegate respondsToSelector:@selector(opeDismiss)]){
            [opedelegate performSelector:@selector(opeDismiss)];
        }
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        NSError *er=nil;
        NSDictionary *re=[self convertToJsonData:responseObject];
        if (er!=nil) {
            [self dealErrorMsg:er];
        }else{
            _result=[NSDictionary dictionaryWithDictionary:re];
            NSString *ydCode= re[@"ydCode"];
            if ([ydCode isEqualToString:code100101]) {
                if([delegate respondsToSelector:@selector(apiExitLogin:)]){
                    [delegate apiExitLogin:self];
                }
                [self->defdel apiExitLogin:self];
                return;
            }
            
            if ([ydCode isEqualToString:code100004]) {
                BOOL isDeal=FALSE;
                if([delegate respondsToSelector:@selector(apiNoDataPre:)]){
                    isDeal=[delegate apiNoDataPre:self];
                }
                if(!isDeal){
                    [self dealNoData];
                }
                
                return;
                
            }
            if (![ydCode isEqualToString:code100000]) {
                BOOL isDeal=FALSE;
                if([delegate respondsToSelector:@selector(apiErrorPre:api:)]){
                    isDeal=[delegate apiErrorPre:re[@"ydMsg"] api:self];
                }
                if(!isDeal){
                    [self apiErrorPre:re[@"ydMsg"] api:self];
                }
                return;
            }
            if([delegate respondsToSelector:@selector(apiData:api:)]){
                [delegate apiData:re[@"ydBody"] api:self];
            }else{
                [self->defdel apiData:re[@"ydBody"] api:self];
            }
        }
    };
}

-(instancetype)initUrl:(NSString*)__url p:(NSDictionary*)__p{
    if (self=[super init]) {
        defdel=self;
        NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithDictionary:__p];
        _p=[NSDictionary dictionaryWithDictionary:dict];
        _url=__url;
    }
    return self;
}



+(void)getms:(NSString*)m p:(NSDictionary*)p del:(id<ApiDelegate>)del opeDel:(nullable id<OpeDelegate>)opedel{
    NSString *url=[NSString stringWithFormat:@"%@/%@",DNS,m];
    Api *api= [[Api alloc]initUrl:url p:p];
    api->delegate=del;
    api->opedelegate=opedel;
    [opedel setLoadDelegate:api];
    [api GET];
}

+(void)getm:(NSString*)m p:(NSDictionary*)p del:(id<ApiDelegate>)del opeDel:(nullable id<OpeDelegate>)opedel{
    NSString *url=[NSString stringWithFormat:@"%@/%@",DNS,m];
    Api *api= [[Api alloc]initUrl:url p:p];
    api->delegate=del;
    api->opedelegate=opedel;
    [opedel setLoadDelegate:api];
    [api GET];
}

+(void)postms:(NSString*)m p:(NSDictionary*)p del:(id<ApiDelegate>)del opeDel:(nullable id<OpeDelegate>)opedel{
    NSString *url=[NSString stringWithFormat:@"%@/%@",DNSS,m];
    Api *api= [[Api alloc]initUrl:url p:p];
    api->delegate=del;
    api->opedelegate=opedel;
    [opedel setLoadDelegate:api];
    [api POST];
}
+(void)postm:(NSString*)m p:(NSDictionary*)p del:(id<ApiDelegate>)del opeDel:(nullable id<OpeDelegate>)opedel{
    NSString *url=[NSString stringWithFormat:@"%@/%@",DNS,m];
    Api *api= [[Api alloc]initUrl:url p:p];
    api->delegate=del;
    api->opedelegate=opedel;
    [opedel setLoadDelegate:api];
    [api POST];
}

+(void)upostms:(NSString*)m p:(NSDictionary*)p ukey:(NSArray*)ukey del:(id<ApiDelegate>)del opeDel:(nullable id<OpeDelegate>)opedel{
    NSString *url=[NSString stringWithFormat:@"%@/%@",DNS,m];
    Api *api= [[Api alloc]initUrl:url p:p];
    api->delegate=del;
    api->opedelegate=opedel;
    api->isUpload=YES;
    api->ukey=ukey;
    [opedel setLoadDelegate:api];
    [api POST];
}

#pragma mark 主要是头部以及加密的方法

+(NSString*)getTime{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMddHHmmss"];
    NSString *time = [dateFormatter stringFromDate:[NSDate date]];
//    time=@"1122334455";
    return time;
}

+(NSString*)encodeBase64:(NSString*)str{
    NSData *d=[str dataUsingEncoding:NSUTF8StringEncoding];
    str=[d base64EncodedStringWithOptions:0];
    str=[str stringByReplacingOccurrencesOfString:@"=" withString:@""];
    return str;
}
+(NSString*)swap:(NSString*)__swap{
    NSString *qian= [__swap substringFromIndex:__swap.length-4];
    NSString *temp= [__swap substringToIndex:__swap.length-4];
    temp=[temp substringFromIndex:4];
    NSString *hou=[__swap substringToIndex:4];
    __swap=[NSString stringWithFormat:@"%@%@%@",qian,temp,hou];
    return __swap;
}

+(NSString*)md5:(NSString*)__str{
    const char *cStr = [__str UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    return output;
}
+(NSString*)getHeadKey:(NSString*)__time{
    __time=[Api encodeBase64:__time];
    __time=[Api swap:__time];
    return __time;
}

+(NSString*)getClueid:(NSString*)__time{
    __time=[NSString stringWithFormat:@"%@%@",HEADKEY,__time];
    __time=[Api md5:__time];
    return __time;
}



+(NSString *)hmac:(NSString *)plaintext withKey:(NSString *)key
{
    const char *cKey = [key cStringUsingEncoding:NSUTF8StringEncoding];
    const char *cData = [plaintext cStringUsingEncoding:NSUTF8StringEncoding];
    
    unsigned char cHMAC[CC_SHA256_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA256, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    NSData *HMAC = [[NSData alloc] initWithBytes:cHMAC length:sizeof(cHMAC)];
    NSString *res =[HMAC base64EncodedStringWithOptions:NSASCIIStringEncoding];
    res=[res stringByReplacingOccurrencesOfString:@"=" withString:@""];
    return res;
    
}

//参数排序加密的轨道accessSgin值
+(NSString*)accessSign:(NSDictionary*)dict{
    NSArray *keys = [dict allKeys];
    NSArray *sortedArray = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
        return [obj1 compare:obj2 options:NSNumericSearch];
    }];
    NSString *sign=@"";
    for (NSString *key in sortedArray) {
        NSString *value= dict[key];
        sign=[NSString stringWithFormat:@"%@%@=%@&",sign,key,value];
    }
    sign=[sign substringToIndex:sign.length-1];
//    sign=@"中山移动";
    sign= (NSString*)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(nil,(CFStringRef)sign, nil,(CFStringRef)@"!*'();:@&=$,/ %#[]", kCFStringEncodingUTF8));
    sign=[Api hmac:sign withKey:ACCESSKEY];
    sign=[sign stringByReplacingOccurrencesOfString:@"+" withString:@"%2B"];
    return sign;
}

@end
