#import "MainNavigationController.h"
#import "Device.h"
#import "LoginViewController.h"

@interface MainNavigationController ()

@end

@implementation MainNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@", [RLMRealm defaultRealmPath]);
    
    // register for user notifications
    UIUserNotificationSettings *notificationSettings = [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeAlert) categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:notificationSettings];
    
    // attempt to authenticate device
    Device *device = [Device thisDevice];
    NSLog(@"this device: %@", device);
    [device authenticateWithCallback:self];
}

- (void)deviceAuthenticationCallbackWithErrorCode:(NSNumber *)error {
    NSLog(@"auth callback: %@", error);
    
    if ([error  isEqual:@0]) {
        NSLog(@"authenticated from main navigation vc");
    }
    else {
        NSLog(@"preseting login view");
        [self performSegueWithIdentifier:@"presentLoginViewController" sender:self];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
