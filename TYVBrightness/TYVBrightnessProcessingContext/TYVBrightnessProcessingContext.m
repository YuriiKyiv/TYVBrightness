//
//  TYVBrightnessProcessingContext.m
//  TYVBrightness
//
//  Created by Yurii Trokhymchuk on 13.07.18.
//  Copyright © 2018 Yurii Trokhymchuk. All rights reserved.
//

#import "TYVBrightnessProcessingContext.h"
#import <CoreImage/CoreImage.h>

@interface TYVBrightnessProcessingContext ()
@property (nonatomic, strong)   NSImage *image;
@property (nonatomic, strong)   NSOperationQueue    *queue;

- (void)configure;

@end

@implementation TYVBrightnessProcessingContext

#pragma mark - Initialization and Deallocation

- (instancetype)initWith:(NSImage *)image
{
    self = [super init];
    if (self) {
        self.image = image;
        [self configure];
    }
    return self;
}

#pragma mark - Public Methods

- (void)proccessWithBrightnessLevel:(NSUInteger)level
                    completionBlock:(TYVBrightnessProcessingCompletionBlock)completionBlock
{
//    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
//        CIContext *context = [CIContext new];
//        CIFilter *filter = [CIFilter filterWithName:@"CIColorControls"];
//        [filter setValue:self.image forKey:@"inputImage"];
//        [filter setValue:self.image forKey:@"inputBrightness"];
//        CIImage *outImage = filter.outputImage;
//        NSImage *image = [[NSImage alloc] initWithCGImage:outImage size:outImage.extent];
//
//        // CGImageRef *imageRef = [context createCGImage:outImage fromRect:outImage.extent];
//        if (completionBlock) {
//            //completionBlock()
//        }
//    }];
    
    
    
//    [self.queue addOperation:operation];
}

#pragma mark - Private Methods

- (void)configure {
    NSOperationQueue *queue = [NSOperationQueue new];
    self.queue = queue;
    queue.maxConcurrentOperationCount = 1;
    queue.name = @"BrightnessProcessingQueue";
}

@end
