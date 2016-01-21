//
//  HWMDistance.h
//  HWModel
//
//  Created by Kamil Wasag on 21/01/16.
//  Copyright © 2016 Figure8. All rights reserved.
//

#import "JSONModel.h"

@interface HWMDistance : JSONModel
@property (nonatomic, strong) NSString *units;
@property (nonatomic, assign) float value;
@end
