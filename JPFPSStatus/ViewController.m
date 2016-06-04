//
//  ViewController.m
//  JPFPSStatus
//
//  Created by coderyi on 16/6/4.
//  Copyright © 2016年 coderyi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor whiteColor];
    
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(0, 300, [[UIScreen mainScreen] bounds].size.width, 40)];
    [self.view addSubview:label];
    label.textAlignment=NSTextAlignmentCenter;
    label.text=@"...............";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
