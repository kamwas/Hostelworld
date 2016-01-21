//
//  HWMPrice.m
//  HWModel
//
//  Created by Kamil Wasag on 21/01/16.
//  Copyright © 2016 Figure8. All rights reserved.
//

#import "HWMPrice.h"

@implementation HWMPrice
- (NSString *)description{
    return [NSString stringWithFormat:@"%@ %.2f", self.currency, self.value];
}
@end
