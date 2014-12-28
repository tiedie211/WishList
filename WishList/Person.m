//
//  Person.m
//  WishList
//
//  Created by Tyler Dahl on 12/21/14.
//  Copyright (c) 2014 Tyler Dahl. All rights reserved.
//

#import "Person.h"

@implementation Person

- (NSString *)fullname {
    return [NSString stringWithFormat:@"%@ %@", self.firstname, self.lastname];
}

@end
