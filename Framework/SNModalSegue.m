//
//  SNModalSegue.m
//  SNSegue
//
//  Created by sonson on 2012/08/25.
//  Copyright (c) 2012年 sonson. All rights reserved.
//

#import "SNModalSegue.h"

@implementation SNModalSegue

- (void)perform {
	[[self sourceViewController] presentViewController:[self destinationViewController]
											  animated:YES completion:^(void){}
	 ];
}

@end
