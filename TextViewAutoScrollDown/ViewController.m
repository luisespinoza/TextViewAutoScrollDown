//
//  ViewController.m
//  TextViewAutoScrollDown
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textViewDidChange:(UITextView *)textView
{
    CGPoint bottomOffset = CGPointMake(0, _textView.contentSize.height-_textView.bounds.size.height);
    [_textView setContentOffset:bottomOffset animated:YES];
}

@end
