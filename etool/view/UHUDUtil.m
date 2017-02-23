//
//  HUDUtil.m
//  YiDontWiFi
//
//  Created by yidont on 16/2/20.
//  Copyright © 2016年 yidont. All rights reserved.
//

#import "UHUDUtil.h"
#import "MBProgressHUD.h"
#import "HandlerMsg.h"
@implementation UHUDUtil

+ (void)showTrueHUD:(UIView *)v andText:(NSString*)text block:(void (^)(HandlerMsg *msg))__b{
    MBProgressHUD *HUD = [MBProgressHUD HUDForView:v];
    HUD = [MBProgressHUD showHUDAddedTo:v animated:YES];
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
    // Set custom view mode
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.labelText = text;
    [HUD hide:YES afterDelay:2];
    [NSThread sleepForTimeInterval:1.8];
    HandlerMsg *msg=[HandlerMsg obtainMessage];
    __b(msg);
}

+ (void)showTrueHUD:(UIView *)v andText:(NSString*)text {
    MBProgressHUD *HUD = [MBProgressHUD HUDForView:v];
    HUD = [MBProgressHUD showHUDAddedTo:v animated:YES];

    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
    
    // Set custom view mode
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.labelText = text;
    
    [HUD hide:YES afterDelay:2];
}
@end
