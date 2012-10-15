//
//  SNBaseSegue.m
//  SNSegue
//
//  Created by sonson on 2012/08/25.
//  Copyright (c) 2012年 sonson. All rights reserved.
//

#import "SNBaseSegue.h"

@interface UIViewController(SNBaseSegue)
- (UIView*)baseViewInViewController;
@end

@implementation UIViewController(SNBaseSegue)

- (UIView*)baseViewInViewController {
	if (self.navigationController)
		return self.navigationController.view;
	else
		return self.view;
}

@end

@implementation UIImage(SNBaseSegue)

- (UIImage*)imageInRect:(CGRect)rect {
	CGFloat scale = [[UIScreen mainScreen] scale];
	CGImageRef buf = CGImageCreateWithImageInRect(self.CGImage, rect);
	UIImage *temp = [UIImage imageWithCGImage:buf scale:scale orientation:UIImageOrientationUp];
	CGImageRelease(buf);
	return temp;
}

@end

@implementation SNBaseSegue

- (BOOL)destinationHasNavigationController {
	return (((UIViewController*)self.destinationViewController).navigationController != nil);
}

- (BOOL)sourceHasNavigationController {
	return (((UIViewController*)self.sourceViewController).navigationController != nil);
}

- (BOOL)destinationIsNavigationController {
	return [self.destinationViewController isKindOfClass:[UINavigationController class]];
}

- (BOOL)sourceIsNavigationController {
	return [self.sourceViewController isKindOfClass:[UINavigationController class]];
}

- (UIView*)sourceBaseView {
	return [self.sourceViewController baseViewInViewController];
}

- (UIView*)destinationBaseView {
	return [self.destinationViewController baseViewInViewController];
}

- (UIImage*)sourceBaseViewImage {
	if ([UIApplication sharedApplication].statusBarHidden) {
		CGRect screenRect = [self sourceBaseView].frame;
		UIGraphicsBeginImageContextWithOptions(screenRect.size, NO, 0);
		
		CGContextRef ctx = UIGraphicsGetCurrentContext();
		[[UIColor blackColor] set];
		CGContextFillRect(ctx, screenRect);
		
		CGContextScaleCTM(ctx, 1, 1);
		CGContextTranslateCTM(ctx, 0, 0);
		[[self sourceBaseView].layer renderInContext:ctx];
		
		return UIGraphicsGetImageFromCurrentImageContext();
	}
	else {
		float offset = 0;
		CGRect screenRect = [self sourceBaseView].frame;
		if ([self sourceHasNavigationController]) {
			screenRect.size.height -= 20;
			offset = -20;
		}
		else {
			screenRect.origin.y = 0;
		}
		UIGraphicsBeginImageContextWithOptions(screenRect.size, NO, 0);
		
		CGContextRef ctx = UIGraphicsGetCurrentContext();
		[[UIColor blackColor] set];
		CGContextFillRect(ctx, screenRect);
		
		CGContextScaleCTM(ctx, 1, 1);
		CGContextTranslateCTM(ctx, 0, offset);
		[[self sourceBaseView].layer renderInContext:ctx];
		
		return UIGraphicsGetImageFromCurrentImageContext();
	}
}

- (UIImage*)destinationBaseViewImage {
	if ([UIApplication sharedApplication].statusBarHidden) {
		CGRect screenRect = [self destinationBaseView].frame;
		UIGraphicsBeginImageContextWithOptions(screenRect.size, NO, 0);
		
		CGContextRef ctx = UIGraphicsGetCurrentContext();
		[[UIColor blackColor] set];
		CGContextFillRect(ctx, screenRect);
		
		CGContextScaleCTM(ctx, 1, 1);
		CGContextTranslateCTM(ctx, 0, 0);
		[[self destinationBaseView].layer renderInContext:ctx];
		
		return UIGraphicsGetImageFromCurrentImageContext();
	}
	else {
		float offset = 0;
		CGRect screenRect = [self destinationBaseView].frame;
		if ([self destinationHasNavigationController]) {
			screenRect.size.height -= 20;
			offset = -20;
		}
		else {
			screenRect.origin.y = 0;
		}
		UIGraphicsBeginImageContextWithOptions(screenRect.size, NO, 0);
		
		CGContextRef ctx = UIGraphicsGetCurrentContext();
		[[UIColor blackColor] set];
		CGContextFillRect(ctx, screenRect);
		
		CGContextScaleCTM(ctx, 1, 1);
		CGContextTranslateCTM(ctx, 0, offset);
		[[self destinationBaseView].layer renderInContext:ctx];
		
		return UIGraphicsGetImageFromCurrentImageContext();
	}
}

@end
