//
//  ChangeEmailViewController.m
//  Mana-iOS
//
//  Created by Oleksandr Burla on 4/12/16.
//  Copyright © 2016 DB2. All rights reserved.
//

#import "ChangeEmailViewController.h"
#import "NSString+Validation.h"
#import "UIAlertView+CustomAlert.h"



@interface ChangeEmailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

@end

@implementation ChangeEmailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButton:(UIBarButtonItem *)sender {
    //тут отправить емайл на сервер
    
    
    
    if([self.emailTextField.text isEmailValid]){
        //        [SVProgressHUD show];
        //        [[NetworkManager sharedManager] changeEmailToEmail:self.emailTextField.text completion:^(BOOL success, id response, NSError *error) {
        //            if (success) {
        //                [UIAlertView alertWithMessage:@"Email successfully changed"];
        //                self.emailTextField.text = @"";
        //
        //                [self.navigationController popViewControllerAnimated:YES];
        //            } else {
        //                [UIAlertView alertWitherror:error];
        //            }
        //            
        //            [SVProgressHUD dismiss];
        //        }];
        NSLog(@"save email");
        [self.navigationController popViewControllerAnimated:YES];

    } else {
        NSLog(@"Incorrect email");
        [UIAlertView alertWithMessage:@"Incorrect email"];
    }

    
    
    

}

@end
