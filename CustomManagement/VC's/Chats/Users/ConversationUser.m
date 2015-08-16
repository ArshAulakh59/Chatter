//
//  PGUser.m
//  Chatter
//
//  Created by ArshAulakh on 16/08/15.
//  Copyright (c) 2015 Intelligente Inc. All rights reserved.
//

#import "ConversationUser.h"

@implementation ConversationUser

- (instancetype)initWithParticipantIdentifier:(NSString *)participantIdentifier {
    self = [super init];
    if (self) {
        _participantIdentifier = participantIdentifier;
        _firstName = participantIdentifier;
        _lastName = participantIdentifier;
        _fullName = participantIdentifier;
        _avatarInitials = [participantIdentifier substringToIndex:1];
		_avatarImage = [UIImage imageNamed:@"img.png"];
		_avatarImageURL = [NSURL URLWithString:participantIdentifier];
    }

    return self;
}

+ (instancetype)userWithParticipantIdentifier:(NSString *)participantIdentifier {
    return [[self alloc] initWithParticipantIdentifier:participantIdentifier];
}

@end
