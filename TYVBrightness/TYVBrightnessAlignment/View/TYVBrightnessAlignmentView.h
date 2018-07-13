//
//  TYVBrightnessAlignmentView.h
//  TYVBrightness
//
//  Created by Yurii Trokhymchuk on 13.07.18.
//  Copyright © 2018 Yurii Trokhymchuk. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class TYVBrightnessAlignmentViewModel;

@interface TYVBrightnessAlignmentView : NSView
@property (nonatomic, weak) IBOutlet   NSImageView  *imageView;
@property (nonatomic, weak) IBOutlet   NSSlider     *slider;

- (void)fillWith:(TYVBrightnessAlignmentViewModel *)model;

@end
