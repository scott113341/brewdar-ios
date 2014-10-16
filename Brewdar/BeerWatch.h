#import <Realm/Realm.h>

@interface BeerWatch : RLMObject

@property NSDate *lastChecked;
@property NSString *location;
@property NSString *name;
@property NSInteger radius;
@property BOOL triggered;
@property NSInteger untappdBid;

+ (NSDictionary *)defaultPropertyValues;

@end

RLM_ARRAY_TYPE(BeerWatch)
