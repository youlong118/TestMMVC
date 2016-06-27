//
//  ViewController.m
//  TestMVVC
//
//  Created by Sam Feng on 16/4/7.
//  Copyright © 2016年 beloved999. All rights reserved.
//

#import "BottomViewController.h"
#import "BottomViewModel.h"

@interface BottomViewController ()
@property (nonatomic,strong) BottomViewModel *model;
@end

@implementation BottomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.model = [BottomViewModel modelWithViewController:self];
}

-(IBAction)number:(UIButton *)sender{
    NSNumber *number = @(sender.titleLabel.text.integerValue);
    [self.model setNumber:number];
}

-(IBAction)operator:(UIButton *)sender{
    NSString *operator = sender.titleLabel.text;
    [self.model setOperate:operator];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
