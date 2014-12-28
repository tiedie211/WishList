//
//  Person.h
//  WishList
//
//  Created by Tyler Dahl on 12/21/14.
//  Copyright (c) 2014 Tyler Dahl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Person : NSObject

@property NSString *firstname;
@property NSString *lastname;
@property UIImage *image;
@property NSArray *items;

- (NSString *)fullname;

@end
