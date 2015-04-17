#import "GOLSpecHelper.h"
#import "Cell.h"

SpecBegin(Cell)

describe(@"cell", ^{

    it(@"cell initializes properly", ^{
        Cell *cell = [Cell cellWithX:1 y:2];
        expect(cell.x).to.equal(1);
        expect(cell.y).to.equal(2);
    });

    it(@"cells with same coordinates should be equal", ^{
        expect([Cell cellWithX:1 y:1]).to.equal([Cell cellWithX:1 y:1]);
    });

});

SpecEnd