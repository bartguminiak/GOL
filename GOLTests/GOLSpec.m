#import "GOLSpecHelper.h"
#import "GameOfLife.h"
#import "Drawer.h"

SpecBegin(GameOfLife)

describe(@"game of life", ^{
    __block id<Drawer> drawer;
    __block GameOfLife *gol;

    beforeEach(^{
        drawer = mockProtocol(@protocol(Drawer));
    });

    it(@"should draw alive field", ^{
        gol = [[GameOfLife alloc] initWithAlives:@[ @[@1, @1] ]];
        [gol draw:drawer];
        [verify(drawer) printAtX:1 y:1];
    });

    it(@"should not draw dead fields", ^{
        gol = [[GameOfLife alloc] initWithAlives:@[]];
        [gol draw:drawer];
        [verifyCount(drawer, never()) printAtX:1 y:1];
    });

    it(@"should kill alive without neighbours", ^{
        gol = [[GameOfLife alloc] initWithAlives:@[ @[@1, @1] ]];
        [gol tick];
        [gol draw:drawer];
        [verifyCount(drawer, never()) printAtX:1 y:1];
    });

    it(@"should kill alive with one neighbour", ^{
        gol = [[GameOfLife alloc] initWithAlives:@[ @[@0, @0], @[@0, @1] ]];
        [gol tick];
        [gol draw:drawer];
        [verifyCount(drawer, never()) printAtX:1 y:1];
    });

    it(@"should resurrect dead when have 3 alive neighbours ", ^{
        gol = [[GameOfLife alloc] initWithAlives:@[ @[@1, @1], @[@1, @0], @[@0, @1] ]];
        [gol tick];
        [gol draw:drawer];
        [verify(drawer) printAtX:0 y:0];
    });

});

SpecEnd