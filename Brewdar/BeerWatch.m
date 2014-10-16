#import "BeerWatch.h"

@implementation BeerWatch

+ (NSDictionary *)defaultPropertyValues {
    return @{
             @"lastChecked": [[NSDate alloc] init],
             @"location": @"",
             @"name": @"",
             @"radius": @0,
             @"triggered": @NO,
             @"untappdBid": @0,
             };
}

@end
