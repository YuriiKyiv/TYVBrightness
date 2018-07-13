//
//  TYVBrightnessAlignmentViewController.m
//  TYVBrightness
//
//  Created by Yurii Trokhymchuk on 13.07.18.
//  Copyright © 2018 Yurii Trokhymchuk. All rights reserved.
//

#import "TYVBrightnessAlignmentViewController.h"
#import "TYVBrightnessAlignmentView.h"
#import "TYVBrightnessAlignmentViewModel.h"
#import "TYVMacro.h"

TYVViewControllerProperty(TYVBrightnessAlignmentViewController, rootView, TYVBrightnessAlignmentView)

@interface TYVBrightnessAlignmentViewController ()
@property (nonatomic, strong)   TYVBrightnessAlignmentViewModel *viewModel;
@end

@implementation TYVBrightnessAlignmentViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    TYVBrightnessAlignmentViewModel *viewModel = [TYVBrightnessAlignmentViewModel new];
    self.viewModel = viewModel;
}

#pragma mark - Actions

- (IBAction)onDragSlider:(NSSlider *)sender {
    self.viewModel.brightnessLevel = sender.integerValue;
}

@end
