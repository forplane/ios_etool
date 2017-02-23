//
//  ToolConfig.m
//  etool
//
//  Created by jpmac on 2017/2/22.
//  Copyright © 2017年 yidont. All rights reserved.
//

#import "ToolConfig.h"
@implementation ToolConfig
static ToolConfig *config;


+(void)config{
    if (!config) {
        config=[[ToolConfig alloc]init];
        [config addNetWorkStateListener];
    }
}

#pragma mark 添加网络监听
-(void)addNetWorkStateListener{
    AFNetworkReachabilityManager *reachabilityManager = [AFNetworkReachabilityManager sharedManager];
    [reachabilityManager startMonitoring];
    [reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        _netWorkStatus=status;
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
    }];
}

-(AFNetworkReachabilityStatus)netWorkState{
    return _netWorkStatus;
}
+(BOOL)isNetWork{
    return config.netWorkStatus==0?NO:YES;
}
#pragma mark 图片相关操作
+(void)setDef:(NSString*)__def icon:(NSString*)__icon banner:(NSString*)__banner vertical:(NSString*)__vertical{
    style_def=__def;
    style_icon=__icon;
    style_banner=__banner;
    style_vertical=__vertical;
}

#pragma mark 请求网络返回相关操作
+(void)code_100000:(NSString*)__100000 _100004:(NSString*)__100004 _100101:(NSString*)__100101{
    code100000=__100000;
    code100004=__100004;
    code100101=__100101;
}

+(void)DNS:(NSString*)__dns{
    DNS=[NSString stringWithFormat:@"http://%@",__dns];
    DNSS=[NSString stringWithFormat:@"https://%@",__dns];
}
+(void)headKey:(NSString*)__headKey accessKey:(NSString*)__accessKey{
    ACCESSKEY=__accessKey;
    HEADKEY=__headKey;
}
+(void)gKey:(NSString*)__gKey gIv:(NSString*)__gIv{
    gkey=__gKey;
    gIv=__gIv;
}
@end
