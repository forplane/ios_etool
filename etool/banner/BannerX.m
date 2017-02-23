//
//  BannerX.m
//  cafe
//
//  Created by jpmac on 2017/1/15.
//  Copyright © 2017年 yidont. All rights reserved.

#import "BannerX.h"
@implementation BannerX


+(void)get{
    BannerX *banner=[[BannerX alloc]init];
//    Store *store= [banner getStore];
//    if(store!=nil){
//        Dispatcher *dispatcher=[Dispatcher get];
//        [dispatcher registerSub:banner Store:store];
//    }
}

-(void)pushVc:(UIViewController*)__vc{
    UINavigationController *__nav= (UINavigationController*)[UIApplication sharedApplication].keyWindow.rootViewController;
    [__nav pushViewController:__vc animated:YES];
}
-(void)pushVcName:(NSString*)vcName{
    Class c= NSClassFromString(vcName);
    UIViewController *vc= [[c alloc]init];
    [self pushVc:vc];
}


+(void)post:(NSDictionary*)__dict{
    
////    广告类型（0 图片展示; 1 网页/活动策划 ; 2、系统公告  ； 3、今日签到   ;  4、游戏大厅 ; 5、在线视频 ; 6、金币夺宝  ; 7、商品点购 ; 8、网吧wifi ;   9、附近网吧 ; 10、应用推荐 ；11 单机html 游戏 ，12网游）
//    NSString *types= __dict[@"adType"];
//    int type= types.intValue;
//    if (type == 0) {
//
//    }else if (type ==1){
//        [[[WebViewVc alloc] url:e.obj[@"adUrl"]] push];
//    }else if (type ==2){
//    }else if (type ==3){
//        [self pushVcName:@"TodaySignVc"];
//    }else if (type ==4){
//        [self pushVcName:@"GameMainVc"];
//    }else if (type ==5){
//        [self pushVcName:@"VideoMainVc"];
//    }else if (type ==6){
//        
//    }else if (type ==7){
//        
//    }else if (type ==8){
//        
//    }else if (type ==9){
//        [self pushVcName:@"NearWifiVc"];
//    }else if (type ==10){
//        
//    }else if (type ==11){
//        NSString *gameUrl=e.obj[@"adUrl"];
//        [[[GamePalyVc alloc]url:gameUrl] push];
//    }else if (type ==12){
//        GameDetailVC *vc =[[GameDetailVC alloc] init];
//        NSString *gameid= e.obj[@"adUrl"];
//        vc.gameId=gameid;
//        [self pushVc:vc];
//    }
}

@end
