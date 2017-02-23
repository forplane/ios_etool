//
//  NormalDataStoreEvent.m
//  cafe
//
//  Created by jpmac on 2017/1/9.
//  Copyright © 2017年 yidont. All rights reserved.
//

#import "NormalDataStoreEvent.h"

@implementation NormalDataStoreEvent
-(instancetype)initTag:(NSString *)__tag opeType:(int)__opeType obj:(id)__obj{
    if (self=[self initTag:__tag opeType:__opeType]) {
        _obj=__obj;
    }
    return self;
}

@end
