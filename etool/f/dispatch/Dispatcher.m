//
//  Dispatcher.m
//  cafe
//
//  Created by jpmac on 2017/1/9.
//  Copyright © 2017年 yidont. All rights reserved.
//

#import "Dispatcher.h"

@interface Dispatcher(){
@private NSMutableDictionary *storeHash;
}

@end


@implementation Dispatcher
static Dispatcher *instance;


+(NSString*)fluxClassKey:(id)classId{
    NSString *className=NSStringFromClass([classId class]);
    className=[NSString stringWithFormat:@"flux_%@",className];
    return className;
}
+(NSString*)fluxStringKey:(NSString*)stringId{
    stringId=[NSString stringWithFormat:@"flux_%@",stringId];
    return stringId;
}

+(instancetype)get{
    if (instance==nil) {
        instance=[[Dispatcher alloc]init];
        instance->storeHash=[[NSMutableDictionary alloc]init];
    }
    return instance;
}

-(void)registerSub:(id<IFluxBaseHelper>)__subscriber Store:(Store *)__store{
    if (__store!=nil) {
        [__store registerSub:__subscriber];
        NSString *key= [Dispatcher fluxClassKey:__subscriber];
        [storeHash setObject:__store forKey:key];
    }
}
-(void)unregisterSub:(id<IFluxBaseHelper>)__subscriber store:(Store *)__store{
    if (__store!=nil) {
        [__store unregisterSub:__subscriber];
        NSString *key= [Dispatcher fluxClassKey:__subscriber];
        [storeHash removeObjectForKey:key];
    }
}

-(void)dispatch:(Action *)action{
    [self post:action];
}

-(void)post:(Action*)action{
    Store *store= [storeHash objectForKey:action.tag];
    if (store!=nil) {
        [store onAction:action];
    }
}









@end
