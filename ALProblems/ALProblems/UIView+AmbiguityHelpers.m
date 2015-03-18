//
//  UIView+AmbiguityHelpers.m
//  ALProblems
//
//  Created by Jack Cox on 3/14/15.
//  Copyright (c) 2015 CapTech Consulting. All rights reserved.
//

#import "UIView+AmbiguityHelpers.h"

@implementation UIView (AmbiguityHelpers)

- (void)exerciseAmbiguityInLayoutRepeatedly
{
#ifdef DEBUG
    if (self.hasAmbiguousLayout) {
        [NSTimer scheduledTimerWithTimeInterval:.5
                                         target:self
                                       selector:@selector(exerciseAmbiguityInLayout)
                                       userInfo:nil
                                        repeats:YES];
    }
    for (UIView *subview in self.subviews) {
        [subview exerciseAmbiguityInLayoutRepeatedly];
    }
#endif
}
@end
