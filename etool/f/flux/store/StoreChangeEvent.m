//
//  StoreChangeEvent.m
//  cafe
//
//  Created by jpmac on 2017/1/9.
//  Copyright © 2017年 yidont. All rights reserved.
//

#import "StoreChangeEvent.h"

@interface StoreChangeEvent(){

}

@end

@implementation StoreChangeEvent

-(instancetype)initTag:(NSString *)__tag opeType:(int)__opeType{
    if (self=[super init]) {
        _tag=__tag;
        _opeType=__opeType;
    }
    return  self;
}

@end
