//
//  Dispatcher.h
//  cafe
//
//  Created by jpmac on 2017/1/9.
//  Copyright © 2017年 yidont. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Store.h"
@interface Dispatcher : NSObject

+(NSString*)fluxClassKey:(id)classId;
+(NSString*)fluxStringKey:(NSString*)stringId;

+(instancetype)get;
-(void)registerSub:(id<IFluxBaseHelper>)__subscribersubscriber Store:(Store*)__store;
-(void)unregisterSub:(id<IFluxBaseHelper>)__subscriber store:(Store*)__store;
-(void)dispatch:(Action*)action;
@end
