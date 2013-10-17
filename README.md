Cocoa Drawing
=============

This is an exercise on learning how to write a basic drawing app using cocoa on the mac. Let's use the desktop for a change.

If you use XCode to give you a basic cocoa app, uncheck core data since we will not need it. Then you end up just with an AppDelegate that has access to a window object.

So we will create a custom view (File -> New -> Objective C class - inherit from NSView) and call it DrawingView. That is where we will draw some lines soon. For now let's just have it blank.

``` objective-c
#import "DrawingView.h"

@implementation DrawingView

@end
```


In the header file DrawingView.h we (1) add the AppKit framework, (2) import our custom view file DrawingView.h and (3) set a property that will hold our custom view:

If you do not know how to add the AppKit framework, just google how to add a framework to an Xcode project. After that you can add the #import calls.

``` objective-c
#import <Cocoa/Cocoa.h>
#import <AppKit/AppKit.h>
#import "DrawingView.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property DrawingView *drawingView;

@end
```

The next step will be to instantiate the custom view; we will hold this instance in the self.drawingView property (instance variable). Then we add the view to be the contentView of the default window.

``` objective-c
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
```

If you run your app, nothing appears to happen, but we have our view involved. Now let's code our view. We will set the background to red in our view and we will draw a line from the upper right corner to the lower left corner.

First we write the drawRect: method that we have from NSView base class; then we add the code that we need to draw there. Cocoa takes care of running the drawRect: method whenever it needs to run; if we need to run it ourselves, we run it with the setNeedsDisplay: method. But we will not need to use it for this simple exercise.

``` objective-c
-(void) drawRect:(NSRect)dirtyRect {
    [self fillBackgroundColorOfRect:dirtyRect];
    [self drawLinesInRect:dirtyRect];
}
```

We have defined two methods for our drawRect: method. One of the methods is to fill the whole are in red:

``` objective-c
-(void) fillBackgroundColorOfRect:(NSRect) rect {
    [[NSColor redColor] set];
    [NSBezierPath fillRect:rect];
}
```

And the other method is to draw a line from one corner to the other:

``` objective-c
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
```

If everything worked for you, you should see a red window with a white line across and the line resizes as you resize the window. The resizing happens because we take the size of the window frame when we draw the red filled rect as well as when we determine the start and end point of the white line.

That's it. Now I can work on drawing and moving a trebuchet, which always appeals to me when I do graphics.

