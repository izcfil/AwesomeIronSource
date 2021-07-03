//
//  ISInitializer.swift
//  ISAd
//
//  Created by An Nguyen on 02/07/2021.
//

import Foundation
import IronSource

public enum ISAdUnit: String {
    case Banner = "banner"
    case Interstitial = "interstitial"
    case Rewarded = "rewarded"
}

public class ISInitializer {
    public static func initializer(_ appKey: String, ads: ISAdUnit...) {
        IronSource.initWithAppKey(appKey, adUnits: ads.map { $0.rawValue })
    }
}
