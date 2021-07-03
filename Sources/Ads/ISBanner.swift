//
//  ISBanner.swift
//  ISAd
//
//  Created by An Nguyen on 02/07/2021.
//

import Foundation
import IronSource
import AwesomeAdCore

public class ISBanner: BannerAd<ISBannerView> {
    
    private lazy var listener: BannerDelegate = {
       BannerDelegate()
    }()
    
    private weak var rootViewController: UIViewController!
    
    public init(_id: String, with viewController: UIViewController) {
        super.init(_id)
        self.rootViewController = viewController
    }
    
    public override func load(onLoaded: @escaping OnAction, onError: @escaping OnError) {
        listener.setEventsLoad(onLoaded: { bannerView in
            self.ad = bannerView
            onLoaded()
        }, onFailed: onError)
        IronSource.setBannerDelegate(listener)
        if let vc = rootViewController {
            IronSource.loadBanner(with: vc, size: ISBannerSize(width: 320, andHeight: 50), placement: IS_BANNER)
        } else {
            listener.bannerDidFailToLoadWithError(NSError(domain: "ironsource", code: 0, userInfo: nil))
        }
    }
    
    public override func release() {
        if let banner = ad {
            IronSource.destroyBanner(banner)
        }
    }
}
