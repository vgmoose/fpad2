//
//  View.m
//  Fingerpad2
//
//  Created by Ricky Ayoub on 4/12/15.
//  Copyright (c) 2015 Ricky Ayoub. All rights reserved.
//

#import "View.h"

@implementation View

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

-(void)setFrameSize:(NSSize)newSize
{
    ViewController* vc = (ViewController*)self.window.contentViewController;
    
    [vc updateRectPatches:(vc.sliderBar.floatValue/(vc.sliderBar.maxValue*3))];
    NSLog(@"a");
    [super setFrameSize:newSize];
}

@end
