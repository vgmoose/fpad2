//
//  ViewController.m
//  Fingerpad2
//
//  Created by Ricky Ayoub on 3/2/15.
//  Copyright (c) 2015 Ricky Ayoub. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController


- (IBAction)startButtonPushed:(id)sender
{
    // get the window object
    NSWindow* window = [[[NSApplication sharedApplication] windows] objectAtIndex:0];
    
    
    // toggle activated state
    self.activated = !self.activated;
    
    // hide or show the title bar
    if (!self.activated)
    {
        [window setStyleMask:NSClosableWindowMask|NSMiniaturizableWindowMask|NSTitledWindowMask|NSResizableWindowMask];
        
        // redraw the window
        CGRect r = window.frame;
        [window setFrame:NSMakeRect(0.f, 0.f, 0.f, 0.f) display:NO animate:NO];
        [window setFrame:r display:YES animate:NO];
        
        // re-set the title
        [window setTitle:@"Fingerpad2"];
        
        // unset always on top
        [window setLevel:NO];
        
        [window setBackgroundColor:nil];
        [window setOpaque:YES];
        
        [[self.view animator] setAlphaValue:1.0];
        [self updateRectPatches:(_sliderBar.floatValue/(_sliderBar.maxValue*3))];
        
    }
    else
    {
        [window setStyleMask:NSBorderlessWindowMask];
        
        // set always on top
        [window setLevel:NSFloatingWindowLevel];
        
        [window setOpaque:NO];
        
        NSColor *semiTransparentBlue =
        [NSColor colorWithDeviceRed:0.0 green:0.0 blue:0.0 alpha:0.0];
        [window setBackgroundColor:semiTransparentBlue];

        [[self.view animator] setAlphaValue:0.0];
        [self updateRectPatches:(_sliderBar.floatValue/(_sliderBar.maxValue*3))];


    }
    
    // get appropriate string text
    NSString* startOrStop = self.activated? @"Stop" : @"Start";
    
    // change text of the button
    ((NSButton*)sender).title = [NSString stringWithFormat:@"%@ Fingerpad2", startOrStop];
}

- (void)updateRectPatches:(float)percent
{
    [self updateRect:Top withPercent:percent];
    [self updateRect:Bottom withPercent:percent];
    [self updateRect:Left withPercent:percent];
    [self updateRect:Right withPercent:percent];
}

- (void)updateRect:(int)position withPercent:(float)percent
{
    NSArray* views = @[_topView, _botView, _leftView, _rightView];
    PadView* activeView = views[position];
    
    CGRect targetFrame = self.view.frame;
    CALayer *viewLayer = [CALayer layer];

//    if (!_activated)
//    {
        switch(position)
        {
            case Top:
            case Bottom:
                targetFrame.size.height *= percent;
                [viewLayer setBackgroundColor:CGColorCreateGenericRGB(1.0, 0.0, 0.0, 0.4)];
                break;
            case Left:
            case Right:
                targetFrame.size.width *= percent;
                [viewLayer setBackgroundColor:CGColorCreateGenericRGB(0.0, 0.0, 1.0, 0.4)];
        }
//    }
//    else
//    {
//        [viewLayer setBackgroundColor:nil];
//    }
    
    [activeView updateTrackingArea:targetFrame];
    
    if (position == Top)
        targetFrame.origin.y = self.view.frame.size.height*(1-percent);
    else if (position == Right)
        targetFrame.origin.x = self.view.frame.size.width*(1-percent);
    
    
    [activeView setFrame:targetFrame];
    [activeView setWantsLayer:YES];
    [activeView setLayer:viewLayer];
    
}

- (IBAction)adjustSlider:(id)sender
{
    [self updateRectPatches:(_sliderBar.floatValue/(_sliderBar.maxValue*3))];
}

- (void)initRectPatches
{
    NSWindow* window = [[[NSApplication sharedApplication] windows] objectAtIndex:0];

    _topView = [[PadView alloc] initWithFrame:self.view.frame];
    _botView = [[PadView alloc] initWithFrame:self.view.frame];
    _leftView = [[PadView alloc] initWithFrame:self.view.frame];
    _rightView = [[PadView alloc] initWithFrame:self.view.frame];
    
    _topView.name = @"top";
    _topView.direction = 3;
    _botView.name = @"bottom";
    _botView.direction = 2;
    _leftView.name = @"left";
    _leftView.direction = 0;
    _rightView.name = @"right";
    _rightView.direction = 1;
    
    [self.view addSubview:_topView];
    [self.view addSubview:_botView];
    [self.view addSubview:_leftView];
    [self.view addSubview:_rightView];

    
    [self updateRectPatches:(_sliderBar.floatValue/(_sliderBar.maxValue*3))];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initRectPatches];
}

- (void)setRepresentedObject:(id)representedObject
{
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
