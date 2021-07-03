//
//  ISInterstitial.swift
//  ISAd
//
//  Created by An Nguyen on 02/07/2021.
//

import Foundation
import AwesomeAdCore
import IronSource

public class ISInterstitial: InterstitialAd<String> {
    
    private lazy var listener: InterstitialDelegate = {
       InterstitialDelegate()
    }()
    
    public override func isLoaded() -> Bool {
        IronSource.hasInterstitial()
    }
    
    public override func load(onLoaded: @escaping OnAction, onError: @escaping OnError) {
        listener.reset()
        listener.setLoadEvents(onAction: onLoaded, onError: onError)
        IronSource.setInterstitialDelegate(listener)
        if (isLoaded()) {
            listener.interstitialDidLoad()
        } else {
            IronSource.loadInterstitial()
        }
    }
    
    public override func show(from viewController: UIViewController, onDismiss: OnAction? = nil, onFailedToShow: OnError? = nil) {
        listener.reset()
        listener.setShowEvents(onDismiss: onDismiss, onFailedToShow: onFailedToShow)
        IronSource.showInterstitial(with: viewController, placement: id)
    }
}
