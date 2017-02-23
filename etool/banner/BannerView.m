//
//  BannerView.m
//  etool
//
//  Created by jpmac on 2017/2/22.
//  Copyright © 2017年 yidont. All rights reserved.
//

#import "BannerView.h"
#import "BannerX.h"
#import "Global.h"

static const int kBannerViewH = 150;//banner的默认高度



@implementation BannerView{
    @private id del;
}
-(void)confData:(NSMutableArray*)__list delegate:(id)__del{
    CGRect frame=CGRectMake(0, 0, BANNER_W, kBannerViewH);
    _list=[[NSMutableArray alloc]init];
    [self.list addObjectsFromArray:__list];
    
    NSMutableArray *ars=[[NSMutableArray alloc]init];
    for (int i=0; i<self.list.count; i++) {
        NSDictionary *di= self.list[i];
        NSString *value= di[@"adImg"];
        [ars addObject:value];
    }
    NSArray *imagesURLStrings=ars;
    UIImage *banDef=[UIImage imageNamed:style_banner];
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:frame delegate:self placeholderImage:banDef];
    cycleScrollView.imageURLStringsGroup = imagesURLStrings;
    cycleScrollView.backgroundColor=[UIColor purpleColor];
    cycleScrollView.pageControlAliment=SDCycleScrollViewPageContolAlimentRight;
    [self addSubview:cycleScrollView];
}

+(instancetype)initPoint:(CGPoint)xy Data:(NSMutableArray *)__list delegate:(id<BannerViewDelegate>)__del{
    BannerView *bannerV=[[BannerView alloc]init];
    bannerV.frame=CGRectMake(xy.x, xy.y, BANNER_W, kBannerViewH);
    [bannerV confData:__list delegate:__del];
    return bannerV;
}


#pragma mark cycleScrollView代理协议方法
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    [BannerX post:self.list[index]];
    if (del && [del respondsToSelector:@selector(didSelectItemAtIndex:)]) {
        [del didSelectItemAtIndex:index];
    }
}

/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{
    if (del && [del respondsToSelector:@selector(didScrollToIndex:)]) {
        [del didScrollToIndex:index];
    }

}
@end
