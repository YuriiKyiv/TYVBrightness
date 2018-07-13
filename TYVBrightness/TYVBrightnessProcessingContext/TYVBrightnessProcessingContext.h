//
//  TYVBrightnessProcessingContext.h
//  TYVBrightness
//
//  Created by Yurii Trokhymchuk on 13.07.18.
//  Copyright © 2018 Yurii Trokhymchuk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^TYVBrightnessProcessingCompletionBlock)(NSImage *);

@interface TYVBrightnessProcessingContext : NSObject

- (instancetype)initWith:(NSImage *)image;
- (void)proccessWithBrightnessLevel:(NSUInteger)level
                    completionBlock:(TYVBrightnessProcessingCompletionBlock)completionBlock;

@end
