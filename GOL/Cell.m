//
// Created by Bartlomiej Guminiak on 17/04/15.
// Copyright (c) 2015 Bartlomiej Guminiak. All rights reserved.
//

#import "Cell.h"

@implementation Cell

+ (instancetype)cellWithX:(NSInteger)x y:(NSInteger)y
{
    Cell *cell = [Cell new];
    cell.x = x;
    cell.y = y;
    return cell;
}

- (BOOL)isEqual:(id)other
{
    if (other == self)
        return YES;
    if (!other || ![[other class] isEqual:[self class]])
        return NO;

    return [self isEqualToCell:other];
}

- (BOOL)isEqualToCell:(Cell *)cell
{
    if (self == cell)
        return YES;
    if (cell == nil)
        return NO;
    if (self.x != cell.x)
        return NO;
    if (self.y != cell.y)
        return NO;
    return YES;
}

- (NSUInteger)hash
{
    NSUInteger hash = (NSUInteger) self.x;
    hash = hash * 31u + self.y;
    return hash;
}

@end