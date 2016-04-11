//
//  TokenModel.m
//  Reach-iOS
//
//  Created by MaksymRachytskyy on 11/22/15.
//  Copyright © 2015 Maksym Rachytskyy. All rights reserved.
//

#import "TokenModel.h"
#import "KeychainWrapper.h"

@interface TokenModel()

@property (strong, nonatomic) KeychainWrapper *wrapper;

@end

@implementation TokenModel

+ (TokenModel *)sharedInstance {
    static TokenModel *model = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        model = [[TokenModel alloc] init];
    });
    
    return model;
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.wrapper = [[KeychainWrapper alloc] init];
    }
    
    return self;
}

- (void)setToken:(NSString *)token {
    [self.wrapper mySetObject:token forKey:(id)kSecAttrService];
}

- (NSString *)token {
    return [self.wrapper myObjectForKey:(id)kSecAttrService];
}

- (void)clearToken {
    [self.wrapper mySetObject:@"" forKey:(id)kSecAttrService];
}



@end
