//
//  LoginViewController.m
//  sleep
//
//  Created by Marc Fiume on 2013-07-24.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "LoginViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        [self setBackground];
        
    }
    return self;
}

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


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self setBackground];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
