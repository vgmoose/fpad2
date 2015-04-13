//
//  PadView.m
//  Fingerpad2
//
//  Created by Ricky Ayoub on 4/13/15.
//  Copyright (c) 2015 Ricky Ayoub. All rights reserved.
//

#import "PadView.h"

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
    
//    NSLog(@"%@ %f %f", _name, _trackingArea.rect.origin.x, _trackingArea.rect.origin.y);
//    NSLog(@"%@ %f %f", _name, _trackingArea.rect.size.width, _trackingArea.rect.size.height);

}


- (void)mouseEntered:(NSEvent *)theEvent{
    NSLog([NSString stringWithFormat:@"%@ entered", _name]);
    
    
}

- (void)mouseExited:(NSEvent *)theEvent{
    NSLog([NSString stringWithFormat:@"%@ exited", _name]);
    
}

@end
