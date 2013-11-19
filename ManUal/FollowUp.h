//
//  FollowUp.h
//  ManUal
//
//  Created by Gabriel on 11/8/13.
//  Copyright (c) 2013 Gabriel. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FollowUp : NSObject  {
    
    float _amount;
    float _visits;
    
}

// Setters
- (void)setAmount:(float)amount;
- (void)setVisits:(float)visits;



// Accesors
- (float)amount;
- (float)visits;
- (float)calculateCost;




@end
