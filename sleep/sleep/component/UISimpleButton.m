//
//  UISimpleButton.m
//  sleep
//
//  Created by Marc Fiume on 2013-07-24.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "UISimpleButton.h"

@implementation UISimpleButton


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
        
        //[self setBorderStyle:UITextBorderStyleNone];
        [self.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:18]];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect
{
}

@end
