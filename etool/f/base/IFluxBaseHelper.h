//
//  IFluxBaseHelper.h
//  cafe
//
//  Created by jpmac on 2017/1/9.
//  Copyright © 2017年 yidont. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "Store.h"
@class Store;
@protocol IFluxBaseHelper <NSObject>
/**
 * evenbus的事件回调，也是页面ui更新管理器
 */
-(void)onViewUpdate:(id)event;

/**
 * 被继承的Fragment必须初始化返回Store
 */
-(Store*)getStore;

@end
