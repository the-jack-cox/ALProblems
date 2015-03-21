//
//  UIView+IBHelpers.m
//  ALProblems
//
//  Created by Jack Cox on 3/20/15.
//  Copyright (c) 2015 CapTech Consulting. All rights reserved.
//

#import "UIView+IBHelpers.h"

@implementation UIView (IBHelpers)

- (void) setAccessbilityId:(NSString *)accessbilityId {
    [self setAccessibilityIdentifier:accessbilityId];
}

- (NSString *) accessbilityId {
    return self.accessibilityIdentifier;
}
@end
