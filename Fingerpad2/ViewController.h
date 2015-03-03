//
//  ViewController.h
//  Fingerpad2
//
//  Created by Ricky Ayoub on 3/2/15.
//  Copyright (c) 2015 Ricky Ayoub. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController
@property (weak) IBOutlet NSSlider *sliderBar;
@property BOOL activated;
@property NSView* topView;
@property NSView* botView;
@property NSView* leftView;
@property NSView* rightView;
@end

typedef enum{
    Top=0, Bottom=1, Left=2, Right=3
} Position;