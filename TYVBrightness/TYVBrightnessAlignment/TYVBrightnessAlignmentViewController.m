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
#import "TYVImageModel.h"
#import "TYVMacro.h"
\
TYVViewControllerProperty(TYVBrightnessAlignmentViewController, rootView, TYVBrightnessAlignmentView)

@interface TYVBrightnessAlignmentViewController () <TYVBrightnessAlignmentViewDelegate>
@property (nonatomic, strong)   TYVBrightnessAlignmentViewModel *viewModel;
@property (nonatomic, strong)   TYVImageModel                   *imageModel;
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
}

#pragma mark - TYVBrightnessAlignmentViewDelegate

- (void)view:(TYVBrightnessAlignmentView *)view addImagesWithURLs:(NSArray<NSURL *> *)URLs {
    TYVImageModel *imageModel = [TYVImageModel modelWithURL:URLs.firstObject];
    self.imageModel = imageModel;
    TYVWeakify(self);
    [imageModel getImageWithBlock:^(NSImage *image, TYVImageModelToken token) {
        TYVStrongify(self);
        self.viewModel.image = image;
        [self.rootView fillWith:self.viewModel];
    }];
}

@end
