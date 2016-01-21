//
//  HWMImage.m
//  HWModel
//
//  Created by Kamil Wasag on 21/01/16.
//  Copyright © 2016 Figure8. All rights reserved.
//


#import "HWMImage.h"
#import <HWModel/HWModel-Swift.h>

typedef void(^ _Nullable CompletionHandler)(UIImage* image,NSError *_Nullable error);

@interface HWMImage()

@property (nonatomic,strong) NSNumber<Ignore>* isDownloading;
@property (nonatomic,strong) NSMutableArray<Ignore>* completionHandlers;
@property (nonatomic, strong) UIImage<Ignore>* _Nullable thumbnailImage;
@property (nonatomic, strong) UIImage<Ignore>* _Nullable image;
@end

@implementation HWMImage

- (NSMutableArray<Ignore> *)completionHandlers{
    if (!_completionHandlers) {
        _completionHandlers = [NSMutableArray<Ignore> new];
    }
    return _completionHandlers;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@",self.prefix];
}


- (void)getImageWithSize:(NSString*)size withCompletionHandler:(void(^ _Nullable)(UIImage*image,NSError *_Nullable error))completionHandler{
    
    
    if (self.thumbnailImage && [size caseInsensitiveCompare:@"s"]==NSOrderedSame) {
        completionHandler(self.thumbnailImage,nil);
    }else if(self.image && [size caseInsensitiveCompare:@"l"]==NSOrderedSame){ 
        completionHandler(self.image,nil);
    }else{
        [self.completionHandlers addObject:completionHandler];
        if (!self.isDownloading.boolValue) {
            self.isDownloading = [NSNumber numberWithBool:FALSE];
            NSURLRequest *request = [NSURLRequest requestWithURL:[[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@%@%@",self.prefix,size,self.suffix]]];
            [[HWMServerConnection sharedInstance] downloadDataWitchRequest:request witchCompletionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                if (!error) {
                    if ([size caseInsensitiveCompare:@"s"]==NSOrderedSame) {
                        self.thumbnailImage = [UIImage imageWithData:data];
                    }else{
                        self.image = [UIImage imageWithData:data];
                    }
                    
                }
                for (CompletionHandler cHandler in self.completionHandlers) {
                    if ([size caseInsensitiveCompare:@"s"]==NSOrderedSame) {
                        cHandler(self.thumbnailImage,error);
                    }else{
                        cHandler(self.image,error);
                    }
                }
                self.isDownloading = [NSNumber numberWithBool:FALSE];
            }];
        }
    }
}

@end

