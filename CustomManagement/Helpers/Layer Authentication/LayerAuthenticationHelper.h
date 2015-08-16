//
//  LayerAuthenticationHelper.h
//  Chatter
//
//  Created by ArshAulakh on 16/08/15.
//  Copyright (c) 2015 Intelligente Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <LayerKit/LayerKit.h>
#import <Atlas/Atlas.h>

@interface LayerAuthenticationHelper : NSObject
+ (instancetype)sharedInstance;
@property (nonatomic, strong) LYRClient *layerClient;
- (void)setupLayer;

@end
