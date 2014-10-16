#import <UIKit/UIKit.h>
#import "Device.h"

@interface LoginViewController : UIViewController <UITextViewDelegate>

@property (weak) IBOutlet UITextField *emailField;
@property (weak) IBOutlet UIButton *loginButton;

- (IBAction)loginButtonWasPressed:(id)sender;

- (void)deviceAuthenticationCallbackWithErrorCode:(NSNumber *)error;

@end
