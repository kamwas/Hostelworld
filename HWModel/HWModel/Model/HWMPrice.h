//
//  HWMPrice.h
//  HWModel
//
//  Created by Kamil Wasag on 21/01/16.
//  Copyright © 2016 Figure8. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface HWMPrice : JSONModel
@property (nonatomic, strong) NSString* currency;
@property (nonatomic, assign) float value;


@end
