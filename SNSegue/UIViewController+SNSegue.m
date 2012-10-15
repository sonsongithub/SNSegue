//
//  UIViewController+SNSegue.m
//  SNSegue
//
//  Created by sonson on 2012/08/25.
//  Copyright (c) 2012年 sonson. All rights reserved.
//

#import "UIViewController+SNSegue.h"

@implementation UIViewController(SNSegue)

- (IBAction)dismiss:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)toggleStatusBar:(id)sender {
	[[UIApplication sharedApplication] setStatusBarHidden:![UIApplication sharedApplication].statusBarHidden
											withAnimation:UIStatusBarAnimationSlide];
}

@end
