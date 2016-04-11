//
//  UserModel.m
//  Reach-iOS
//
//  Created by MaksymRachytskyy on 11/22/15.
//  Copyright © 2015 Maksym Rachytskyy. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

+ (UserModel *)getUserWithResponce:(NSDictionary *)responce {
    UserModel *user = [UserModel new];
    
    user.email = [responce valueForKey:@"email"];
    user.firstName = [responce valueForKey:@"first_name"];
    user.userId = [responce valueForKey:@"id"];
    user.lastName = [responce valueForKey:@"last_name"];
    user.userName = [responce valueForKey:@"username"];
    NSDictionary *info = [responce valueForKey:@"info"];
    user.biography = [info valueForKey:@"biography"];
    user.fullName = [info valueForKey:@"full_name"];
    user.commentCount = [info valueForKey:@"comment_count"];
    user.likeCount = [info valueForKey:@"like_count"];
    user.rate = [info valueForKey:@"rate"];
    user.avatarURL = [info valueForKey:@"avatar"];
    user.downvotedCount = [responce valueForKey:@"count_downvoted"];
    user.upvotedCount = [responce valueForKey:@"count_upvoted"];
    user.editProfileCommentsCount = [responce valueForKey:@"count_comments"];
    user.editProfileLikesCount = [responce valueForKey:@"count_likes"];
    user.profilePercentage = [responce valueForKey:@"complete_likes"];
    user.isFacebook = [responce valueForKey:@"is_facebook"];
    user.isInstagram = [responce valueForKey:@"is_instagram"];
    user.isTwitter = [responce valueForKey:@"is_twitter"];

    return user;
}

@end
