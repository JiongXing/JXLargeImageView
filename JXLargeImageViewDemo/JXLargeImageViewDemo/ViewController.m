//
//  ViewController.m
//  JXLargeImageViewDemo
//
//  Created by JiongXing on 2016/11/22.
//  Copyright © 2016年 JiongXing. All rights reserved.
//

#import "ViewController.h"
#import "JXLargeImageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *sv = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:sv];
    
    UIImage *image = [UIImage imageNamed:@"BigPicture"];
    JXLargeImageView *view = [[JXLargeImageView alloc] initWithImage:image];
    view.frame = CGRectMake(0, 0, sv.bounds.size.width, sv.bounds.size.width * image.size.height / image.size.width);
    [sv addSubview:view];
    sv.contentSize = view.bounds.size;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
