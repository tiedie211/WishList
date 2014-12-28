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

@interface PersonWishListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    IBOutlet UITableView *itemTableView;
    IBOutlet UILabel *listTitle;
}

@property UITableView *itemTableView;
@property UILabel *listTitle;
@property Person *personToDisplay;

@end
