//
//  FloorBarrier.m
//  ManUal
//
//  Created by Gabriel on 11/9/13.
//  Copyright (c) 2013 Gabriel. All rights reserved.
//

#import "FloorBarrier.h"

@implementation Floor

- (void)setFloor:(float)floor{
    _floor = floor;
}
- (void)setAmount:(float)amount {
    _amount = amount;
}

- (float)floor {
    return _floor;
}
- (float)amount {
    return _floor;
}

- (float)calculateArea {
    
    return self.floor ;
    return self.amount ;
}

- (float)calculateCost {
    return _floor * _amount;
}



@end
