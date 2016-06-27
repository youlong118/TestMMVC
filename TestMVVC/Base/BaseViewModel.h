//
//  BaseViewModel.h
//  TestMVVC
//
//  Created by Sam Feng on 16/4/7.
//  Copyright © 2016年 beloved999. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NSUInteger ViewControllerAction;

@interface UIViewController(viewModel)
-(void)callBackAction;
-(void)callBackAction:(ViewControllerAction)action;
-(void)callBackAction:(ViewControllerAction)action  info:(id)info;
@end






@interface BaseViewModel : NSObject

@property (nonatomic,weak) UIViewController *viewController;

+(instancetype)modelWithViewController:(UIViewController *)viewController;


@end
