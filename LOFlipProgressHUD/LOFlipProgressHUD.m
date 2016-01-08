//
//  LOFlipProgressHUD.m
//  LOFlipProgressHUD
//
//  Created by Kuo-HsunShih on 2016/1/8.
//  Copyright © 2016年 funtek. All rights reserved.
//

#import "LOFlipProgressHUD.h"

LOFlipProgressHUD *flipProgressHUDEntity;

#define kContentViewSize 100
#define kAnimationDuration 2

@interface LOFlipProgressHUD () {
    int flipTemp;
}

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIImageView *flipImageView;

@end

@implementation LOFlipProgressHUD

+ (instancetype)shareInstance {
    if (!flipProgressHUDEntity) {
        flipProgressHUDEntity = [[LOFlipProgressHUD alloc] init];
    }

    
    return flipProgressHUDEntity;
}

+ (void)show {
    [flipProgressHUDEntity showHUD];
}

+ (void)hide {
    [flipProgressHUDEntity removeFromSuperview];
}

- (void)showHUD {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.frame = [UIApplication sharedApplication].delegate.window.frame;
        [[UIApplication sharedApplication].delegate.window addSubview:self];
        
        [self flip];
    });
}

#pragma mark - private

- (void)flip {
    flipTemp = abs(flipTemp) - 1;
    
//    UIViewAnimationOptions option = (flipTemp == 0) ? UIViewAnimationOptionTransitionFlipFromLeft : UIViewAnimationOptionTransitionFlipFromRight;
    
    [UIView transitionWithView:self.flipImageView duration:kAnimationDuration/2 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        
    } completion:^(BOOL finished) {
        [UIView transitionWithView:self.flipImageView duration:kAnimationDuration/2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            
        } completion:^(BOOL finished) {
            [self flip];
        }];
    }];
}

#pragma mark - getter

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
        [self addSubview:_contentView];
        _contentView.layer.cornerRadius = 8;
    }
    _contentView.frame = CGRectMake(0, 0, kContentViewSize, kContentViewSize);
    
    _contentView.center = CGPointMake([UIApplication sharedApplication].delegate.window.frame.size.width / 2,
                                      [UIApplication sharedApplication].delegate.window.frame.size.height / 2);
    
    _contentView.backgroundColor = self.foregroundColor;
    
    return _contentView;
}

- (UIImageView *)flipImageView {
    if (!_flipImageView) {
        _flipImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_flipImageView];
    }
    
    _flipImageView.frame  = CGRectMake(0, 0, self.contentView.frame.size.width * 0.8, self.contentView.frame.size.height * 0.8);
    _flipImageView.center = CGPointMake(self.contentView.frame.size.width / 2, self.contentView.frame.size.height / 2);
    
    _flipImageView.animationImages   = self.images;
    _flipImageView.animationDuration = kAnimationDuration * self.images.count;
    [_flipImageView startAnimating];
    
    return _flipImageView;
}

- (UIColor *)foregroundColor {
    if (!_foregroundColor) {
        _foregroundColor = [UIColor whiteColor];
    }
    return _foregroundColor;
}

@end
