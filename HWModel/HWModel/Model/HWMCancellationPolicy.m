//
//  HWMCancellationPolicy.m
//  HWModel
//
//  Created by Kamil Wasag on 21/01/16.
//  Copyright © 2016 Figure8. All rights reserved.
//

#import "HWMCancellationPolicy.h"

@implementation HWMCancellationPolicy
+ ( JSONKeyMapper*) keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"description":@"descrip"}];
}
@end
