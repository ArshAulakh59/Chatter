//
//  ConversationController.h
//  Chatter
//
//  Created by ArshAulakh on 16/08/15.
//  Copyright (c) 2015 Intelligente Inc. All rights reserved.
//

#import "ATLConversationViewController.h"
#import <UIKit/UIKit.h>
#import <Atlas/Atlas.h>
#import "ATLConversationListViewController.h"
#import "ConversationUser.h"

@interface ConversationController : ATLConversationViewController <ATLConversationViewControllerDataSource, ATLConversationViewControllerDelegate>



@end
