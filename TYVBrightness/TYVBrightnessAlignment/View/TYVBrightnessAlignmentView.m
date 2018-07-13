//
//  TYVBrightnessAlignmentView.m
//  TYVBrightness
//
//  Created by Yurii Trokhymchuk on 13.07.18.
//  Copyright © 2018 Yurii Trokhymchuk. All rights reserved.
//

#import "TYVBrightnessAlignmentView.h"
#import "TYVBrightnessAlignmentViewModel.h"

@interface TYVBrightnessAlignmentView ()
@property (readonly) NSArray<NSString *>  *acceptableTypes;
@property (readonly) NSDictionary<NSPasteboardReadingOptionKey, id> *filteringOptions;

@end

@implementation TYVBrightnessAlignmentView
@dynamic acceptableTypes;
@dynamic filteringOptions;

#pragma mark - Accessors

- (NSArray<NSString *> *)acceptableTypes {
    return @[NSURLPboardType];
}

- (NSDictionary<NSPasteboardReadingOptionKey, id> *)filteringOptions {
    return @{NSPasteboardURLReadingContentsConformToTypesKey : NSImage.imageTypes};
}

#pragma mark - Public methods

- (void)configure {
    [self registerForDraggedTypes:self.acceptableTypes];
}

- (void)fillWith:(TYVBrightnessAlignmentViewModel *)model {
    self.imageView.image = model.image;
    self.slider.altIncrementValue = model.brightnessLevel;
}

- (NSDragOperation)draggingEntered:(id <NSDraggingInfo>)sender {
    BOOL allow = [self shouldAllowDrag:sender];
    return allow ? NSDragOperationCopy : NSDragOperationNone;
}

- (BOOL)prepareForDragOperation:(id <NSDraggingInfo>)sender {
    return [self shouldAllowDrag:sender];
}

- (BOOL)performDragOperation:(id <NSDraggingInfo>)sender {
    NSPasteboard *pasteBoard = sender.draggingPasteboard;
    NSImage *image = [[NSImage alloc] initWithPasteboard:pasteBoard];
    if (image != nil) {
        [self.delegate view:self addImage:image];
        return YES;
    } else {
        return NO;
    }
}

#pragma mark - Private

- (BOOL)shouldAllowDrag:(id<NSDraggingInfo>)draggingInfo {
    BOOL canAccept = false;
    NSPasteboard *pasteBoard = draggingInfo.draggingPasteboard;
    
    if ([pasteBoard canReadObjectForClasses:@[NSURL.class]
                                    options:self.filteringOptions]) {
        canAccept = YES;
    }
    
    return canAccept;
}

@end
