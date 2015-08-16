//
//  ConversationsController.h
//  Chatter
//
//  Created by ArshAulakh on 16/08/15.
//  Copyright (c) 2015 Intelligente Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Atlas/Atlas.h>
#import "ATLConversationListViewController.h"
#import "ConversationController.h"
#import "ConversationUser.h"

@interface ConversationsController : ATLConversationListViewController <ATLParticipantTableViewControllerDelegate, ATLConversationListViewControllerDataSource, ATLConversationListViewControllerDelegate>
+ (NSSet *)participants;

@end
