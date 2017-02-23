//
//  ActionsCreator.h
//  cafe
//
//  Created by jpmac on 2017/1/9.
//  Copyright © 2017年 yidont. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dispatcher.h"
@interface ActionsCreator : NSObject{
@private Dispatcher *dispatcher;
}
+(instancetype)get:(Dispatcher*)__dispatcher;

-(Dispatcher*)getDispatcher;

-(void)sendMessage:(Action*)action;
@end
