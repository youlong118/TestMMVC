//
//  TopViewModel.m
//  TestMVVC
//
//  Created by Sam Feng on 16/4/7.
//  Copyright © 2016年 beloved999. All rights reserved.
//

#import "TopViewModel.h"
#import "CalculatorBrain.h"

@interface TopViewModel()<CalculatorDispalyDelegate>
-(CalculatorBrain *)calculatorBrain;
@end


@implementation TopViewModel

-(instancetype) init{
    self = [super init];
    if(self){
        self.calculatorBrain.displayDelegate = self;
    }
    return self;
}

-(NSString *)LEDString{
    return  self.calculatorBrain.displayString;
}

- (NSUInteger)operationCount{
    return self.calculatorBrain.operations.count;
}



-(NSString *)operationTextAtIndex:(NSUInteger)index{
    return [self.calculatorBrain.operations[index] description];
}

-(void)undo{
    [self.calculatorBrain removeLastOperation];
    [self.viewController callBackAction:TopViewCallBackActionReloadResult | TopViewCallBackActionReloadTable];
}

-(void)clear{
    [self.calculatorBrain clearOperations];
    [self.viewController callBackAction:TopViewCallBackActionReloadResult | TopViewCallBackActionReloadTable];
}

#pragma mark - BCCalculatorDisplayDelegate
-(void) calculator:(CalculatorBrain *)brain didAddOperate:(NSString *)operate{
    [self.viewController callBackAction:TopViewCallBackActionReloadResult | TopViewCallBackActionReloadTable];
    
}

-(void)calculator:(CalculatorBrain *)brain didChangeCurrentNumber:(NSNumber *)number{
    [self.viewController callBackAction:TopViewCallBackActionReloadResult];
}






#pragma mark - getter

- (CalculatorBrain *)calculatorBrain{
    return [CalculatorBrain brain];
}
@end
