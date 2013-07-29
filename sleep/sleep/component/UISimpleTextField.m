//
//  UISimpleTextField.m
//  sleep
//
//  Created by Marc Fiume on 2013-07-24.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "UISimpleTextField.h"
#import <QuartzCore/QuartzCore.h>

@implementation UISimpleTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSLog(@"init with frame");
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    if(self = [super initWithCoder:aDecoder]) {
        [self setBorderStyle:UITextBorderStyleNone];
        [self setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:24]];
        [self setTextColor:[UIColor whiteColor]];
        
        // add side padding
        UIView *leftpaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
        self.leftView = leftpaddingView;
        self.leftViewMode = UITextFieldViewModeAlways;
        
        UIView *rightpaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
        self.rightView = rightpaddingView;
        self.rightViewMode = UITextFieldViewModeAlways;
    
    }
    
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    float xStart = 0.0f;
    float xEnd = self.bounds.size.width;
    float yStart = self.bounds.size.height;
    float yEnd = yStart;
    
    float bumper = 0;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 2.0);
    
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    
    CGContextMoveToPoint(context, xStart, yStart-bumper);
    CGContextAddLineToPoint(context, xStart, yStart);
    CGContextAddLineToPoint(context, xEnd, yEnd);
    CGContextAddLineToPoint(context, xEnd, yEnd-bumper);
    
    CGContextStrokePath(context);
    
}

- (void) drawPlaceholderInRect:(CGRect)rect {
    [[[UIColor alloc] initWithRed:1.0 green:1.0 blue:1.0 alpha:0.5] setFill];
    //[[UIColor whiteColor] setFill];
    [[self placeholder] drawInRect:rect withFont:[self font]];
}

@end
