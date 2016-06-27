//
//  CalculatorBrain.m
//  TestMVVC
//
//  Created by Sam Feng on 16/4/7.
//  Copyright © 2016年 beloved999. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
@property (nonatomic,strong,readwrite) NSMutableArray *operations;
@property (nonatomic,strong,readwrite) NSNumber *currentNumber;
@property (nonatomic,assign) BOOL shouldCalculate;
@property (nonatomic,copy) NSString *lastOperate;
@end


@implementation CalculatorBrain

+(CalculatorBrain *)brain{
    static CalculatorBrain * brain = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken , ^{
        brain = [CalculatorBrain new];
    });
    return  brain;
}

- (void)addSuffixNumber:(NSNumber *)number{
    if(!number){
        NSLog(@"number is nul");
        return;
    }
    
    //记录运算符后，当前操作数被清空，用于记录下一个数字
    if(self.shouldCalculate){
        self.currentNumber = nil;
        self.shouldCalculate = NO;
    }
    
    self.currentNumber = @([self.currentNumber integerValue] *10 + number.integerValue);
    if([self.displayDelegate respondsToSelector:@selector(calculator:didChangeCurrentNumber:)]){
        [self.displayDelegate calculator:self didChangeCurrentNumber:self.currentNumber];
    }
}


- (void)addOperate:(NSString *)operate{
    self.shouldCalculate = YES;
    //生产 operation 时做了默认值处理
    CalculatorOperation * operation = [CalculatorOperation operationNumber:self.currentNumber ?:@(0)
                                                                   operate:self.lastOperate?:@""];
    
    [self addOperation:operation];
    //每次记录运算符，为记录上一次运算符，本次运算符等待新数字，与输入方式相反。
    //所以第一次记录运算符为空
    self.lastOperate = operate;
    if ([self.displayDelegate respondsToSelector:@selector(calculator:didAddOperate:)]) {
        [self.displayDelegate calculator:self didAddOperate:operate];
    }
    
}

- (void)removeLastOperation{
    if(self.operations.firstObject){
        [self.operations removeObjectAtIndex:0];
    }
    self.shouldCalculate = YES;
}


- (void)clearOperations{
    self.operations = nil;
    self.currentNumber = @(0);
    self.lastOperate = nil;
    if([self.displayDelegate respondsToSelector:@selector(calculator:didChangeCurrentNumber:)]){
        [self.displayDelegate calculator:self didChangeCurrentNumber:self.currentNumber];
    }

}

- (void)addOperation:(CalculatorOperation *)operation{
    //确保每次赋值时 该属性都存在
    if (!self.operations){
        self.operations = [NSMutableArray array];
    }
    [self.operations insertObject:operation atIndex:0];
}


@end

@implementation CalculatorOperation

+ (CalculatorOperation *)operationNumber:(NSNumber *)number operate :(NSString *)operate{
    CalculatorOperation *operation = self.new;
    if (operation) {
        operation.number = number;
        operation.operate = operate;
    }
    return operation;
}

-(NSNumber *)resultWithNumber:(NSNumber *)number{
    if ([self.operate isEqualToString:@"+"]) {
        return @(number.floatValue + self.number.floatValue);
    }else if([self.operate isEqualToString:@"-"]){
        return @(number.floatValue - self.number.floatValue);
    }else if([self.operate isEqualToString:@"*"]){
        return @(number.floatValue * self.number.floatValue);
    }else if([self.operate isEqualToString:@"/"]){
        if ([self.number isEqualToNumber:@(0)]) {
            NSLog(@"0 can not be divisor.");
            return number;
        }
        return @(number.floatValue / self.number.floatValue);
    }else{
        NSLog(@"unknown operator:%@",self.operate);
        return self.number;
    }
}

- (NSString *)description{
    return [NSString stringWithFormat:@"%@%@",self.operate,self.number];
}
@end







