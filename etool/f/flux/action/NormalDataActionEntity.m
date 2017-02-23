//
//  NormalDataActionEntity.m
//  cafe
//
//  Created by jpmac on 2017/1/9.
//  Copyright © 2017年 yidont. All rights reserved.
//

#import "NormalDataActionEntity.h"
#import "NormalAction.h"
@implementation NormalDataActionEntity
-(instancetype)setObj:(id)__obj{
    _obj=__obj;
    return self;
}

-(Action *)buildWithTag:(NSString *)__tag opeType:(int)__opeType{
    Action *action= [[NormalAction alloc]init:__tag opeType:__opeType nortype:TYPE_NORMAL_OBJ data:self];

    return action;
}
@end
