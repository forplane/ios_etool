//
//  INormalAction.h
//  cafe
//
//  Created by jpmac on 2017/1/9.
//  Copyright © 2017年 yidont. All rights reserved.
//

#import "Action.h"
#define TYPE_NORMAL_NOTHING 0
#define TYPE_NORMAL_OBJ     TYPE_NORMAL_NOTHING+1
@interface INormalAction : Action
@property (readonly) int nortype;



-(instancetype)init:(NSString *)__tag opeType:(int)__opeType nortype:(int)__nortype data:(id)__data;
@end
