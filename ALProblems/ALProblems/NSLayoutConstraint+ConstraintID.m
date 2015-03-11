//
//  NSLayoutConstraint+ConstraintID.m
//  ALProblems
//
//  Created by Jack Cox on 3/10/15.
//  Copyright (c) 2015 CapTech Consulting. All rights reserved.
//

#import "NSLayoutConstraint+ConstraintID.h"

@implementation NSLayoutConstraint (ConstraintID)

- (void) setDebugId:(NSString *)debugId {
    self.identifier = debugId;
}

- (NSString *)debugId {
    return self.identifier;
}
@end
