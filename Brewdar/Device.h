//
//  Device.h
//  Brewdar
//
//  Created by Scott Hardy on 10/8/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

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
