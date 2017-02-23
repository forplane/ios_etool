//
//  ActionsCreatorFactory.h
//  cafe
//
//  Created by jpmac on 2017/1/9.
//  Copyright © 2017年 yidont. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ActionsCreator.h"
@interface ActionsCreatorFactory : NSObject
@property (nonnull,nonatomic,strong) ActionsCreator *actionCreator;

-(nonnull instancetype)initDispatcher:(nonnull Dispatcher*)__dispatcher;
@end
