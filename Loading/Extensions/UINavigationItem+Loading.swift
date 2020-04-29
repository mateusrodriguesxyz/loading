//
//  UINavigationItem+Loading.swift
//  Loading
//
//  Created by Mateus Rodrigues on 29/04/20.
//  Copyright © 2020 Mateus Rodrigues. All rights reserved.
//

import UIKit

extension UINavigationItem: LoadingProtocol {
    func setLoading(_ loading: Bool) {
        setLoading(loading, at: \.titleView)
    }
    
}
