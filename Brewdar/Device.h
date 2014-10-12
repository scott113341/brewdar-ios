#import <Realm/Realm.h>

@interface Device : RLMObject

@property NSString *authenticationToken;
@property NSString *deviceId;
@property NSString *deviceToken;
@property NSString *email;
@property NSString *name;

- (void)authenticate;

+ (Device *)thisDevice;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Device>
RLM_ARRAY_TYPE(Device)
