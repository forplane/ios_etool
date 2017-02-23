//
//  UITableViewCell+SetNormal.h
//  HaiLeStore
//
//  Created by gzh on 16/6/20.
//  Copyright © 2016年 YiDont. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ScrollCellDelegate <NSObject>
-(void)setData:(id)_id;
@end

@interface UITableViewCell (SetNormal)<ScrollCellDelegate>
@end
