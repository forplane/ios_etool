//
//  INormalAction.m
//  cafe
//
//  Created by jpmac on 2017/1/9.
//  Copyright © 2017年 yidont. All rights reserved.
//

#import "INormalAction.h"


@implementation INormalAction


-(instancetype)init:(NSString *)__tag opeType:(int)__opeType nortype:(int)__nortype data:(id)__data{
    if (self=[super init:__tag opeType:__opeType data:__data]) {
        _nortype=__nortype;
    }
    return self;
}
@end
