//
//  WallBarrier.m
//  ManUal
//
//  Created by Gabriel on 11/9/13.
//  Copyright (c) 2013 Gabriel. All rights reserved.
//

#import "WallBarrier.h"

@implementation Wall

- (void)setWall:(float)wall {
    _wall = wall;
}
- (void)setAmount:(float)amount {
    _amount = amount;
}

- (float)wall {
    return _wall;
}
- (float)amount {
    return _wall;
}

- (float)calculateArea {
    
    return self.wall ;
    return self.amount ;
}

- (float)calculateCost {
    return _wall * _amount;
}



@end
