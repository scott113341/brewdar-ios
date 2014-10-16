#import "MainNavigationController.h"
#import "Device.h"
#import "LoginViewController.h"
#import "Utility.h"

@interface MainNavigationController ()

@end

@implementation MainNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // log realm path
    NSLog(@"%@", [RLMRealm defaultRealmPath]);
    
    // attempt to register for user notifications
    UIAlertView *alert = [Utility notificationAskUIAlert];
    if (alert) {
        [alert show];
    }
    
    // attempt to authenticate device
    Device *device = [Device thisDevice];
    NSLog(@"this device: %@", device);
    [device authenticateWithCallback:self];
}

- (void)deviceAuthenticationCallbackWithErrorCode:(NSNumber *)error {
    if ([error  isEqual:@0]) {
        NSLog(@"authenticated!");
    }
    else {
        NSLog(@"not authenticated, preseting login view from MainNavigationController");
        [self performSegueWithIdentifier:@"presentLoginViewController" sender:self];
    }
}

@end
