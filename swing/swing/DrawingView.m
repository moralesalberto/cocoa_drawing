//
//  DrawingView.m
//  swing
//
//  Created by Alberto Morales on 10/17/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import "DrawingView.h"

@implementation DrawingView


// this drawRect is the NSView method that gets called anytime this view needs
// redrawing; so add all your code here to handle the drawing
-(void) drawRect:(NSRect)dirtyRect {
    [self fillBackgroundColorOfRect:dirtyRect];
    [self drawLinesInRect:dirtyRect];
}

-(void) fillBackgroundColorOfRect:(NSRect) rect {
    [[NSColor redColor] set];
    [NSBezierPath fillRect:rect];
}

-(void) drawLinesInRect:(NSRect) rect {
    NSBezierPath *path = [NSBezierPath bezierPath];
    [path setLineWidth:4.0];
    
    NSPoint startPoint = rect.origin;
    NSPoint endPoint = CGPointMake(rect.origin.x + rect.size.width, rect.origin.y + rect.size.height);
    
    [path moveToPoint:startPoint];
    [path lineToPoint:endPoint];
    
    [[NSColor whiteColor] set];
    [path stroke];
    
}

@end
