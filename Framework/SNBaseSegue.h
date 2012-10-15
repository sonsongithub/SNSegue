//
//  SNBaseSegue.h
//  SNSegue
//
//  Created by sonson on 2012/08/25.
//  Copyright (c) 2012年 sonson. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <QuartzCore/QuartzCore.h>

@interface UIImage(SNBaseSegue)
- (UIImage*)imageInRect:(CGRect)rect;
@end

@interface SNBaseSegue : UIStoryboardSegue

- (UIView*)sourceBaseView;
- (UIView*)destinationBaseView;

- (UIImage*)sourceBaseViewImage;
- (UIImage*)destinationBaseViewImage;

- (BOOL)destinationHasNavigationController;
- (BOOL)sourceHasNavigationController;
- (BOOL)destinationIsNavigationController;
- (BOOL)sourceIsNavigationController;

@end
