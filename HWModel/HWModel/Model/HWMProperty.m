//
//  HWMProperty.m
//  HWModel
//
//  Created by Kamil Wasag on 21/01/16.
//  Copyright © 2016 Figure8. All rights reserved.
//

#import "HWMProperty.h"

@implementation HWMProperty



+ ( JSONKeyMapper*) keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"description":@"descrip"}];
}

@end
