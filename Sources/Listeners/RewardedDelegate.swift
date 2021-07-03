//
//  RewardedDelegate.swift
//  ISAd
//
//  Created by An Nguyen on 03/07/2021.
//

import Foundation
import IronSource
import AwesomeAdCore

public class RewardedDelegate: NSObject, ISRewardedVideoDelegate {
    
    private var onLoaded: OnAction? = nil
    private var onReward: OnAction? = nil
    private var onDismiss: OnAction? = nil
    private var onFailedToShow: OnError? = nil
    
    public func setLoadEvents(onLoaded: OnAction?) {
        self.onLoaded = onLoaded
    }
    
    public func setShowEvents(onReward: OnAction?, onDismiss: OnAction?, onFailed: OnError?) {
        self.onDismiss = onDismiss
        self.onFailedToShow = onFailed
    }
    
    public func rewardedVideoHasChangedAvailability(_ available: Bool) {
        if (available) {
            onLoaded?()
        }
    }
    
    public func didReceiveReward(forPlacement placementInfo: ISPlacementInfo!) {
        onReward?()
    }
    
    public func rewardedVideoDidFailToShowWithError(_ error: Error!) {
        onFailedToShow?(error)
    }
    
    public func rewardedVideoDidOpen() {
        
    }
    
    public func rewardedVideoDidClose() {
        onDismiss?()
    }
    
    public func rewardedVideoDidStart() {
        
    }
    
    public func rewardedVideoDidEnd() {
        
    }
    
    public func didClickRewardedVideo(_ placementInfo: ISPlacementInfo!) {
        
    }
}
