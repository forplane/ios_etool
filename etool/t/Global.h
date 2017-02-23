//
//  Global.h
//  cafe
//
//  Created by jpmac on 2017/1/7.
//  Copyright © 2017年 yidont. All rights reserved.
//
#import <Foundation/Foundation.h>
#ifndef Global_h
#define Global_h


#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)



#pragma mark
#pragma mark 常用宏定义
#define NavPush(nav,vc) [nav pushViewController:[[NSClassFromString(vc) alloc] init] animated:YES]
#define R_COLOR [UIColor colorWithRed:arc4random() % 255 / 255. green:arc4random() % 255 / 255. blue:arc4random() % 255 / 255. alpha:1]  //随机颜色
#define SCREEN_W     [UIScreen mainScreen].bounds.size.width
#define SCREEN_H     [UIScreen mainScreen].bounds.size.height

#pragma mark 高度宏定义
#define H_NAV       44  //导航栏高度
#define H_HEAD      64      //状态栏+导航栏总高度
#define H_TOOL      49      //底部工具栏
#define H_STATUS    20  //状态栏高度
#define H_BANNER    150 //banner高度
#pragma mark

//#pragma mark flux部分头文件
#import "NormalDataStoreEvent.h"
#import "NormalStoreEvent.h"
#import "NormalAction.h"
#import "NormalActionCreator.h"
#import "NormalStore.h"
#import "NormalDataActionEntity.h"
//
#pragma mark 自己定义的分类头部文件
#import "UIImageView+ImgUtil.h"
//#import "UIViewController+swizzling.h"
//#import "UIView+getShow.h"
#import "UITableViewCell+SetNormal.h"
#import "UICollectionViewCell+SetNormal.h"
//#import "UITableView+Rocket.h"
//
//
//
#pragma mark mjrefresh头部文件
#import "MJRefreshNormalHeader.h"
#import "MJRefreshGifHeader.h"
#import "MJRefreshAutoGifFooter.h"
#import "MJRefreshBackGifFooter.h"

#endif /* Global_h */
