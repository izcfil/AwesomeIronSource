//
//  ISRewarded.swift
//  ISAd
//
//  Created by An Nguyen on 03/07/2021.
//

import Foundation
import IronSource
import AwesomeAdCore

public class ISRewarded: RewardAd<String> {
    
    private lazy var listener: RewardedDelegate = {
       RewardedDelegate()
    }()
    
    public override func isLoaded() -> Bool {
        IronSource.hasRewardedVideo()
    }
    
    public override func load(onLoaded: @escaping OnAction, onError: @escaping OnError) {
        listener.setLoadEvents(onLoaded: onLoaded)
        listener.setShowEvents(onReward: nil, onDismiss: nil, onFailed: nil)
        IronSource.setRewardedVideoDelegate(listener)
        if IronSource.hasRewardedVideo() {
            listener.rewardedVideoHasChangedAvailability(true)
        }
    }
    
    public override func show(from viewController: UIViewController, onReward: OnAction?, onDismiss: OnAction?, onFailedToShow: OnError?) {
        listener.setLoadEvents(onLoaded: nil)
        listener.setShowEvents(onReward: onReward, onDismiss: onDismiss, onFailed: onFailedToShow)
        IronSource.showRewardedVideo(with: viewController, placement: id)
    }
}

