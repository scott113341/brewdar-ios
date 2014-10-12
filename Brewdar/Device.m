#import "Device.h"
#import <UIKit/UIKit.h>

@implementation Device

+ (Device *)thisDevice {
    RLMRealm *realm = [RLMRealm defaultRealm];
    RLMArray *devices = [Device allObjects];
    Device *device;
    
    // create device if needed
    if (devices.count == 0) {
        device = [[Device alloc] init];
        device.name = [[UIDevice currentDevice] name];
        
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
        @"email": @"",
        @"deviceId": @"",
        @"name": @"",
        @"authenticationToken": @"",
    };
}

@end
