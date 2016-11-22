//
//  JXLargeImageView.m
//  JXLargeImageViewDemo
//
//  Created by JiongXing on 2016/11/22.
//  Copyright © 2016年 JiongXing. All rights reserved.
//

#import "JXLargeImageView.h"

@interface JXLargeImageView ()

@property (nonatomic, strong) NSMutableArray<UIImageView *> *imageViewArray;

@end

@implementation JXLargeImageView {
    UIViewContentMode _contentMode;
    UIImage *_image;
}

- (instancetype)initWithImage:(UIImage *)image {
    if (self = [super initWithImage:image]) {
        self.image = image;
        [self sizeToFit];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat imageWidth = self.bounds.size.width;
    CGFloat maxImageHeight = imageWidth * self.maxHeightFator;
    if (maxImageHeight == 0) {
        return;
    }
    NSInteger count = ceil(self.bounds.size.height / maxImageHeight);
    
    [self.imageViewArray enumerateObjectsUsingBlock:^(UIImageView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat height = (idx == count - 1) ? self.bounds.size.height - maxImageHeight * idx : maxImageHeight;
        obj.frame = CGRectMake(0, idx * maxImageHeight, imageWidth, height);
    }];
}

- (void)sizeToFit {
    self.bounds = CGRectMake(0, 0, self.image.size.width, self.image.size.height);
}

- (CGSize)sizeThatFits:(CGSize)size {
    return self.image.size;
}

- (void)setImage:(UIImage *)image {
    _image = image;
    
    [self.imageViewArray enumerateObjectsUsingBlock:^(UIImageView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    [self.imageViewArray removeAllObjects];
    if (!image) {
        return;
    }
    
    CGFloat imageWidth = image.size.width;
    CGFloat maxImageHeight = imageWidth * self.maxHeightFator;
    if (maxImageHeight == 0) {
        return;
    }
    NSInteger count = ceil(image.size.height / maxImageHeight);
    
    for (NSInteger index = 0; index < count; ++ index) {
        CGFloat height = (index == count - 1) ? image.size.height - maxImageHeight * index : maxImageHeight;
        CGImageRef imgRef = CGImageCreateWithImageInRect(image.CGImage, CGRectMake(0, index * maxImageHeight, imageWidth, height));
        UIImageView *view = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:imgRef]];
        view.contentMode = self.contentMode;
        [self addSubview:view];
        [self.imageViewArray addObject:view];
    }
    [self setNeedsLayout];
}

- (void)setContentMode:(UIViewContentMode)contentMode {
    _contentMode = contentMode;
    [self.imageViewArray enumerateObjectsUsingBlock:^(UIImageView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.contentMode = contentMode;
    }];
}

- (UIImage *)image {
    return _image;
}

- (UIViewContentMode)contentMode {
    return _contentMode;
}

- (NSInteger)maxHeightFator {
    if (!_maxHeightFator) {
        _maxHeightFator = 5;
    }
    return _maxHeightFator;
}

- (NSMutableArray<UIImageView *> *)imageViewArray {
    if (!_imageViewArray) {
        _imageViewArray = [NSMutableArray array];
    }
    return _imageViewArray;
}

@end
