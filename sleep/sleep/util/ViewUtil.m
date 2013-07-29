//
//  ViewUtil.m
//  sleep
//
//  Created by Marc Fiume on 2013-07-24.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "ViewUtil.h"
#import <QuartzCore/QuartzCore.h>

@implementation ViewUtil

+(UIView*) addBackgroundToView:(UIView*)v {
    UIView *view = [[UIView alloc] init];
    view.frame = v.frame;
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = view.bounds;
    
    
    id top = (id) [[[UIColor alloc] initWithRed:0/255.0 green:144/255.0 blue:175/255.0 alpha:1.0] CGColor];
    id bottom = (id) [[[UIColor alloc] initWithRed:2/255.0 green:17/255.0 blue:14/255.0 alpha:1.0] CGColor];
    
    gradient.colors = [NSArray arrayWithObjects:top, bottom, nil];
    
    [view.layer insertSublayer:gradient atIndex:0];
    [v insertSubview:view atIndex:0];
    return view;
}

/*
-(void) setBackground {
    NSLog(@"Setting background");
    UIView *view = [[UIView alloc] init];
    view.frame = self.view.frame;
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = view.bounds;
    
    
    id top = (id) [[[UIColor alloc] initWithRed:0/255.0 green:144/255.0 blue:175/255.0 alpha:1.0] CGColor];
    id bottom = (id) [[[UIColor alloc] initWithRed:2/255.0 green:17/255.0 blue:14/255.0 alpha:1.0] CGColor];
    
    gradient.colors = [NSArray arrayWithObjects:top, bottom, nil];
    
    [view.layer insertSublayer:gradient atIndex:0];
    [self.view insertSubview:view atIndex:0];
    
}
 */

@end
