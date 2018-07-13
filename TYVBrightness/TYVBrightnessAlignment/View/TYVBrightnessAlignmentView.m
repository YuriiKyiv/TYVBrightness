//
//  TYVBrightnessAlignmentView.m
//  TYVBrightness
//
//  Created by Yurii Trokhymchuk on 13.07.18.
//  Copyright © 2018 Yurii Trokhymchuk. All rights reserved.
//

#import "TYVBrightnessAlignmentView.h"
#import "TYVBrightnessAlignmentViewModel.h"
@implementation TYVBrightnessAlignmentView

#pragma mark - Public methods

- (void)fillWith:(TYVBrightnessAlignmentViewModel *)model {
    self.imageView.image = model.image;
    self.slider.altIncrementValue = model.brightnessLevel;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

@end
