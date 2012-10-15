//
//  SNDismissSegue.m
//  SNSegue
//
//  Created by sonson on 2012/08/25.
//  Copyright (c) 2012年 sonson. All rights reserved.
//

#import "SNDismissSegue.h"

@implementation SNDismissSegue

- (void)perform {
	[[self sourceViewController] dismissViewControllerAnimated:YES
													completion:^(void){}
	 ];
}

@end
