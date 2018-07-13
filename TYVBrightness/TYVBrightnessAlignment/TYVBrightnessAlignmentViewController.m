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
#import "TYVBrightnessProcessingContext.h"
#import "TYVMacro.h"

TYVViewControllerProperty(TYVBrightnessAlignmentViewController, rootView, TYVBrightnessAlignmentView)

@interface TYVBrightnessAlignmentViewController () <TYVBrightnessAlignmentViewDelegate>
@property (nonatomic, strong)   TYVBrightnessAlignmentViewModel *viewModel;
@property (nonatomic, strong)   TYVBrightnessProcessingContext  *context;
@end

@implementation TYVBrightnessAlignmentViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.rootView configure];
    self.rootView.delegate = self;
    
    TYVBrightnessAlignmentViewModel *viewModel = [TYVBrightnessAlignmentViewModel new];
    self.viewModel = viewModel;
}

#pragma mark - Actions

- (IBAction)onDragSlider:(NSSlider *)sender {
    self.viewModel.brightnessLevel = sender.integerValue;
    [self.context proccessWithBrightnessLevel:sender.integerValue completionBlock:^(NSImage *image) {
        
    }];
}

#pragma mark - TYVBrightnessAlignmentViewDelegate

- (void)view:(TYVBrightnessAlignmentView *)view addImage:(NSImage *)image {
    
    self.viewModel.image = image;
    [self.rootView fillWith:self.viewModel];
    TYVBrightnessProcessingContext  *context = [[TYVBrightnessProcessingContext alloc] initWith:image];
    self.context = context;
}

@end
