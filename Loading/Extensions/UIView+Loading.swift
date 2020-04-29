//
//  UIView+Loading.swift
//  Loading
//
//  Created by Mateus Rodrigues on 29/04/20.
//  Copyright © 2020 Mateus Rodrigues. All rights reserved.
//

import UIKit

extension UIView: LoadingProtocol {
    
    private var indicator: UIActivityIndicatorView {
        if let indicator = subviews.compactMap({ $0 as? UIActivityIndicatorView }).first {
            return indicator
        } else {
            let indicator = UIActivityIndicatorView(style: .medium)
            addSubview(indicator)
            indicator.translatesAutoresizingMaskIntoConstraints = false
            indicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            indicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            indicator.color = tintColor
            indicator.hidesWhenStopped = true
            return indicator
        }
    }
    
    @objc func setLoading(_ loading: Bool) {
        switch loading {
        case true:
            indicator.startAnimating()
        case false:
            indicator.stopAnimating()
        }
    }
    
}
