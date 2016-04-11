//
//  UIAlertView+CustomAlert.m
//  Reach-iOS
//
//  Created by MaksymRachytskyy on 11/22/15.
//  Copyright © 2015 Maksym Rachytskyy. All rights reserved.
//

#import "UIAlertView+CustomAlert.h"

@implementation UIAlertView (CustomAlert)

+ (void)alertWithMessage:(NSString *)message {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"] message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

+ (void)alertWitherror:(NSError *)error {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"] message:error.localizedDescription delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

@end
