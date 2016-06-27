//
//  CalculatorBrain.h
//  TestMVVC
//
//  Created by Sam Feng on 16/4/7.
//  Copyright © 2016年 beloved999. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CalculatorBrain;
@protocol CalculatorDispalyDelegate <NSObject>

@optional
- (void)calculator:(CalculatorBrain *)brain didAddOperate:(NSString *)operate;
- (void)calculator:(CalculatorBrain *)brain didChangeCurrentNumber:(NSNumber *)number;
@end


@interface CalculatorBrain : NSObject

@property (nonatomic,weak) id<CalculatorDispalyDelegate> displayDelegate;

@property (nonatomic,strong,readonly) NSMutableArray *operations;

+(CalculatorBrain *)brain;

/**
 *  新增一个数字
 *
 */
- (void)addSuffixNumber:(NSNumber *)number;

/**
 *  新增一个操作符，同时意味着上一个数字结束
 *
 */
- (void)addOperate:(NSString *)operate;

/**
 *  删除最后一个运算步骤
 */
- (void)removeLastOperation;

/**
 *  清空运算步骤
 */
- (void)clearOperations;

- (NSNumber *)result;

- (NSString *)displayString;

@end


@interface CalculatorOperation : NSObject

/**
 *  运算符，字符表示，暂时支持 + - * /
 */
@property (nonatomic,copy) NSString *operate;

/**
 *  操作数，记得用 float 转哦~
 */
@property (nonatomic,strong) NSNumber *number;

/**
 *  工厂方法，用于生产一个包含操作数与运算符的运算过程
 *
 *  @param number  操作数
 *  @param operate 运算符
 *
 */
+ (CalculatorOperation *)operationNumber:(NSNumber *)number operate:(NSString *)operate;

/**
 *  成功计算会返回运算后的值，运算如有问题则会返回 number 本身
 *
 */
- (NSNumber *)resultWithNumber:(NSNumber *)number;

@end