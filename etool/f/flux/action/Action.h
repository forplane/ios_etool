//
//  Action.h
//  cafe
//
//  Created by jpmac on 2017/1/9.
//  Copyright © 2017年 yidont. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NOACTION_TYPE 963258

@interface Action : NSObject
@property (readonly,nonnull,nonatomic) NSString *tag;
@property (readonly) int opeType;
@property (readonly,nonnull,nonatomic) id data;

-(nonnull instancetype)init:(nonnull NSString*)__tag opeType:(int)__opeType data:(nonnull id)__data;
@end
