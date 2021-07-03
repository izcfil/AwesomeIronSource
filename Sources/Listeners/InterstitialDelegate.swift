//
//  ISInterstitialDelegate.swift
//  ISAd
//
//  Created by An Nguyen on 02/07/2021.
//

import Foundation
import IronSource
import AwesomeAdCore

class InterstitialDelegate: NSObject, ISInterstitialDelegate {
    
    private var onLoaded: OnAction? = nil
    private var onFailedToLoad: OnError? = nil
    private var onDismiss: OnAction? = nil
    private var onFailedToShow: OnError? = nil
    
    func setLoadEvents(onAction: OnAction?, onError: OnError?) {
        self.onLoaded = onAction
        self.onFailedToLoad = onError
    }
    
    func setShowEvents(onDismiss: OnAction?, onFailedToShow: OnError?) {
        self.onDismiss = onDismiss
        self.onFailedToShow = onFailedToShow
    }
    
    func interstitialDidLoad() {
        onLoaded?()
    }
    
    func interstitialDidFailToLoadWithError(_ error: Error!) {
        onFailedToLoad?(error)
    }
    
    func interstitialDidOpen() {
        
    }
    
    func interstitialDidClose() {
        onDismiss?()
    }
    
    func interstitialDidShow() {
        
    }
    
    func interstitialDidFailToShowWithError(_ error: Error!) {
        onFailedToShow?(error)
    }
    
    func didClickInterstitial() {
        
    }
    
    func reset() {
        onLoaded = nil
        onFailedToLoad = nil
        onDismiss = nil
        onFailedToShow = nil
    }
    
    
    

}
