//
//  AppDelegate.m
//  swing
//
//  Created by Alberto Morales on 10/17/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // instantiate the view we will use to draw
    self.drawingView = [[DrawingView alloc] initWithFrame:self.window.frame];
    
    // set that view to be the content view for the default window
    [self.window setContentView:self.drawingView];
    
    
}

@end
