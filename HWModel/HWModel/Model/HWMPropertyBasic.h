//
//  HWMPropertyBasic.h
//  HWModel
//
//  Created by Kamil Wasag on 21/01/16.
//  Copyright © 2016 Figure8. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HWMImage.h"
#import "HWMPrice.h"
#import "JSONModel.h"
#import "HWMRating.h"
#import "HWMStayRoule.h"
#import "HWMDistance.h"

@interface HWMPropertyBasic : JSONModel

@property (nonatomic, assign) int id;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, assign) float latitude;
@property (nonatomic, assign) float longitude;
@property (nonatomic, strong) NSString* type;
@property (nonatomic, strong) NSArray<HWMImage>* images;
@property (nonatomic, strong) HWMPrice *lowestPricePerNight;
@property (nonatomic, strong) HWMPrice *lowestPrivatePricePerNight;
@property (nonatomic, retain) HWMRating *overallRating;
@property (nonatomic, assign) BOOL hostelworldRecommends;
@property (nonatomic, assign) BOOL isFeatured;
@property (nonatomic, assign) BOOL isNew;
@property (nonatomic, assign) int position;
@property (nonatomic, strong) NSArray<HWMStayRoule>* stayRuleViolations;
@property (nonatomic, assign) HWMDistance* distance;




@end
