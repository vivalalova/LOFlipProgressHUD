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
    
    
    [LOFlipProgressHUD shareInstance].images =
    
    [LOFlipProgressHUD show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
