//
//  PeopleTableViewController.m
//  WishList
//
//  Created by Tyler Dahl on 12/21/14.
//  Copyright (c) 2014 Tyler Dahl. All rights reserved.
//

#import "PeopleTableViewController.h"
#import "LoginViewController.h"

@implementation PeopleTableViewController

static NSString *mainCellIndentifier = @"MainPersonCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*FBLoginView *loginView = [[FBLoginView alloc] init];
    loginView.center = self.view.center;
    [self.view addSubview:loginView];
    
    // Add a test user to Parse
    PFUser *user = [PFUser user];
    user.username = @"my name";
    user.password = @"my pass";
    user.email = @"email@example.com";
    
    // other fields can be set if you want to save more information
    user[@"phone"] = @"650-555-0000";
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // Hooray! Let them use the app now.
        } else {
            NSString *errorString = [error userInfo][@"error"];
            // Show the errorString somewhere and let the user try again.
        }
    }];*/
    
    [self reloadPeople];
}

- (void)viewWillAppear:(BOOL)animated {
    // Check if user is cached and linked to Facebook, if so, bypass login
    if ([PFUser currentUser] && [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]) {
        NSLog(@"Logged In");
    } else {
        NSLog(@"Logged Out");
        LoginViewController *loginView = [[LoginViewController alloc] initWithNibName:nil bundle:nil];
        //[self.tabBarController presentViewController:loginView animated:YES completion:nil];
        [self.tabBarController presentViewController:loginView animated:YES completion:nil];
    }
}

- (void)reloadPeople {
    Person *p1 = [Person new];
    p1.firstname = @"Tyler";
    p1.lastname = @"Dahl";
    p1.image = [UIImage imageNamed:@"second"];
    Person *p2 = [Person new];
    p2.firstname = @"Courtney";
    p2.lastname = @"Dahl";
    p2.image = [UIImage imageNamed:@"second"];
    
    Item *i1 = [Item new];
    i1.name = @"Xbox One";
    i1.desc = @"Super awesome console made by Microsoft that costs about $399.";
    Item *i2 = [Item new];
    i2.name = @"Pajamas";
    i2.desc = @"I want really colorful and soft Christmas pajamas";
    Item *i3 = [Item new];
    i3.name = @"Surfboard";
    i3.desc = @"";
    
    p1.items = @[i1];
    p2.items = @[i2, i3];
    
    self.people = @[p1, p2];
}

#pragma mark -
#pragma mark table view methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.people.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:mainCellIndentifier];
    NSUInteger row = [indexPath row];
    
    Person *p = [self.people objectAtIndex:row];
    
    cell.textLabel.text = [p fullname];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark -
#pragma mark Actions

- (IBAction)logoutButtonAction:(id)sender {
    // Logout user, this automatically clears the cache
    [PFUser logOut];
    
    if ([PFUser currentUser] && [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]) {
        NSLog(@"Logged In");
    } else {
        NSLog(@"Logged Out");
    }
    
    // Return to login view controller
    //[self dismissViewControllerAnimated:YES completion:nil];
    //[self.navigationController popToRootViewControllerAnimated:YES];
    //[self.navigationController presentViewController:[LoginViewController new] animated:YES completion:nil];
    LoginViewController *loginView = [[LoginViewController alloc] initWithNibName:nil bundle:nil];
    [self.tabBarController presentViewController:loginView animated:YES completion:nil];

}

#pragma mark -
#pragma mark other methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showList"]) {
        PersonWishListViewController *nextView = segue.destinationViewController;
        
        NSUInteger row = [[self.tableView indexPathForCell:sender] row];
        nextView.personToDisplay = [self.people objectAtIndex:row];
    }
}

@end
