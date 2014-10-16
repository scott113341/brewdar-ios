#import <Realm/Realm.h>

@interface Device : RLMObject

@property NSString *authenticationToken;
@property NSString *deviceId;
@property NSString *deviceToken;
@property NSString *email;
@property NSString *name;

- (void)authenticateWithCallback:(id)receiver;

+ (Device *)thisDevice;
+ (NSDictionary *)defaultPropertyValues;

@end

RLM_ARRAY_TYPE(Device)
