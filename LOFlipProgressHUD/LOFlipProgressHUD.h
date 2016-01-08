//
//  LOFlipProgressHUD.h
//  LOFlipProgressHUD
//
//  Created by Kuo-HsunShih on 2016/1/8.
//  Copyright © 2016年 funtek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LOFlipProgressHUD : UIView

@property (nonatomic, strong) NSArray <UIImage *> *images;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UIColor *foregroundColor;
+ (instancetype)shareInstance;

+ (void)show;
+ (void)hide;
@end
