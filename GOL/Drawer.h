//
// Created by Bartlomiej Guminiak on 17/04/15.
// Copyright (c) 2015 Bartlomiej Guminiak. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Drawer <NSObject>

- (void)clear;
- (void)printAtX:(NSInteger)x y:(NSInteger)y;

@end