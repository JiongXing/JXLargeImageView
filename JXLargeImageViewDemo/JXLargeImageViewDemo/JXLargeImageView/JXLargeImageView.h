//
//  JXLargeImageView.h
//  JXLargeImageViewDemo
//
//  Created by JiongXing on 2016/11/22.
//  Copyright © 2016年 JiongXing. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 切分大图，用多个小图来显示。只支持竖直的长图
@interface JXLargeImageView : UIImageView

/// 单块图片最大高度因子，宽度的倍数。默认为5
@property (nonatomic, assign) NSInteger maxHeightFator;

@end
