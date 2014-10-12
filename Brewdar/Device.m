#import "Device.h"
#import <UIKit/UIKit.h>

@implementation Device

- (void)authenticate {
    NSLog(@"authenticating");
    
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1:3000/athenticate"];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSLog(@"%@", data);
        NSLog(@"%@", response);
        NSLog(@"%@", error);
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"%@", json);
    }];
    
    [dataTask resume];
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
