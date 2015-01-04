//
//  LoginViewController.h
//  WishList
//
//  Created by Tyler Dahl on 12/28/14.
//  Copyright (c) 2014 Tyler Dahl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>

@interface LoginViewController : UIViewController <FBLoginViewDelegate>

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

- (IBAction)loginViaFacebook:(id)sender;

@end
