//
// Created by Bartlomiej Guminiak on 17/04/15.
// Copyright (c) 2015 Bartlomiej Guminiak. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Drawer;

@interface GameOfLife : NSObject

- (instancetype)initWithAlives:(NSArray *)alives;
- (void)tick;
- (void)draw:(id<Drawer>)drawer;

@end