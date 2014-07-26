//
//  MKButtonViewController.h
//  GetMeOutOfHere
//
//  Created by Richard Kim on 2/1/14.
//  Go ahead and use this for whatever.  If you need some official agreement,
//  send me an email at richard.kim@tufts.edu

/*
 
 Copyright (c) 2014 Choong-Won Richard Kim <cwrichardkim@gmail.com>
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is furnished
 to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 
 */


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
