//
//  BaseNavigationController.m
//  Reach-iOS
//
//  Created by MaksymRachytskyy on 11/22/15.
//  Copyright © 2015 Maksym Rachytskyy. All rights reserved.
//

#import "BaseNavigationController.h"
#import "UIColor+CustomColors.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];    
    self.navigationBar.barTintColor = [UIColor whiteColorMy];
    self.navigationBar.tintColor = [UIColor blueColorMy];
    [self.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blueColorMy]}];
    self.navigationBar.translucent = NO;
}

@end
