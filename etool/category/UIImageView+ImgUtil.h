//
//  UIImageView+ImgUtil.h
//  cafe
//
//  Created by jpmac on 2017/1/8.
//  Copyright © 2017年 yidont. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"

static NSString *style_def,*style_icon,*style_banner,*style_vertical;
typedef NS_ENUM(NSInteger, IMGSTYLE) {
    IMGSTYLEICON,   //一般小图标加载
    IMGSTYLEBANNER, //banner，或者说水平放下图片加载
    IMGSTYLEVERTICAL//竖直方向图片加载
};

@interface UIImageView (ImgUtil)

-(void)img_url:(NSString*)url style:(IMGSTYLE)style;
-(void)img_url:(NSString*)url style:(IMGSTYLE)style corner:(CGFloat)cor;
@end
