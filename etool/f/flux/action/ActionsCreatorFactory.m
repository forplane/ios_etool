//
//  ActionsCreatorFactory.m
//  cafe
//
//  Created by jpmac on 2017/1/9.
//  Copyright © 2017年 yidont. All rights reserved.
//

#import "ActionsCreatorFactory.h"

@implementation ActionsCreatorFactory

-(instancetype)initDispatcher:(Dispatcher *)__dispatcher{
    if (self=[super init]) {
        _actionCreator=[ActionsCreator get:__dispatcher];
    }
    return self;
}
@end
