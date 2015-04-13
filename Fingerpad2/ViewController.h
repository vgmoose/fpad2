//
//  ViewController.h
//  Fingerpad2
//
//  Created by Ricky Ayoub on 3/2/15.
//  Copyright (c) 2015 Ricky Ayoub. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PadView.h"

@interface ViewController : NSViewController
@property (weak) IBOutlet NSSlider *sliderBar;
@property BOOL activated;
@property PadView* topView;
@property PadView* botView;
@property PadView* leftView;
@property PadView* rightView;

- (void)updateRectPatches:(float)percent;
@end

typedef enum{
    Top=0, Bottom=1, Left=2, Right=3
} Position;

