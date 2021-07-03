//
//  BannerDelegate.swift
//  ISAd
//
//  Created by An Nguyen on 03/07/2021.
//

import Foundation
import IronSource
import AwesomeAdCore

public typealias OnBannerLoaded = (ISBannerView) -> Void

public class BannerDelegate: NSObject, ISBannerDelegate {
    
    private var onLoaded: OnBannerLoaded? = nil
    private var onFailedToLoad: OnError? = nil
    
    public func setEventsLoad(onLoaded: OnBannerLoaded?, onFailed: OnError?) {
        self.onLoaded = onLoaded
        self.onFailedToLoad = onFailed
    }
    
    
    public func bannerDidLoad(_ bannerView: ISBannerView!) {
        onLoaded?(bannerView)
    }
    
    public func bannerDidFailToLoadWithError(_ error: Error!) {
        onFailedToLoad?(error)
    }
    
    public func didClickBanner() {
        
    }
    
    public func bannerWillPresentScreen() {
        
    }
    
    public func bannerDidDismissScreen() {
        
    }
    
    public func bannerWillLeaveApplication() {
        
    }
    
    public func bannerDidShow() {
        
    }
    
    
    
    
}
