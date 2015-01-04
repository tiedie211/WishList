//
//  ItemViewController.h
//  WishList
//
//  Created by Tyler Dahl on 12/27/14.
//  Copyright (c) 2014 Tyler Dahl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "Item.h"

@interface ItemViewController : UIViewController

@property Item *itemToDisplay;
@property (weak, nonatomic) IBOutlet UILabel *itemNameLabel;
@property (weak, nonatomic) IBOutlet UITextView *itemDescriptionLabel;

@end
