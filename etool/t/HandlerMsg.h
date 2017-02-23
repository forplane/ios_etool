//
//  HandlerMsg.h
//  cafe
//
//  Created by jpmac on 2017/1/5.
//  Copyright © 2017年 yidont. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 * 模仿android的Message对象
 */
@interface HandlerMsg : NSObject
    @property NSInteger what;
    @property id obj;

    
    
+(instancetype)obtainMessage;
@end
/**消息通知块，类似于android的Handler*/
typedef void (^HandlerBlock)(HandlerMsg *msg);
typedef id (^HandlerBlockData)(HandlerMsg *msg);
