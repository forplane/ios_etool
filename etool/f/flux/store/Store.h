//
//  Store.h
//  cafe
//
//  Created by jpmac on 2017/1/9.
//  Copyright © 2017年 yidont. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IFluxBaseHelper.h"
#import "StoreChangeEvent.h"
#import "Action.h"
//@class IFluxBaseHelper;
@interface Store : NSObject
-(void)registerSub:(id<IFluxBaseHelper>)__subscriber;
-(void)unregisterSub:(id<IFluxBaseHelper>)__subscriber;

//这个方法一定要重写
-(StoreChangeEvent*)changeEvent:(NSString*)__tag opeType:(int)__opeType;

-(void)emitStoreChange:(StoreChangeEvent*)__storeChangeEvent;

-(void)emitStoreChange:(NSString*)__tag opeType:(int)__opeType;

-(void)onAction:(Action*)action;//这个方法一定要重写
@end
