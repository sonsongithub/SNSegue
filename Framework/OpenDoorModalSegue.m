//
//  OpenDoorModelSegue.m
//  SNSegue
//
//  Created by sonson on 2012/08/25.
//  Copyright (c) 2012年 sonson. All rights reserved.
//

#import "OpenDoorModalSegue.h"

@implementation OpenDoorModalSegue

- (void)perform {
	[[self sourceViewController] presentViewController:[self destinationViewController] animated:NO completion:^(void){
	
		UIImage *toViewImage = [self destinationBaseViewImage];
		UIImage *fromImage = [self sourceBaseViewImage];
		
		CGRect rightRect;
		CGRect leftRect;
		rightRect = CGRectMake(fromImage.size.width/2, 0, fromImage.size.width/2, fromImage.size.height);
		leftRect = CGRectMake(0, 0, fromImage.size.width/2, fromImage.size.height);
		
		CGRect desitionationRect = CGRectMake(0, 0, toViewImage.size.width, toViewImage.size.height);
		
		UIImage *rightDoor = [fromImage imageInRect:rightRect];
		UIImage *leftDoor = [fromImage imageInRect:leftRect];

		UIImageView *leftDoorImageView = [[UIImageView alloc] initWithImage:leftDoor];
		UIImageView *rightDoorImageView = [[UIImageView alloc] initWithImage:rightDoor];
		UIImageView *destinationImageView = [[UIImageView alloc] initWithImage:toViewImage];
		
		// for debug
		[UIImageJPEGRepresentation(toViewImage, 1) writeToFile:@"/Users/sonson/Desktop/toViewImage.jpg" atomically:NO];
		[UIImageJPEGRepresentation(fromImage, 1) writeToFile:@"/Users/sonson/Desktop/fromImage.jpg" atomically:NO];
		
		if ([self destinationIsNavigationController]) {
			if (![UIApplication sharedApplication].statusBarHidden) {
				rightRect = CGRectMake(fromImage.size.width/2, 20, fromImage.size.width/2, fromImage.size.height);
				leftRect = CGRectMake(0, 20, fromImage.size.width/2, fromImage.size.height);
			}
			else {
				rightRect = CGRectMake(fromImage.size.width/2, 0, fromImage.size.width/2, fromImage.size.height);
				leftRect = CGRectMake(0, 0, fromImage.size.width/2, fromImage.size.height);
			}
		}
		else {
			rightRect = CGRectMake(fromImage.size.width/2, 0, fromImage.size.width/2, fromImage.size.height);
			leftRect = CGRectMake(0, 0, fromImage.size.width/2, fromImage.size.height);
		}
		[self.destinationBaseView addSubview:destinationImageView];
		[self.destinationBaseView addSubview:leftDoorImageView];
		[self.destinationBaseView addSubview:rightDoorImageView];
		
		[leftDoorImageView setFrame:leftRect];
		[rightDoorImageView setFrame:rightRect];
		
		[destinationImageView setFrame:desitionationRect];
		
		[UIView animateWithDuration:0.8
						 animations:^(void){
							 CGRect rightDestinationRect = rightRect;
							 CGRect leftDestinationRect = leftRect;
							 rightDestinationRect.origin.x += rightDestinationRect.size.width;
							 leftDestinationRect.origin.x -= rightDestinationRect.size.width;
							 [leftDoorImageView setFrame:leftDestinationRect];
							 [rightDoorImageView setFrame:rightDestinationRect];
						 }
						 completion:^(BOOL completed){
							 [leftDoorImageView removeFromSuperview];
							 [rightDoorImageView removeFromSuperview];
							 [destinationImageView removeFromSuperview];
						 }];
	}];
}

@end
