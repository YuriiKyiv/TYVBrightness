//
//  TYVBrightnessAlignmentViewController.m
//  TYVBrightness
//
//  Created by Yurii Trokhymchuk on 13.07.18.
//  Copyright © 2018 Yurii Trokhymchuk. All rights reserved.
//

#import "TYVBrightnessAlignmentViewController.h"
#import "TYVBrightnessAlignmentView.h"
#import "TYVMacro.h"

TYVViewControllerProperty(TYVBrightnessAlignmentViewController, rootView, TYVBrightnessAlignmentView)

@interface TYVBrightnessAlignmentViewController ()

@end

@implementation TYVBrightnessAlignmentViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

}

#pragma mark - Actions

- (IBAction)onDragSlider:(NSSlider *)sender {
    
}

@end
