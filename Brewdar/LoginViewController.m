#import "LoginViewController.h"
#import "Device.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Device *device = [Device thisDevice];
    NSLog(@"this device: %@", device);
    
    UIUserNotificationSettings *notificationSettings = [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeAlert) categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:notificationSettings];
    
    [device authenticate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
