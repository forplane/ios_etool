//
//  OpeDelegate.h
//  cafe
//
//  Created by jpmac on 2017/1/9.
//  Copyright © 2017年 yidont. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoadDelegate.h"
@protocol OpeDelegate <NSObject>
-(void)opeNoData;
-(void)opeNoNet;
-(void)opeError;
-(void)opeDismiss;
-(void)opeShow;


-(void)setLoadDelegate:(id<LoadDelegate>)__loadDel;
@end
