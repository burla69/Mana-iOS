//
//  AllUsersTableViewCell.m
//  Mana-iOS
//
//  Created by Oleksandr Burla on 4/12/16.
//  Copyright © 2016 DB2. All rights reserved.
//

#import "AllUsersTableViewCell.h"

@implementation AllUsersTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.avatarImageView.layer.cornerRadius = 25;
    self.avatarImageView.clipsToBounds = YES;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
