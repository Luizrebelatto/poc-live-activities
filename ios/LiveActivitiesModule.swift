//
//  LiveActivitiesModule.swift
//  pocliveactivities
//
//  Created by Luiz Gabriel Rebelatto Bianchi on 29/05/25.
//

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