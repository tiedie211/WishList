//
//  AppDelegate.m
//  WishList
//
//  Created by Tyler Dahl on 12/21/14.
//  Copyright (c) 2014 Tyler Dahl. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    // [Optional] Power your app with Local Datastore. For more info, go to
    // https://parse.com/docs/ios_guide#localdatastore/iOS
    [Parse enableLocalDatastore];
    
    // Initialize Parse.
    [Parse setApplicationId:@"c8Yo6SbFdlPNVsO2MzwtEYu0JKPFR1l2Nhbf1HuC"
                  clientKey:@"EYx7FOIu3pXAdZ8qeEWE14o5rU3bJqGJRjc2LhVT"];
    [PFFacebookUtils initializeFacebook];
    
    // [Optional] Track statistics around application opens.
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    
    // Check if user is cached and linked to Facebook, if so, bypass login
    /*if ([PFUser currentUser] && [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]) {
        UITabBarController *mainView = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"mainTabBarController"];
        self.window.rootViewController = mainView;
        
        self.window.backgroundColor = [UIColor whiteColor];
        [self.window makeKeyAndVisible];
        NSLog(@"Logged In");
    } else {
        UITabBarController *mainView = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"mainTabBarController"];
        self.window.rootViewController = mainView;
        
        [self.window.rootViewController presentViewController:[LoginViewController new] animated:YES completion:nil];
        //self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[LoginViewController new]];
        
        self.window.backgroundColor = [UIColor whiteColor];
        [self.window makeKeyAndVisible];
        NSLog(@"Logged Out");
    }*/
    
    // Override point for customization after application launch.
    /*self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[LoginViewController new]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    */
    
    /*if (FBSession.activeSession.state == FBSessionStateCreatedTokenLoaded) {
        // Show normal view
    } else {
        // Show login view
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LoginViewController *loginView = [mainStoryboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        [self.window makeKeyAndVisible];
        [self.window.rootViewController presentViewController:loginView animated:YES completion:nil];
    }*/
    return YES;
}

// ****************************************************************************
// App switching methods to support Facebook Single Sign-On.
// ****************************************************************************
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Logs 'install' and 'app activate' App Events.
    [FBAppEvents activateApp];
    
    // Handle the user leaving the app while the Facebook login dialog is being shown
    // For example: when the user presses the iOS "home" button while the login dialog is active
    //[FBAppCall handleDidBecomeActive];
    [FBAppCall handleDidBecomeActiveWithSession:[PFFacebookUtils session]];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [[PFFacebookUtils session] close];
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    // attempt to extract a token from the url
    //return [FBAppCall handleOpenURL:url sourceApplication:sourceApplication];
    return [FBAppCall handleOpenURL:url
                  sourceApplication:sourceApplication
                        withSession:[PFFacebookUtils session]];
}

@end
