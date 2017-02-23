//
//  NormalDataActionEntity.h
//  cafe
//
//  Created by jpmac on 2017/1/9.
//  Copyright © 2017年 yidont. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IActionEntityBuilder.h"
@interface NormalDataActionEntity : NSObject<IActionEntityBuilder>
@property (nonatomic,readonly) id obj;
-(instancetype)setObj:(id)__obj;

@end
