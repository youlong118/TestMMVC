//
//  BottomViewModel.m
//  TestMVVC
//
//  Created by Sam Feng on 16/4/7.
//  Copyright © 2016年 beloved999. All rights reserved.
//

#import "BottomViewModel.h"
#import "CalculatorBrain.h"

@implementation BottomViewModel

-(void)setNumber:(NSNumber *)number{
    [[CalculatorBrain brain] addSuffixNumber:number];
}


-(void)setOperate:(NSString *)operate{
    [[CalculatorBrain brain] addOperate:operate];
}


@end
