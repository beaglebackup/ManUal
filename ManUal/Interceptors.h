//
//  Interceptors.h
//  ManUal
//
//  Created by Gabriel on 11/8/13.
//  Copyright (c) 2013 Gabriel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Interceptors : NSObject  {
    
    float _interceptors;
    float _amount;
    
}

// Setters
- (void)setInterceptors:(float)interceptors;
- (void)setAmount:(float)amount;



// Accesors
- (float)interceptors;
- (float)amount;
- (float)calculateCost;




@end
