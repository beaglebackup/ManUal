//
//  Manual.h
//  ManUal
//
//  Created by Gabriel on 11/8/13.
//  Copyright (c) 2013 Gabriel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Manual : NSObject {
    float _length;
    float _width;
}

// Setters
- (void)setLength:(float)length;
- (void)setWidth:(float)width;


// Accesors
- (float)length;
- (float)width;

- (float)calculateArea;
- (float)calculateCost;

@end
