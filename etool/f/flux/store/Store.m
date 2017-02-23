//
//  Store.m
//  cafe
//
//  Created by jpmac on 2017/1/9.
//  Copyright © 2017年 yidont. All rights reserved.
//

#import "Store.h"
@interface Store(){
@protected id<IFluxBaseHelper> subscriber;
}

@end

@implementation Store


-(void)registerSub:(id<IFluxBaseHelper>)__subscriber{
    subscriber=__subscriber;
}

-(void)unregisterSub:(id<IFluxBaseHelper>)__subscriber{
    subscriber=nil;
}

-(void)emitStoreChange:(StoreChangeEvent*)__storeChangeEvent{
    if (subscriber!=nil) {
        [subscriber onViewUpdate:__storeChangeEvent];
    }
}

-(void)emitStoreChange:(NSString *)__tag opeType:(int)__opeType{
    [self emitStoreChange:[self changeEvent:__tag opeType:__opeType]];
}


-(void)onAction:(Action*)action{
    //nothing
}
@end
