//
//  StopBangViewController.m
//  sleep
//
//  Created by Marc Fiume on 2013-07-24.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "StopBangViewController.h"

@interface StopBangViewController ()

@end

@implementation StopBangViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

int pad = 25;
int switchPad = 40;
int buttonWidthNext = 45;
int buttonWidthPrevious = 70;
int buttonHeight = 40;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
    
    questions = [[NSArray alloc] initWithObjects:@"Do you snore loudly (louder than talking or loud enough to be heard through closed doors)?",@"Do you often feel tired, fatigued, or sleepy during daytime?",@"Has anyone observed you stop breathing during your sleep?",@"Do you have or are you being treated for high blood pressure?",@"Is your BMI more than 35 kg/m2?",@"Are you over 50 years old?",@"Is your neck circumference greater than 40cm?",@"Are you male?", nil];
    NSMutableArray* responsesMutable = [[NSMutableArray alloc] init];
    
    for (NSString* question in questions) {
        UISwitch* sw = [[UISwitch alloc] init];
        [sw setSelected:NO];
        
        [responsesMutable addObject:sw];
    }
    responses = responsesMutable;
    
    buttonPrevious = [[UISimpleButton alloc] initWithFrame:CGRectMake(pad, self.view.frame.size.height-pad-buttonHeight-self.navigationController.navigationBar.frame.size.height, buttonWidthPrevious, 60)];
    [buttonPrevious setTitle:@"previous" forState:UIControlStateNormal];
    [buttonPrevious setHidden:YES];
    
    [buttonPrevious addTarget:self
                   action:@selector(previous:)
         forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:buttonPrevious];
    
    buttonNext = [[UISimpleButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width-pad-buttonWidthNext, self.view.frame.size.height-pad-buttonHeight-self.navigationController.navigationBar.frame.size.height, buttonWidthNext, 60)];
    [buttonNext setTitle:@"next" forState:UIControlStateNormal];
    
    [buttonNext addTarget:self
          action:@selector(next:)
    forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:buttonNext];
}

-(void) viewWillAppear:(BOOL)animated {
    
    //[self setIndex:0];
    
}

-(void) viewDidAppear:(BOOL)animated {
    [self setIndex:0];
}

-(void) finishSurvey {
    
    [UIView animateWithDuration:0.25 animations:^{shownView.alpha = 0.0;}];
    [shownView removeFromSuperview];
    [buttonNext removeFromSuperview];
    [buttonPrevious removeFromSuperview];
    
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
    indicator.center = self.view.center;
    [indicator setColor:[UIColor whiteColor]];
    
    
    [self.view addSubview:indicator];
    [indicator bringSubviewToFront:self.view];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = TRUE;
    
    
    [indicator startAnimating];

    // TODO: save responses
    
    // TODO: upload to server
    
    [indicator stopAnimating];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void) setIndex:(int)i {

    if (i == [questions count]) {
        [self finishSurvey];
        return;
    }
    
    [buttonPrevious setHidden:(i == 0)];
    if (i == [questions count]-1) {
        [buttonNext setTitle:@"done" forState:UIControlStateNormal];
    } else {
        [buttonNext setTitle:@"next" forState:UIControlStateNormal];
    }
    

    currentIndex = i;
    
    NSLog(@"Setting index to %i with question %@",i,[questions objectAtIndex:i]);
    
    if (shownView != nil) {
        [UIView animateWithDuration:0.25 animations:^{shownView.alpha = 0.0;}];
        [shownView removeFromSuperview];
    }
    
    UIView* newView = [[UIView alloc] initWithFrame:self.view.frame];
    
    //UIView* newView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-2*pad, self.view.frame.size.height-2*pad)];
    
    [newView setBackgroundColor:[UIColor colorWithWhite:1.0f alpha:0.0f]];
    newView.center = self.view.center;
    
    newView.alpha = 0.0;
    
    UILabel* l = [[UILabel alloc] init];
    [l setLineBreakMode:UILineBreakModeWordWrap];
    [l setNumberOfLines:20];
    
    UIFont* font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:38];
    [l setFont:font];
    
    NSString* text = [questions objectAtIndex:i];
    
    CGSize theSize = [text sizeWithFont:font constrainedToSize:CGSizeMake(newView.frame.size.width-2*pad, FLT_MAX) lineBreakMode:UILineBreakModeWordWrap];
    
    NSLog(@"calculated size for %@: %f, %f",text, theSize.width, theSize.height);
    
    [l setTextColor:[UIColor whiteColor]];
    [l setBackgroundColor:[UIColor clearColor]];
    l.frame = CGRectMake(pad, pad, theSize.width, theSize.height);
    [l setText:text];
    [newView addSubview:l];
    
    UISwitch* sw = [responses objectAtIndex:i];
    sw.frame = CGRectMake(newView.frame.size.width-pad-sw.frame.size.width, theSize.height+switchPad, sw.frame.size.width, sw.frame.size.height);
    [newView addSubview:sw];
    
    [self.view insertSubview:newView aboveSubview:[self getBackgroundView]];
    
    [UIView animateWithDuration:0.25 animations:^{newView.alpha = 1.0;}];
 
    
    shownView = newView;
}

-(void) next:(id) sender {
    [self setIndex:currentIndex+1];
}

-(void) previous:(id) sender {
    [self setIndex:currentIndex-1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
