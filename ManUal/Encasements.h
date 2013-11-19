//
//  Encasements.h
//  ManUal
//
//  Created by Gabriel on 11/8/13.
//  Copyright (c) 2013 Gabriel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Encasements : NSObject  {
    
    float _encasements;
    float _amount;
    
}

// Setters
- (void)setEncasements:(float)encasements;
- (void)setAmount:(float)amount;



// Accesors
- (float)encasements;
- (float)amount;
- (float)calculateCost;


@end
