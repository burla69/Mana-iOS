//
//  MessagesViewController.h
//  Mana-iOS
//
//  Created by Oleksandr Burla on 4/12/16.
//  Copyright © 2016 DB2. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSQMessagesViewController.h>


@interface MessagesViewController : JSQMessagesViewController

@property (strong, nonatomic) NSNumber *recipientID;
@property (strong, nonatomic) UIImage *userImage;
@property (copy, nonatomic) NSString *username;
@property (copy, nonatomic) NSString *avatarURL;
@property (copy, nonatomic) NSString *senderUsername;
@property (copy, nonatomic) NSString *senderAvatarURL;


@end
