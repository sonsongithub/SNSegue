//
//  CloseDoorDismissSegue.m
//  SNSegue
//
//  Created by sonson on 2012/08/25.
//  Copyright (c) 2012年 sonson. All rights reserved.
//

#import "CloseDoorDismissSegue.h"

@implementation CloseDoorDismissSegue

- (void)perform {
	
	UIImage *destinationBaseViewImage = [self destinationBaseViewImage];
	UIImage *sourceBaseViewImage = [self sourceBaseViewImage];
	
	CGRect rightRect;
	CGRect leftRect;
	rightRect = CGRectMake(destinationBaseViewImage.size.width/2, 0, destinationBaseViewImage.size.width/2, destinationBaseViewImage.size.height);
	leftRect = CGRectMake(0, 0, destinationBaseViewImage.size.width/2, destinationBaseViewImage.size.height);
	
	CGRect sourceRect = CGRectMake(0, 0, sourceBaseViewImage.size.width, sourceBaseViewImage.size.height);
	
	UIImage *rightDoor = [destinationBaseViewImage imageInRect:rightRect];
	UIImage *leftDoor = [destinationBaseViewImage imageInRect:leftRect];
	
	
	UIImageView *leftDoorImageView = [[UIImageView alloc] initWithImage:leftDoor];
	UIImageView *rightDoorImageView = [[UIImageView alloc] initWithImage:rightDoor];
	UIImageView *sourceImageView = [[UIImageView alloc] initWithImage:sourceBaseViewImage];
	
	// for debug
	[UIImageJPEGRepresentation(destinationBaseViewImage, 1) writeToFile:@"/Users/sonson/Desktop/destinationBaseViewImage.jpg" atomically:NO];
	[UIImageJPEGRepresentation(sourceBaseViewImage, 1) writeToFile:@"/Users/sonson/Desktop/sourceBaseViewImage.jpg" atomically:NO];
	
	[self.sourceBaseView addSubview:sourceImageView];
	[self.sourceBaseView addSubview:leftDoorImageView];
	[self.sourceBaseView addSubview:rightDoorImageView];
	
	if ([self sourceHasNavigationController]) {
		rightRect = CGRectMake(destinationBaseViewImage.size.width, 0, destinationBaseViewImage.size.width/2, destinationBaseViewImage.size.height);
		leftRect = CGRectMake(-destinationBaseViewImage.size.width/2, 0, destinationBaseViewImage.size.width/2, destinationBaseViewImage.size.height);
		if (![UIApplication sharedApplication].statusBarHidden)
			sourceRect.origin.y = 20;
	}
	else {
		if (![UIApplication sharedApplication].statusBarHidden) {
			rightRect = CGRectMake(destinationBaseViewImage.size.width, -20, destinationBaseViewImage.size.width/2, destinationBaseViewImage.size.height);
			leftRect = CGRectMake(-destinationBaseViewImage.size.width/2, -20, destinationBaseViewImage.size.width/2, destinationBaseViewImage.size.height);
		}
		else {
			rightRect = CGRectMake(destinationBaseViewImage.size.width, 0, destinationBaseViewImage.size.width/2, destinationBaseViewImage.size.height);
			leftRect = CGRectMake(-destinationBaseViewImage.size.width/2, 0, destinationBaseViewImage.size.width/2, destinationBaseViewImage.size.height);
		}
		sourceRect.origin.y = 0;
	}
	
	[leftDoorImageView setFrame:leftRect];
	[rightDoorImageView setFrame:rightRect];
	[sourceImageView setFrame:sourceRect];
	
	[UIView animateWithDuration:1
					 animations:^(void){
						 CGRect rightDestinationRect = rightRect;
						 CGRect leftDestinationRect = leftRect;
						 rightDestinationRect.origin.x -= rightDestinationRect.size.width;
						 leftDestinationRect.origin.x += rightDestinationRect.size.width;
						 [leftDoorImageView setFrame:leftDestinationRect];
						 [rightDoorImageView setFrame:rightDestinationRect];
					 }
					 completion:^(BOOL completed){
						 [[self sourceViewController] dismissViewControllerAnimated:NO completion:^(void){}];
						 [leftDoorImageView removeFromSuperview];
						 [rightDoorImageView removeFromSuperview];
						 
					 }];
}

@end
