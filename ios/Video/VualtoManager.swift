//
//  VualtoManager.swift
//  Pods-VualtoDRM_Example
//
//  Created by Eugen Zadani on 03/04/2020.
//

import Foundation
import UIKit
import AVKit
import vudrmFairPlay

@objc public final class VualtoManager: NSObject {
    
    private override init() {
        super.init()
    }
    
    @objc public func getVualtoPlayer(assetURL: String? = nil, token: String, contentID: String) -> AVPlayer? {
        
        guard let unwrappedAssetURL = assetURL,
                let assetNSURL = NSURL(string: unwrappedAssetURL),
                let drm = vudrmFairPlay(url: assetNSURL, token: token, contentID: contentID) else {
            return nil
        }
        
        let playerItem = AVPlayerItem(asset: drm.asset)
        return AVPlayer(playerItem: playerItem)
    }
    
    @objc public func getVualtoPlayerItem(assetURL: String? = nil, token: String, contentID: String) -> AVPlayerItem? {
        
        guard let unwrappedAssetURL = assetURL,
                let assetNSURL = NSURL(string: unwrappedAssetURL),
                let drm = vudrmFairPlay(url: assetNSURL, token: token, contentID: contentID) else {
            return nil
        }
        
        let playerItem = AVPlayerItem(asset: drm.asset)
        return playerItem
    }
    
}