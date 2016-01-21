//
//  HWMCancellationPolicy.h
//  HWModel
//
//  Created by Kamil Wasag on 21/01/16.
//  Copyright © 2016 Figure8. All rights reserved.
//

#import "JSONModel.h"

@interface HWMCancellationPolicy : JSONModel
@property (nonatomic,strong) NSString* descrip;
@property (nonatomic,assign) int numberOfDays;
@end
