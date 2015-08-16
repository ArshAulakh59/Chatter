//
//  PGUser.h
//  Chatter
//
//  Created by ArshAulakh on 16/08/15.
//  Copyright (c) 2015 Intelligente Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Atlas/Atlas.h>

@interface ConversationUser : NSObject <ATLParticipant, ATLAvatarItem>

@property(nonatomic, readonly) NSString *firstName;
@property(nonatomic, readonly) NSString *lastName;
@property(nonatomic, readonly) NSString *fullName;
@property(nonatomic, readonly) NSString *participantIdentifier;
@property(nonatomic, readonly) UIImage *avatarImage;
@property(nonatomic, readonly) NSString *avatarInitials;
@property(nonatomic, readonly) NSURL *avatarImageURL;

- (instancetype)initWithParticipantIdentifier:(NSString *)participantIdentifier;

+ (instancetype)userWithParticipantIdentifier:(NSString *)participantIdentifier;


@end
