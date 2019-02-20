//
//  ViewController.m
//  BannerScrollView
//
//  Created by Macmini on 2019/2/20.
//  Copyright © 2019 Macmini. All rights reserved.
//

#import "ViewController.h"
#import "BannerView.h"
#define kscreenWidth [UIScreen mainScreen].bounds.size.width
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    BannerView *bannerView = [[BannerView alloc] initWithFrame:CGRectMake(0, [UIApplication sharedApplication].statusBarFrame.size.height, kscreenWidth, 200) imageArray:@[@"第一张", @"第二张", @"第三张", @"第四张"]];
    [self.view addSubview:bannerView];
    // Do any additional setup after loading the view, typically from a nib.
}


@end
