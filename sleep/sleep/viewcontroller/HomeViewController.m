//
//  HomeViewController.m
//  sleep
//
//  Created by Marc Fiume on 2013-07-24.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "HomeViewController.h"
#import "ViewUtil.h"
#import "DRNRealTimeBlurView.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

@synthesize blurredView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [ViewUtil addBackgroundToView:self.view];
    
    /*DRNRealTimeBlurView* blurView = [[DRNRealTimeBlurView alloc] initWithFrame:CGRectMake(60, 110, 200, 200)];
    blurView.tint = [UIColor whiteColor];
    [self.view addSubview:blurView];*/
    
    blurredView.alpha = 0.8;
    blurredView.tint = [UIColor whiteColor];
}

-(void) viewDidAppear:(BOOL)animated {
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
