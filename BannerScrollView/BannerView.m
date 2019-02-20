//
//  BannerView.m
//  轮播无限
//
//  Created by wdyzmx on 2018/9/12.
//  Copyright © 2018年 wdyzmx. All rights reserved.
//

#import "BannerView.h"
@interface BannerView ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIImageView *leftImgView;//左
@property (nonatomic, strong) UIImageView *centerImgView;//中
@property (nonatomic, strong) UIImageView *rightImgView;//右

@property (nonatomic, strong) UILabel *leftlb;//左
@property (nonatomic, strong) UILabel *centerlb;//中
@property (nonatomic, strong) UILabel *rightlb;//右

@property (nonatomic, strong) NSMutableArray *imageArr;//数据源

@property (nonatomic, strong) UIScrollView *scrollView;//轮播
@end

@implementation BannerView
-(instancetype)initWithFrame:(CGRect)frame imageArray:(NSArray *)imageArr{
    if (self = [super initWithFrame:frame]) {
        self.imageArr = [NSMutableArray arrayWithArray:imageArr];
        [self.imageArr insertObject:self.imageArr[self.imageArr.count-1] atIndex:0];
        [self.imageArr removeObjectAtIndex:self.imageArr.count-1];
        NSLog(@"%@", self.imageArr[0]);
        NSLog(@"%@", self.imageArr[1]);
        NSLog(@"%@", self.imageArr[2]);
        NSLog(@"%@", self.imageArr[3]);
        [self addSubview:self.scrollView];
    }
    return self;
}
#pragma mark ========== UIScrollViewDelegate ==========
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat offsetX = scrollView.contentOffset.x/scrollView.frame.size.width;
    NSLog(@"%.1f", offsetX);
    
    //调整数据源数据位置
    
    if (offsetX==0) {
        [self.imageArr insertObject:self.imageArr[self.imageArr.count-1] atIndex:0];
        [self.imageArr removeObjectAtIndex:self.imageArr.count-1];
    }
    if (offsetX==2) {
        [self.imageArr addObject:self.imageArr[0]];
        [self.imageArr removeObjectAtIndex:0];
    }
    self.leftlb.text = self.imageArr[0];
    self.centerlb.text = self.imageArr[1];
    self.rightlb.text = self.imageArr[2];
    [self.scrollView setContentOffset:CGPointMake(self.frame.size.width, 0) animated:NO];
}
#pragma mark ========== 懒加载 ==========
-(UIScrollView *)scrollView{
    if (_scrollView==nil) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.delegate = self;
        _scrollView.contentSize = CGSizeMake(self.frame.size.width*3, 200);
        _scrollView.contentOffset = CGPointMake(self.frame.size.width, 0);
        _scrollView.pagingEnabled = YES;
        _scrollView.backgroundColor = [UIColor whiteColor];
        for (int i=0; i<3; i++) {
//            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(i*self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
//            [_scrollView addSubview:imgView];
            UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(i*self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
            [_scrollView addSubview:lb];
            lb.text = self.imageArr[i];
            lb.textAlignment = NSTextAlignmentCenter;
            lb.textColor = [UIColor whiteColor];
            lb.backgroundColor = [UIColor orangeColor];
            if (i==0) {
                self.leftlb = lb;
            }
            if (i==1) {
                self.centerlb = lb;
            }
            if (i==2) {
                self.rightlb = lb;
            }
        }
    }
    return _scrollView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
