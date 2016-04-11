//
//  ChatTableViewCell.h
//  Mana-iOS
//
//  Created by Oleksandr Burla on 4/11/16.
//  Copyright © 2016 DB2. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *mesageLabel;

@end
