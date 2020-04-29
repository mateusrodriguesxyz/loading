//
//  LoadingProtocol.swift
//  Loading
//
//  Created by Mateus Rodrigues on 29/04/20.
//  Copyright © 2020 Mateus Rodrigues. All rights reserved.
//

import UIKit

fileprivate var key: UInt8 = 42

protocol LoadingProtocol: class {
    func setLoading(_ loading: Bool)
}

extension LoadingProtocol {
    
    private var _indicator: UIActivityIndicatorView? {
        get {
            objc_getAssociatedObject(self, &key) as? UIActivityIndicatorView
        }
        set {
            objc_setAssociatedObject(self, &key, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    func setLoading(_ loading: Bool, at target: ReferenceWritableKeyPath<Self, UIView?>) {
        if _indicator == nil {
            _indicator = UIActivityIndicatorView(style: .medium)
        }
        switch loading {
        case true:
            self[keyPath: target] = _indicator
            self._indicator?.startAnimating()
        case false:
            self[keyPath: target] = nil
            self._indicator?.stopAnimating()
        }
    }
    
}

func triggerLoading(in target: LoadingProtocol, duration: TimeInterval = 0.5, completion: (()->())? = nil) {
    target.setLoading(true)
    DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
        target.setLoading(false)
        completion?()
    }
}
