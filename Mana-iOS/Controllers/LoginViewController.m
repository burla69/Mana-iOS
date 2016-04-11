//
//  LoginViewController.m
//  Mana-iOS
//
//  Created by Oleksandr Burla on 4/11/16.
//  Copyright © 2016 DB2. All rights reserved.
//

#import "LoginViewController.h"
#import "MainTabBarController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self prepareUI];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareUI {

}

- (IBAction)unwindToLoginViewController:(UIStoryboardSegue *)unwindSegue{
    
}


- (IBAction)logInAction:(id)sender {
//    if (![self isValidFields]) {
//        return;
//    }
//    if (![self.emailField.text isEmailValid]) {
//        [UIAlertView alertWithMessage:@"Wrong Email"];
//        return;
//    }
//    
    __weak typeof(self)weakSelf = self;
//    [SVProgressHUD show];
//    [[NetworkManager sharedManager] loginUserWithEmail:self.emailField.text password:self.passwordField.text completion:^(BOOL success, id response, NSError *error) {
//        if (success) {
//            UserModel *user = response;
//            [[DataManager sharedManager] setActiveUserID:[user.userId stringValue]];
            [weakSelf pushToMainTabBarController];
//        } else {
//            [UIAlertView alertWitherror:error];
//        }
//        
//        [SVProgressHUD dismiss];
//    }];
}

- (void)pushToMainTabBarController {
    MainTabBarController *mainController = [self.storyboard instantiateViewControllerWithIdentifier:@"MainTabBarController"];
    [UIView transitionWithView:[[UIApplication sharedApplication] delegate].window
                      duration:0.5f
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            [[[UIApplication sharedApplication] delegate].window setRootViewController:mainController];
                        });
                    }
                    completion:nil];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




@end
