#import "Device.h"
#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "MainNavigationController.h"

@implementation Device

- (void)authenticateWithCallback:(id)receiver {
    NSLog(@"authenticating");
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = @"http://localhost:3000/authenticate";
    NSDictionary *parameters = [Device thisDevice].toDictionary;
    [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"authentication response: %@", responseObject);
        
        NSNumber *error = responseObject[@"error"];
        [receiver deviceAuthenticationCallbackWithErrorCode:error];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (NSDictionary *)toDictionary {
    Device *device = [Device thisDevice];
    NSDictionary *dictionary = @{
                                 @"authentication_token": device.authenticationToken,
                                 @"device_id": device.deviceId,
                                 @"device_token": device.deviceToken,
                                 @"email": device.email,
                                 @"device_name": device.name,
    };
    return dictionary;
}

+ (Device *)thisDevice {
    RLMRealm *realm = [RLMRealm defaultRealm];
    RLMArray *devices = [Device allObjects];
    Device *device;
    
    // create device if needed
    if (devices.count == 0) {
        device = [[Device alloc] init];
        device.name = UIDevice.currentDevice.name;
        device.deviceId = [UIDevice currentDevice].identifierForVendor.UUIDString;
        device.email = @"swag@swag.com";
        
        [realm beginWriteTransaction];
        [realm addObject:device];
        [realm commitWriteTransaction];
    }
    else {
        device = [devices firstObject];
    }
    
    return device;
}

+ (NSDictionary *)defaultPropertyValues {
    return @{
        @"authenticationToken": @"",
        @"deviceId": @"",
        @"deviceToken": @"",
        @"email": @"",
        @"name": @"",
    };
}

@end
