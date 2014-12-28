//
//  ItemViewController.m
//  WishList
//
//  Created by Tyler Dahl on 12/27/14.
//  Copyright (c) 2014 Tyler Dahl. All rights reserved.
//

#import "ItemViewController.h"

@implementation ItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.itemNameLabel.text = self.itemToDisplay.name;
    self.itemDescriptionLabel.text = self.itemToDisplay.desc;
    [self.itemDescriptionLabel setFont:[UIFont systemFontOfSize:16.0]];
}

@end
