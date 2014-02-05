//
//  MKButtonViewController.h
//  GetMeOutOfHere
//
//  Created by Richard Kim on 2/1/14.
//  Go ahead and use this for whatever.  If you need some official agreement,
//  send me an email at richard.kim@tufts.edu


#import <UIKit/UIKit.h>

@interface MKButtonViewController : UIViewController

//assign this to the button you want to animate
@property (weak, nonatomic) IBOutlet UIButton *animatedButton;

//this is the view that will animate.  This is just an example, you can implement your own animation
@property (weak, nonatomic) IBOutlet UIView *backgroundView;

- (IBAction)buttonTouchDown:(id)sender;
- (IBAction)buttonDragOutside:(id)sender;
- (IBAction)buttonTouchedUp:(id)sender;

-(void)startAnimation;
-(void)stopAnimation;
@end
