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

+ (instancetype)shareInstance;

+ (void)show;
+ (void)hide;
@end
