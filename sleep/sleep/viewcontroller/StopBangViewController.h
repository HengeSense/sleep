//
//  StopBangViewController.h
//  sleep
//
//  Created by Marc Fiume on 2013-07-24.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SkyViewController.h"
#import "iCarousel.h"
#import "UISimpleButton.h"

@interface StopBangViewController : SkyViewController {
    NSArray* questions;
    NSArray* responses;
    UIView* shownView;
    int currentIndex;
    
    UISimpleButton* buttonPrevious;
    UISimpleButton* buttonNext;
}

@end
