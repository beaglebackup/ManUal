//
//  FloorBarrier.h
//  ManUal
//
//  Created by Gabriel on 11/9/13.
//  Copyright (c) 2013 Gabriel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Floor : NSObject  {
    
    float _floor;
    float _amount;
    
}

// Setters
- (void)setFloor:(float)floor;
- (void)setAmount:(float)amount;



// Accesors
- (float)floor;
- (float)amount;
- (float)calculateCost;


@end
