//
//  UIImageView+ImgUtil.m
//  cafe
//
//  Created by jpmac on 2017/1/8.
//  Copyright © 2017年 yidont. All rights reserved.
//

#import "UIImageView+ImgUtil.h"

@implementation UIImageView (ImgUtil)



-(void)img_url:(NSString*)url style:(IMGSTYLE)style{
    NSURL *u=[NSURL URLWithString:url];
    if (style == IMGSTYLEICON) {
        [self sd_setImageWithURL:u placeholderImage:[UIImage imageNamed:style_icon]];
    }
    if (style == IMGSTYLEBANNER) {
        [self sd_setImageWithURL:u placeholderImage:[UIImage imageNamed:style_banner]];
    }
    if (style == IMGSTYLEVERTICAL) {
        [self sd_setImageWithURL:u placeholderImage:[UIImage imageNamed:style_vertical]];
    }
}

-(void)img_url:(NSString*)url style:(IMGSTYLE)style corner:(CGFloat)cor{
    [self img_url:url style:style];
    self.layer.cornerRadius =cor;
    self.layer.borderWidth =1.0;
}

@end
