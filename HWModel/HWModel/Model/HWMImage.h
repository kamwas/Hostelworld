//
//  HWMImage.h
//  HWModel
//
//  Created by Kamil Wasag on 21/01/16.
//  Copyright © 2016 Figure8. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSONModel.h"

@protocol HWMImage
@end

@interface HWMImage : JSONModel

@property (nonatomic, strong) NSString* _Nullable suffix;
@property (nonatomic, strong) NSString* _Nullable prefix;


- (void)getImageWithSize:(NSString* _Nonnull)size withCompletionHandler:(void(^ _Nullable)(UIImage* _Nullable image,NSError *_Nullable error))completionHandler;
@end
