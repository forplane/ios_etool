//
//  ViewController.m
//  etool
//
//  Created by jpmac on 2017/2/22.
//  Copyright © 2017年 yidont. All rights reserved.
//

#import "ViewController.h"
#import "BannerView.h"
@interface ViewController ()<BannerViewDelegate>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self bannering];
    self.view.backgroundColor=[UIColor blueColor];
    self.view.alpha=.4f;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark banner
-(void)bannering{
    NSMutableArray *list=[[NSMutableArray alloc]init];
    NSArray *ars=@[@"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=3598755140,2045060387&fm=80&w=179&h=119&img.JPEG",
                   @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3299134587,1427667257&fm=80&w=179&h=119&img.JPEG",
                   @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1474959676,2603422985&fm=80&w=179&h=119&img.JPEG",
                   @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=4127051214,2597844150&fm=80&w=179&h=119&img.JPEG"];
    for (int a=0; a<ars.count; a++) {
        NSString *url= ars[a];
        NSDictionary *d=[NSDictionary dictionaryWithObjectsAndKeys:url,@"adImg", nil];
        [list addObject:d];
    }
    CGPoint point=CGPointMake(0, 64);
    UIView *ban=[BannerView initPoint:point Data:list delegate:self];
    [self.view addSubview:ban];
}


@end
