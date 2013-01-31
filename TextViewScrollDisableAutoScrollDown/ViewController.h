//
//  ViewController.h
//  TextViewScrollDisableAutoScrollDown
//
//  Created by Luis Enrique Espinoza Severino on 30-01-13.
//  Copyright (c) 2013 LuisEspinoza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextViewDelegate,UITextInputDelegate>
{
    IBOutlet UITextView *_textView;
    CGRect _keyboardFrameBeginRect;
}
-(IBAction)dismissOnTap:(id)sender;
@end
