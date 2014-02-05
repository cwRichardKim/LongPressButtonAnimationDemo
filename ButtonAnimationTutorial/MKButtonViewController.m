//
//  MKButtonViewController.m
//  GetMeOutOfHere
//
//  Created by Richard Kim on 2/1/14.
//  Go ahead and use this for whatever.  If you need some official agreement,
//  send me an email at richard.kim@tufts.edu


#import "MKButtonViewController.h"

@interface MKButtonViewController ()

@end

@implementation MKButtonViewController
@synthesize animatedButton;
@synthesize backgroundView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]
                                               initWithTarget:self action:@selector(handleLongPress:)];
    
    //This decides how long you have to press the button for before the method runs
    longPress.minimumPressDuration = 2;
    
    [animatedButton addGestureRecognizer:longPress];
    
    //this sets the roundness of the corners of the button
    CALayer *btnLayer = [animatedButton layer];
    [btnLayer setMasksToBounds:YES];
    [btnLayer setCornerRadius:5.0f]; //change this value to change roundness
    
    
    //this sets the roundness of the corners of the layer in the back
    CALayer *Layer = [backgroundView layer];
    [Layer setMasksToBounds:YES];
    [Layer setCornerRadius:5.0f];
    backgroundView.hidden = YES;
    
    //gives the button a little bit of transparency for design sake
    [animatedButton setAlpha:0.4];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//what happens when you let go of the button
- (IBAction)buttonTouchedUp:(id)sender {
    [self stopAnimation];
}

//executes a method after the button has been held for x amount of time
//see (minimumPressDuration in viewDidLoad)
-  (void)handleLongPress:(UILongPressGestureRecognizer*)sender
{
    [self stopAnimation];
    
    //This makes sure the function runs only once.  You can play around with this
    if (sender.state == UIGestureRecognizerStateEnded) {
        NSLog(@"UIGestureRecognizerStateEnded");
        //Do Whatever You want on End of Gesture
    }
    else if (sender.state == UIGestureRecognizerStateBegan){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Example Method" message:@"replace this alertview with your own method"delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        //Do Whatever You want on Began of Gesture
    }
}

//run the animation at the first touch
- (IBAction)buttonTouchDown:(id)sender {
    [self startAnimation];
}

//if you pull your finger out of the button, it cancels the animation
- (IBAction)buttonDragOutside:(id)sender {
    [self stopAnimation];
}

-(void)startAnimation
{
    //this can be replaced with any kind of animation.  You can use a series of images,
    //I decided just to have a shrinking view to look like an animation
    
    //show the background view (the red thing) on start
    backgroundView.hidden = NO;
    [UIView beginAnimations:@"animationOff" context:NULL];
    
    //duration of animation in seconds
    [UIView setAnimationDuration:2.4f];
    
    //background view shrinks to these dimensions, making it look like an animation
    [backgroundView setFrame:CGRectMake(95, 308, 130, 0)];
    [UIView commitAnimations];
}

-(void)stopAnimation
{
    //this effectively acts as a cancel, but doesn't really "cancel" the animation
    
    //hide the view (makes the red thing disappear).  When you start an animation, it will keep
    //running, so this makes that hide, and it looks like the animation is canceled.
    backgroundView.hidden = YES;
    [UIView beginAnimations:@"animationOff" context:NULL];
    
    //how long the animation takes (should be instant)
    [UIView setAnimationDuration:0.0f];
    
    //reset the frame so that the next animation can shrink from the original dimensions
    [backgroundView setFrame:CGRectMake(95, 135, 130, 173)];
    [UIView commitAnimations];
}
@end
