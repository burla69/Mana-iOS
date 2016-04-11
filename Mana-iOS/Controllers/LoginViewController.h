//
//  LoginViewController.h
//  Mana-iOS
//
//  Created by Oleksandr Burla on 4/11/16.
//  Copyright © 2016 DB2. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController



- (void)addKeyboardObservers;
- (void)removeKeyboardObservers;
- (void)keyboardWillShowWithSize:(CGSize)size;
- (void)keyboardWillHideToController;
- (void)backButtonAction;

@end
