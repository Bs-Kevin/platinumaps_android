//
//  PmWebViewNativeFactory.swift
//  Runner
//
//  Created by Kevin on 2025/09/11.
//

import Flutter
import UIKit

class PmWebViewNativeFactory: NSObject, FlutterPlatformViewFactory {
    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        return PmWebViewPlatformView(withFrame: frame, creationParams: args)
    }

    /// Implementing this method is only necessary when the `arguments` in `createWithFrame` is not `nil`.
    func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
}
