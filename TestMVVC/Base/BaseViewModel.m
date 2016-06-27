//
//  BaseViewModel.m
//  TestMVVC
//
//  Created by Sam Feng on 16/4/7.
//  Copyright © 2016年 beloved999. All rights reserved.
//

#import "BaseViewModel.h"

@implementation UIViewController(viewModel)
-(void)callBackAction{
    [self callBackAction:0 info:nil];
}

-(void)callBackAction:(ViewControllerAction)action{
    [self callBackAction:action info:nil];
}

-(void)callBackAction:(ViewControllerAction)action info:(id)info{
}




@end




@implementation BaseViewModel
+(instancetype) modelWithViewController:(UIViewController *)viewController{
    BaseViewModel *model = self.new;
    if(model){
        model.viewController = viewController;
    }
    return model;
}


- (NSString *)description{
    return [NSString stringWithFormat:@"View model:%@ viewController:%@",
            super.description,
            self.viewController.description
            ];
}
@end
