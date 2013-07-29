//
//  HomeViewController.h
//  sleep
//
//  Created by Marc Fiume on 2013-07-24.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SkyViewController.h"
#import "DRNRealTimeBlurView.h"

@interface HomeViewController : SkyViewController
@property (strong, nonatomic) IBOutlet DRNRealTimeBlurView *blurredView;

@end
