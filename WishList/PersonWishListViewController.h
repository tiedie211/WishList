//
//  PersonWishListViewController.h
//  WishList
//
//  Created by Tyler Dahl on 12/21/14.
//  Copyright (c) 2014 Tyler Dahl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "Item.h"

@interface PersonWishListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *itemTableView;
@property (weak, nonatomic) IBOutlet UILabel *listTitle;
@property Person *personToDisplay;

@end
