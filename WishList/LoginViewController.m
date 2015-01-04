//
//  LoginViewController.m
//  WishList
//
//  Created by Tyler Dahl on 12/28/14.
//  Copyright (c) 2014 Tyler Dahl. All rights reserved.
//

#import "LoginViewController.h"

@implementation LoginViewController

#pragma mark -
#pragma mark Init

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Facebook Login";
    }
    return self;
}

#pragma mark -
#pragma mark UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    loginBtn.frame = CGRectMake(20, 20, 200, 44);
    loginBtn.titleLabel.text = @"Hola";
    loginBtn.imageView.image = [UIImage imageNamed:@"FBLoginBtn"];*/
    //loginBtn.center = self.view.center;
    
    //[self.view addSubview:loginBtn];
    //FBLoginView *loginView = [[FBLoginView alloc] init];
    //loginView.center = self.view.center;
    //loginView.delegate = self;
    
    //[self.view addSubview:loginView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Check if user is cached and linked to Facebook, if so, bypass login
    //if ([PFUser currentUser] && [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]) {
    //    [self _presentMainViewControllerAnimated:NO];
    //}
}

#pragma mark -
#pragma mark Login

- (IBAction)loginViaFacebook:(id)sender {
    // Set permissions required from the facebook user account
    NSArray *permissionsArray = @[ @"user_about_me", @"user_relationships", @"user_birthday", @"user_location"];
    
    // Login PFUser using Facebook
    [PFFacebookUtils logInWithPermissions:permissionsArray block:^(PFUser *user, NSError *error) {
        [_activityIndicator stopAnimating]; // Hide loading indicator
        
        if (!user) {
            NSString *errorMessage = nil;
            if (!error) {
                NSLog(@"Uh oh. The user cancelled the Facebook login.");
                errorMessage = @"Uh oh. The user cancelled the Facebook login.";
            } else {
                NSLog(@"Uh oh. An error occurred: %@", error);
                errorMessage = [error localizedDescription];
            }
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Log In Error"
                                                            message:errorMessage
                                                           delegate:nil
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"Dismiss", nil];
            [alert show];
        } else {
            if (user.isNew) {
                NSLog(@"User with facebook signed up and logged in!");
            } else {
                NSLog(@"User with facebook logged in!");
            }
            [self _presentMainViewControllerAnimated:YES];
        }
    }];
    
    [_activityIndicator startAnimating]; // Show loading indicator until login is finished
}

#pragma mark -
#pragma mark UITabBarController

- (void)_presentMainViewControllerAnimated:(BOOL)animated {
    //UITabBarController *mainView = [[UITabBarController alloc] initWithNibName:@"mainTabBarController" bundle:nil];
    //UITabBarController *mainView = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"mainTabBarController"];
    //[self.navigationController pushViewController:mainView animated:animated];
    //[self.navigationController presentViewController:mainView animated:animated completion:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}
/*
- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView {
    //[self dismissViewControllerAnimated:NO completion:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}*/

@end
