//
// Created by Bartlomiej Guminiak on 17/04/15.
// Copyright (c) 2015 Bartlomiej Guminiak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property (nonatomic, assign) NSInteger x;
@property (nonatomic, assign) NSInteger y;

+ (instancetype)cellWithX:(NSInteger)x y:(NSInteger)y;

@end