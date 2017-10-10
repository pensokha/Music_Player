//
//  NotificationManager .swift
//  MusicPlayer
//
//  Created by Ringo on 2017/8/23.
//  Copyright © 2017年 com.omni. All rights reserved.
//

import Foundation
// 更新播放控制器UI
let NOTI_UPDATE_PLAYER = Notification.Name("update_player")

class NotificationManager{
    
    static let shared = NotificationManager()
    
    func removeObserver(_ observer: AnyObject) {
        NotificationCenter.default.removeObserver(observer)
    }
    
    func postUpdatePlayerNotification() {
        NotificationCenter.default.post(name: NOTI_UPDATE_PLAYER, object: nil)
    }
    
    func addUpdatePlayerObserver(_ target: AnyObject, action: Selector) {
        NotificationCenter.default.addObserver(target, selector: action, name: NOTI_UPDATE_PLAYER, object: nil)
    }
    
    
     // 插拔耳机
    func audioSessionRouteChangeObserver(_ target: AnyObject, action: Selector) {
        
        NotificationCenter.default.addObserver(target, selector: action, name: .AVAudioSessionRouteChange, object: nil)
        
    }
    
    // 播放打断 (如来电等)
    func audioSessionInterruptionObserver(_ target: AnyObject, action: Selector) {
        
        NotificationCenter.default.addObserver(target, selector: action, name: .AVAudioSessionInterruption, object: nil)
        
    }
}
