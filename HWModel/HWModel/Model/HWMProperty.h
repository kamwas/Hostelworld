//
//  HWMProperty.h
//  HWModel
//
//  Created by Kamil Wasag on 21/01/16.
//  Copyright © 2016 Figure8. All rights reserved.
//

#import "JSONModel.h"
#import "HWMRating.h"
#import "HWMCity.h"
#import "HWMCancellationPolicy.h"
#import "HWMImage.h"
#import "HWMCheckIn.h"

@interface HWMProperty : JSONModel
@property (nonatomic,assign) int id;
@property (nonatomic,strong) NSString* name;
@property (nonatomic,strong) HWMRating* rating;
@property (nonatomic,strong) NSArray<NSString*>*bestFor;
@property (nonatomic,assign) BOOL hostelworldRecommends;
@property (nonatomic,strong) NSString* hostelworldSays;
@property (nonatomic,strong) NSString* descrip;
@property (nonatomic,assign) float longitude;
@property (nonatomic,assign) float latitude;
@property (nonatomic,strong) NSString* address1;
@property (nonatomic,strong) NSString* address2;
@property (nonatomic,strong) NSString* directions;
@property (nonatomic,strong) HWMCity *city;
@property (nonatomic,strong) NSArray<NSString*>* paymentMethods;
@property (nonatomic,strong) HWMCancellationPolicy* cancellationPolicy;
@property (nonatomic,strong) NSArray<NSString*>* thingsToNote;
@property (nonatomic,strong) NSArray<NSString*>* policies;
@property (nonatomic, strong) NSArray<HWMImage>* images;
@property (nonatomic,strong) NSString* type;
@property (nonatomic,assign) int depositPercentage;
@property (nonatomic,strong) NSArray<NSString*>* associations;
@property (nonatomic,assign) int totalRatings;
@property (nonatomic,assign) int totalReviews;
@property (nonatomic,assign) BOOL isNew;
@property (nonatomic,strong) HWMCheckIn* checkIn;

@end
