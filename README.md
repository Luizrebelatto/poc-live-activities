# Live Activities

# How Works
<img width="671" alt="Screenshot 2025-05-30 at 00 41 49" src="https://github.com/user-attachments/assets/8bc4d3ce-ffea-419c-acbc-bdcd69e0e113" />

# How to do:

## Create native module
- create file `LiveActivitiesModule.swift`
- you need define the methods and export to react native
```swift
import Foundation
import ActivityKit

@objc(LiveActivities)
class LiveActivities: NSObject {
  
  @objc(startActivity)
  func startActvity(){
    do{
      if #available(iOS 16.1, *){
        let LiveActivitiesAttributes = LiveActivitiesAttributes(name: "Live Activity")
        let LiveActivitiesContentState = LiveActivitiesAttributes.ContentState(leadingName: "Leading N")
        let activity = try Activity<LiveActivitiesAttributes>.request(attributes: LiveActivitiesAttributes, contentState: LiveActivitiesContentState,  pushType: nil)
        
      }else{
        print("Dynamic Island and live activies not supported")
      }
      
    }catch (_){
      print("there is some error")
    }
  }
  
  @objc(updateActivity:)
  func updateActivity(name: String){
    do{
      if #available(iOS 16.1, *){
        let LiveActivitiesContentState = LiveActivitiesAttributes.ContentState(leadingName: name)
        Task{
          for activity in Activity<LiveActivitiesAttributes>.activities {
            await activity.update(using: LiveActivitiesContentState)
          }
        }
      }
    }catch(_){
      print("some error")
    }
  }
  
 @objc(endActivity)
  func endActivity(){
    Task{
      for activity in Activity<LiveActivitiesAttributes>.activities {
        await activity.end()
      }
    }
  }
}
```

- create the file `LiveActivitiesModuleHeader.m`
  - export methods to react native using objective-c
 
```
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
```

## Create widge extension
- Defines how the Live Activity will be displayed visually on the Lock Screen and Dynamic Island

## Call methods to react native
```
import { NativeModules } from 'react-native';
const { LiveActivities } = NativeModules

  function handleStartActivities(){
    LiveActivities.startActivity();
  }
```
