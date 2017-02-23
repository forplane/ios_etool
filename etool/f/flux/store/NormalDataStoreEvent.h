//
//  NormalDataStoreEvent.h
//  cafe
//
//  Created by jpmac on 2017/1/9.
//  Copyright © 2017年 yidont. All rights reserved.
//

#import "NormalStoreEvent.h"

@interface NormalDataStoreEvent : NormalStoreEvent
@property (nonatomic,readonly) id obj;

-(instancetype)initTag:(NSString *)__tag opeType:(int)__opeType obj:(id)__obj;
@end
