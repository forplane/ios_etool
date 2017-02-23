//
//  IActionEntityBuilder.h
//  cafe
//
//  Created by jpmac on 2017/1/9.
//  Copyright © 2017年 yidont. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Action;


@protocol IActionEntityBuilder <NSObject>
-(Action*)buildWithTag:(NSString*)__tag opeType:(int)__opeType;
@end
