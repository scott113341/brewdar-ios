#import <Realm/Realm.h>

@interface Device : RLMObject

@property NSString *email;
@property NSString *deviceId;
@property NSString *name;
@property NSString *authenticationToken;

+ (Device *)thisDevice;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Device>
RLM_ARRAY_TYPE(Device)
