//
//  NormalActionEntity.m
//  cafe
//
//  Created by jpmac on 2017/1/9.
//  Copyright © 2017年 yidont. All rights reserved.
//

#import "NormalActionEntity.h"
#import "NormalAction.h"
@implementation NormalActionEntity
-(Action *)buildWithTag:(NSString *)__tag opeType:(int)__opeType{
    Action *action= [[NormalAction alloc]init:__tag opeType:__opeType nortype:TYPE_NORMAL_NOTHING data:self];
    return action;
}
@end
