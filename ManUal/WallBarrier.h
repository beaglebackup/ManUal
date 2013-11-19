//
//  WallBarrier.h
//  ManUal
//
//  Created by Gabriel on 11/9/13.
//  Copyright (c) 2013 Gabriel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Wall : NSObject  {
    
    float _wall;
    float _amount;
    
}

// Setters
- (void)setWall:(float)wall;
- (void)setAmount:(float)amount;



// Accesors
- (float)wall;
- (float)amount;
- (float)calculateCost;


@end
