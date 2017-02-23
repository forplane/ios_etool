//
//  NormalActionCreator.m
//  Pods
//
//  Created by jpmac on 2017/1/9.
//
//

#import "NormalActionCreator.h"
#import "IActionEntityBuilder.h"
#import "NormalDataActionEntity.h"
#import "NormalActionEntity.h"
#import "IActionEntityBuilder.h"
@class IActionEntityBuilder;
@implementation NormalActionCreator


+(instancetype)get{
    return [[NormalActionCreator alloc]initDispatcher:[Dispatcher get]];
}

-(void)post:(NSString *)__tag{
    [self post:__tag opeType:NOACTION_TYPE];
}
-(void)post:(NSString *)__tag obj:(id)__obj{
    id builder= [[[NormalDataActionEntity alloc]init] setObj:__obj];
    [self post:__tag opeType:NOACTION_TYPE builder:builder];
    
}
-(void)post:(NSString *)__tag opeType:(int)__opetype{
    id builder= [[NormalActionEntity alloc]init];
    [self post:__tag opeType:__opetype builder:builder];

}
-(void)post:(NSString *)__tag opeType:(int)__opetype obj:(id)__obj{
    id builder= [[[NormalDataActionEntity alloc]init] setObj:__obj];
    [self post:__tag opeType:__opetype builder:builder];
}
-(void)post:(NSString*)__tag opeType:(int)__opetype builder:(id<IActionEntityBuilder>)build{
    Action *action=[build buildWithTag:__tag opeType:__opetype];
    [self.actionCreator sendMessage:action];
}
@end
