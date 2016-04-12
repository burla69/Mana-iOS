//
//  ChangeLastNameViewController.m
//  Mana-iOS
//
//  Created by Oleksandr Burla on 4/12/16.
//  Copyright © 2016 DB2. All rights reserved.
//

#import "ChangeLastNameViewController.h"

@interface ChangeLastNameViewController ()

@end

@implementation ChangeLastNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButton:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
    //тут отправить фамилию на сервер
    
    NSLog(@"save last name");

}


@end
