//
//  ViewController.m
//  LOFlipProgressHUD
//
//  Created by Kuo-HsunShih on 2016/1/8.
//  Copyright © 2016年 funtek. All rights reserved.
//

#import "ViewController.h"
#import "LOFlipProgressHUD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    for (int i = 0; i<10000; i++) {
        
    }
    
    [LOFlipProgressHUD shareInstance].images =@[
                                                [UIImage imageNamed:@"poo"],
                                                [UIImage imageNamed:@"unicorn"],
                                                [UIImage imageNamed:@"year_of_monkey"],
                                                [UIImage imageNamed:@"year_of_rabbit"],
                                                [UIImage imageNamed:@"year_of_rat"],
                                                ];
    
    [LOFlipProgressHUD show];
}



@end
