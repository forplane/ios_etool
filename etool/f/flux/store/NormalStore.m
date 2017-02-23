//
//  NormalStore.m
//  cafe
//
//  Created by jpmac on 2017/1/9.
//  Copyright © 2017年 yidont. All rights reserved.
//

#import "NormalStore.h"
#import "NormalStoreEvent.h"
#import "NormalDataStoreEvent.h"
#import "NormalDataActionEntity.h"
@implementation NormalStore

-(StoreChangeEvent *)changeEvent:(NSString *)__tag opeType:(int)__opeType{
    return [[NormalStoreEvent alloc]initTag:__tag opeType:__opeType];
}

-(void)onAction:(Action *)action{
    [self onNormalAction:(INormalAction*)action];
}

-(void)onNormalAction:(INormalAction *)action{
    int nortype=action.nortype;
    StoreChangeEvent *event=nil;
    if (nortype == TYPE_NORMAL_NOTHING) {
        event=[[NormalStoreEvent alloc] initTag:action.tag opeType:action.opeType];
    }else if(nortype == TYPE_NORMAL_OBJ){
        NormalDataActionEntity *entity= action.data;
        event=[[NormalDataStoreEvent alloc]initTag:action.tag opeType:action.opeType obj:entity.obj];
    }
    [self emitStoreChange:event];
}
@end
