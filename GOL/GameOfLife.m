//
// Created by Bartlomiej Guminiak on 17/04/15.
// Copyright (c) 2015 Bartlomiej Guminiak. All rights reserved.
//

#import "GameOfLife.h"
#import "Drawer.h"
#import "Cell.h"

@interface GameOfLife()

@property (nonatomic, strong) NSSet *alives;

@end

@implementation GameOfLife

- (instancetype)initWithAlives:(NSArray *)alives
{
    self = [super init];
    if (self) {
        __block NSMutableSet *set = [NSMutableSet new];
        [alives enumerateObjectsUsingBlock:^(NSArray *obj, NSUInteger idx, BOOL *stop) {
            [set addObject:[Cell cellWithX:[obj[0] integerValue] y:[obj[1] integerValue]]];
        }];
        self.alives = [set copy];
    }

    return self;
}

- (void)draw:(id<Drawer>)drawer
{
    [self.alives enumerateObjectsUsingBlock:^(Cell *cell, BOOL *stop) {
        [drawer printAtX:cell.x y:cell.y];
    }];
}

- (void)tick
{
    __block NSMutableSet *newAlives = [NSMutableSet new];
    [self.alives enumerateObjectsUsingBlock:^(Cell *obj, BOOL *stop) {
        NSInteger numberOfNeighbours = [self numberOfNeightboursForCell:obj];
        if (numberOfNeighbours == 2 || numberOfNeighbours == 3) {
            [newAlives addObject:obj];
        }
    }];

    [self.deads enumerateObjectsUsingBlock:^(Cell *obj, BOOL *stop) {
        if ([self numberOfNeightboursForCell:obj] == 3) {
            [newAlives addObject:obj];
        }
    }];

    self.alives = [newAlives copy];
}

- (int)numberOfNeightboursForCell:(Cell *)cell
{
    NSInteger numberOfNeighbours = 0;
    for (NSInteger x_delta = -1; x_delta <= 1; x_delta++) {
        for (NSInteger y_delta = -1; y_delta <= 1; y_delta++) {
            if (x_delta == 0 && y_delta == 0) continue;

            if ([self.alives containsObject:[Cell cellWithX:cell.x + x_delta y:cell.y + y_delta]]) {
                numberOfNeighbours++;
            }
        }
    }
    return numberOfNeighbours;
}

- (NSSet *)deads
{
    __block NSMutableSet *set = [NSMutableSet new];
    [self.alives enumerateObjectsUsingBlock:^(Cell *cell, BOOL *stop) {
        for (NSInteger x_delta = -1; x_delta <= 1; x_delta++) {
            for (NSInteger y_delta = -1; y_delta <= 1; y_delta++) {
                [set addObject:[Cell cellWithX:cell.x + x_delta y:cell.y + y_delta]];
            }
        }
    }];
    [set minusSet:self.alives];
    return [set copy];
}

@end