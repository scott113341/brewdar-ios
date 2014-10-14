#import "LoginViewController.h"
#import "Device.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.hidesBackButton = YES;
    
    Device *device = [Device thisDevice];
    self.emailField.text = device.email;
}

- (void)loginButtonWasPressed:(id)sender {
    NSLog(@"login button pressed");
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    Device *device = [Device thisDevice];
    
    [realm beginWriteTransaction];
    device.email = [self.emailField text];
    [realm commitWriteTransaction];
    
    [device authenticateWithCallback:self];
}

- (void)deviceAuthenticationCallbackWithErrorCode:(NSNumber *)error {
    UIAlertView *alert;
    
    if ([error  isEqual:@0]) {
        [self.navigationController popViewControllerAnimated:YES];
        return;
    }
    else if ([error  isEqual:@1]) {
        alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"Invalid email address.  Did you make a typo?" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    }
    else if ([error  isEqual:@2]) {
        alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"Invalid device parameters.  gg" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    }
    else if ([error  isEqual:@3]) {
        alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"Device is not verified.  Please verify your device by clicking the link in the email we sent you." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    }
    else if ([error  isEqual:@4]) {
        alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"Incorrect authentication token.  gg" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    }
    else {
        alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"Unknown error.  gg" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    }
    
    [alert show];
}

@end
