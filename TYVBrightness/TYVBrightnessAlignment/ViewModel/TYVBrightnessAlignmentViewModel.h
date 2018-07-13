//
//  TYVBrightnessAlignmentViewModel.h
//  TYVBrightness
//
//  Created by Yurii Trokhymchuk on 13.07.18.
//  Copyright © 2018 Yurii Trokhymchuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TYVBrightnessAlignmentViewModel : NSObject
@property (nonatomic, readonly) NSImage     *image;

@property (nonatomic, readwrite)    NSInteger   brightnessLevel;
@end
