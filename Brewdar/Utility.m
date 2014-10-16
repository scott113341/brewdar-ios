#import "Utility.h"
#import "AppDelegate.h"

@implementation Utility

+ (UIAlertView *)notificationAskUIAlert {
    // check if already registered
    UIApplication *application = [UIApplication sharedApplication];
    UIUserNotificationSettings *settings = application.currentUserNotificationSettings;
    
    // if already registered, register for remote notifications
    if (settings.types == (UIUserNotificationTypeAlert)) {
        NSLog(@"already registered for user notifications");
        
        [application registerForRemoteNotifications];
        
        return nil;
    }
    
    // if not registered, display alert asking if ok
    // if it's ok, [AppDelegate userDidSayYesToNotifications] is called
    AppDelegate *appDelegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Notifications" message:@"Brewdar uses notifications to alert you when one of your watched beers becomes available nearby.  Would you like to enable notifications?" delegate:appDelegate cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    
    return alert;
}

@end
