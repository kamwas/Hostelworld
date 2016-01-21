//
//  HWMRating.h
//  HWModel
//
//  Created by Kamil Wasag on 21/01/16.
//  Copyright © 2016 Figure8. All rights reserved.
//

#import "JSONModel.h"

@interface HWMRating : JSONModel
@property (nonatomic, assign) int overall;
@property (nonatomic, strong) NSNumber<Ignore>* numberOfRatings;
@property (nonatomic, strong) NSNumber<Ignore>* atmosphere;
@property (nonatomic, strong) NSNumber<Ignore>* cleanliness;
@property (nonatomic, strong) NSNumber<Ignore>* facilities;
@property (nonatomic, strong) NSNumber<Ignore>* staff;
@property (nonatomic, strong) NSNumber<Ignore>* security;
@property (nonatomic, strong) NSNumber<Ignore>* location;
@property (nonatomic, strong) NSNumber<Ignore>*valueForMoney;
@end
