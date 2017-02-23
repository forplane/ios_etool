//
//  Action.m
//  cafe
//
//  Created by jpmac on 2017/1/9.
//  Copyright © 2017年 yidont. All rights reserved.
//

#import "Action.h"

@implementation Action

-(instancetype)init:(NSString *)__tag opeType:(int)__opeType data:(id)__data{
    if (self =[super init]) {
        _tag=__tag;
        _opeType=__opeType;
        _data=__data;
    }
    return self;
}
@end
