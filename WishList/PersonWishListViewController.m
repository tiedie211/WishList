//
//  PersonWishListViewController.m
//  WishList
//
//  Created by Tyler Dahl on 12/21/14.
//  Copyright (c) 2014 Tyler Dahl. All rights reserved.
//

#import "PersonWishListViewController.h"
#import "ItemViewController.h"

@interface PersonWishListViewController ()

@end

@implementation PersonWishListViewController

NSString *mainCellIndentifier = @"MainItemCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.listTitle.text = [NSString stringWithFormat:@"%@'s List", self.personToDisplay.firstname];
}

#pragma mark table view methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.personToDisplay.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:mainCellIndentifier];
    NSInteger row = [indexPath row];
    
    cell.textLabel.text = ((Item *)[self.personToDisplay.items objectAtIndex:row]).name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark other methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showItem"]) {
        ItemViewController *nextView = segue.destinationViewController;
        
        NSUInteger row = [[self.itemTableView indexPathForCell:sender] row];
        nextView.itemToDisplay = [self.personToDisplay.items objectAtIndex:row];
    }
}

@end
