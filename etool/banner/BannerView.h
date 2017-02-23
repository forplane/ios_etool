//
//  BannerView.h
//  etool
//
//  Created by jpmac on 2017/2/22.
//  Copyright © 2017年 yidont. All rights reserved.
//

#define BANNER_W     [UIScreen mainScreen].bounds.size.width
#define BANNER_H     [UIScreen mainScreen].bounds.size.height



#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"




@protocol BannerViewDelegate <NSObject>
@optional
/** 点击图片回调 */
- (void)didSelectItemAtIndex:(NSInteger)index;
/** 图片滚动回调 */
- (void)didScrollToIndex:(NSInteger)index;
@end



@interface BannerView : UIView<SDCycleScrollViewDelegate>{

}
@property (nonnull,nonatomic,readonly) SDCycleScrollView *cycleScroll;
@property (nonnull,nonatomic,readonly) NSMutableArray *list;
+(nonnull instancetype)initPoint:(CGPoint)xy Data:(nonnull NSMutableArray*)__list delegate:(nullable id<BannerViewDelegate>)__del;
@end
