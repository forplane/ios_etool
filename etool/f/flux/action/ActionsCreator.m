//
//  ActionsCreator.m
//  cafe
//
//  Created by jpmac on 2017/1/9.
//  Copyright © 2017年 yidont. All rights reserved.
//

#import "ActionsCreator.h"

@implementation ActionsCreator
static ActionsCreator *instance;

+(instancetype)get:(Dispatcher *)__dispatcher{
    if (instance==nil) {
        instance=[[ActionsCreator alloc]init];
        instance->dispatcher=__dispatcher;
    }
    return instance;
}

-(Dispatcher*)getDispatcher{
    return dispatcher;
}
-(void)sendMessage:(Action *)action{
    [dispatcher dispatch:action];
}
@end
