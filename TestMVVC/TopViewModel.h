//
//  TopViewModel.h
//  TestMVVC
//
//  Created by Sam Feng on 16/4/7.
//  Copyright © 2016年 beloved999. All rights reserved.
//

#import "BaseViewModel.h"

typedef NS_ENUM(ViewControllerAction,TopViewCallBackAction){
    TopViewCallBackActionReloadTable = 1 << 0,
    TopViewCallBackActionReloadResult = 1 << 1
};



@interface TopViewModel : BaseViewModel

- (NSString *)LEDString;

- (NSUInteger)operationCount;

- (NSString *)operationTextAtIndex:(NSUInteger)index;

- (void)undo;

- (void)clear;



@end
