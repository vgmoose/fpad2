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
    
    // hide or show the title bar
    if (self.activated)
    {
        [window setStyleMask:NSClosableWindowMask|NSMiniaturizableWindowMask|NSTitledWindowMask|NSResizableWindowMask];
        
        CGRect r = window.frame;
        
        [window setFrame:NSMakeRect(0.f, 0.f, 0.f, 0.f) display:NO animate:NO];
        
        [window setFrame:r display:YES animate:NO];

    }
    else
        [window setStyleMask:NSBorderlessWindowMask];
    
    
    // toggle activated state
    self.activated = !self.activated;
    
    // get appropriate string text
    NSString* startOrStop = self.activated? @"Stop" : @"Start";
    
    // change text of the button
    ((NSButton*)sender).title = [NSString stringWithFormat:@"%@ Fingerpad2", startOrStop];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject
{
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
