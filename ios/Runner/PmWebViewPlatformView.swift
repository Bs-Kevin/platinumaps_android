//
//  PmWebViewPlatformView.swift
//  Runner
//
//  Created by Kevin on 2025/09/11.
//

import Flutter
import UIKit

class PmWebViewPlatformView: NSObject, FlutterPlatformView {
    private var _pmViewController: PMMainViewController

    init(
        withFrame frame: CGRect,
        creationParams: Any?
    ) {
        // Safely cast creationParams to [String: Any] if possible
        let params = creationParams as? [String: Any]
        let pmPath = params?["pm_path"] as? String ?? ""
        let pmVc = PMMainViewController()
        pmVc.mapSlug = pmPath
        _pmViewController = pmVc

        super.init()
    }

    func view() -> UIView {
        return _pmViewController.view
    }
}
