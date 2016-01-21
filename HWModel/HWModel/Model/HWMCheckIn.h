//
//  HWMCheckIn.h
//  HWModel
//
//  Created by Kamil Wasag on 21/01/16.
//  Copyright © 2016 Figure8. All rights reserved.
//

#import "JSONModel.h"

@interface HWMCheckIn : JSONModel
@property (nonatomic,assign) int startsAt;
@property (nonatomic,assign) int endsAt;
@end
