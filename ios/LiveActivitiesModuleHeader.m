//
//  LiveActivitiesModuleHeader.m
//  pocliveactivities
//
//  Created by Luiz Gabriel Rebelatto Bianchi on 29/05/25.
//

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(LiveActivities, NSObject)

RCT_EXTERN_METHOD(startActivity)
RCT_EXTERN_METHOD(endActivity)
RCT_EXTERN_METHOD(updateActivity: (NSString *) name)

@end

