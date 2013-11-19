//
//  Interceptors.m
//  ManUal
//
//  Created by Gabriel on 11/8/13.
//  Copyright (c) 2013 Gabriel. All rights reserved.
//

#import "Interceptors.h"

@implementation Interceptors

- (void)setInterceptors:(float)interceptors {
    _interceptors = interceptors;
}
- (void)setAmount:(float)amount {
    _amount = amount;
}

- (float)interceptors {
    return _interceptors;
}
- (float)amount {
    return _interceptors;
}

- (float)calculateArea {
    
    return self.interceptors ;
    return self.amount ;
}

- (float)calculateCost {
    return _interceptors * _amount;
}



@end
