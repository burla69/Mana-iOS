//
//  UIAlertView+CustomAlert.h
//  Reach-iOS
//
//  Created by MaksymRachytskyy on 11/22/15.
//  Copyright © 2015 Maksym Rachytskyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (CustomAlert)

+ (void)alertWithMessage:(NSString *)message;
+ (void)alertWitherror:(NSError *)error;

@end
