//
//  HUDUtil.h
//  YiDontWiFi
//
//  Created by yidont on 16/2/20.
//  Copyright © 2016年 yidont. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class HandlerMsg;
@interface UHUDUtil : NSObject

+(void)showTrueHUD:(UIView *)v andText:(NSString*)text block:(void (^)(HandlerMsg *msg))__b;

+ (void)showTrueHUD:(UIView *)v andText:(NSString*)text;
@end
