//
//  Encasements.m
//  ManUal
//
//  Created by Gabriel on 11/8/13.
//  Copyright (c) 2013 Gabriel. All rights reserved.
//


#import "Encasements.h"

@implementation Encasements

- (void)setEncasements:(float)encasements {
    _encasements = encasements;
}
- (void)setAmount:(float)amount {
    _amount = amount;
}

- (float)encasements {
    return _encasements;
}
- (float)amount {
    return _encasements;
}

- (float)calculateArea {
    
    return self.encasements ;
    return self.amount ;
}

- (float)calculateCost {
    return _encasements * _amount;
}



@end
