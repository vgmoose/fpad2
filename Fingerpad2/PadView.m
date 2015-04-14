//
//  PadView.m
//  Fingerpad2
//
//  Created by Ricky Ayoub on 4/13/15.
//  Copyright (c) 2015 Ricky Ayoub. All rights reserved.
//

#import "PadView.h"
#import "ViewController.h"

@implementation PadView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
}

-(void)updateTrackingArea:(NSRect) r
{
    [self removeTrackingArea:_trackingArea];
    self.trackingArea = [[NSTrackingArea alloc]
                    initWithRect: r
                    options:NSTrackingMouseEnteredAndExited | NSTrackingActiveAlways
                    owner:self userInfo:nil];
    [self addTrackingArea:_trackingArea];


}


- (void)mouseEntered:(NSEvent *)theEvent{
    
    if (((ViewController*)self.window.contentViewController).activated)
    {
        // press the appropriate direction
        CGEventRef e1 = CGEventCreateKeyboardEvent ( 0, (CGKeyCode)(kVK_LeftArrow+_direction), true );
        CGEventPost(kCGSessionEventTap, e1);
        CFRelease(e1);
    }
    
}

- (void)mouseExited:(NSEvent *)theEvent{
    // release the appropriate direction
    CGEventRef e1 = CGEventCreateKeyboardEvent ( 0, (CGKeyCode)(kVK_LeftArrow+_direction), false );
    CGEventPost(kCGSessionEventTap, e1);
    CFRelease(e1);
}

@end
