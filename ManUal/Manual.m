//
//  Manual.m
//  ManUal
//
//  Created by Gabriel on 11/8/13.
//  Copyright (c) 2013 Gabriel. All rights reserved.
//

#import "Manual.h"

@implementation Manual

- (void)setLength:(float)length {
    _length = length;
    
}

- (void)setWidth:(float)width {
    _width = width;
    
    
}
- (float)length {
    return _length;
}
- (float)width {
    return _width;
}

- (float)calculateArea {
    // return _length * _width;
    //return [self length] * [self width];
    return self.length * self.width;
    
}

- (float)calculateCost {
    return 1.50 * [self calculateArea];
}

@end