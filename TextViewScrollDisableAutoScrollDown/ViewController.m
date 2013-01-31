//
//  ViewController.m
//  TextViewScrollDisableAutoScrollDown
//
//  Created by Luis Enrique Espinoza Severino on 30-01-13.
//  Copyright (c) 2013 LuisEspinoza. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self addKeyboardObserver];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addKeyboardObserver
{
    // This could be in an init method.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
}

- (void)keyboardDidShow:(NSNotification*)notification
{
    NSDictionary* keyboardInfo = [notification userInfo];
    NSValue* keyboardFrameBegin = [keyboardInfo valueForKey:UIKeyboardFrameBeginUserInfoKey];
    _keyboardFrameBeginRect = [keyboardFrameBegin CGRectValue];
    UIScrollView *_scrollView = (UIScrollView*)self.view;
    _scrollView.frame = CGRectMake(_scrollView.frame.origin.x,
                                   _scrollView.frame.origin.y,
                                   _scrollView.frame.size.width,
                                   _scrollView.frame.size.height - _keyboardFrameBeginRect.size.height);
}

- (void)keyboardDidHide:(NSNotification*)notification
{
    UIScrollView *_scrollView = (UIScrollView*)self.view;
    _scrollView.frame = CGRectMake(_scrollView.frame.origin.x,
                                   _scrollView.frame.origin.y,
                                   _scrollView.frame.size.width,
                                   _scrollView.frame.size.height +
                                   _keyboardFrameBeginRect.size.height);
}


- (void)textViewDidChange:(UITextView *)textView
{
    UIScrollView *_scrollView = (UIScrollView*)self.view;
    _textView.frame = CGRectMake(_textView.frame.origin.x,
                                 _textView.frame.origin.y,
                                 _textView.contentSize.width,
                                 _textView.contentSize.height);
    _scrollView.contentSize = _textView.frame.size;
    
    if (_scrollView.frame.size.height < _textView.frame.size.height) {
        CGPoint bottomOffset = CGPointMake(0,_textView.frame.size.height-_keyboardFrameBeginRect.size.height);
        [_scrollView setContentOffset:bottomOffset animated:NO];
    }
}

@end
