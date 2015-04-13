//
//  PadView.h
//  Fingerpad2
//
//  Created by Ricky Ayoub on 4/13/15.
//  Copyright (c) 2015 Ricky Ayoub. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Carbon/Carbon.h>

@interface PadView : NSView
- (void) updateTrackingArea:(NSRect) r;
@property NSTrackingArea* trackingArea;
@property NSString* name;
@property int direction;
@end
