//
//  StoreChangeEvent.h
//  cafe
//
//  Created by jpmac on 2017/1/9.
//  Copyright © 2017年 yidont. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StoreChangeEvent : NSObject

@property (nonnull,nonatomic,readonly) NSString *tag;
@property (readonly) int opeType;
-(nonnull instancetype)initTag:(nonnull NSString*)__tag opeType:(int)__opeType;
@end
