//
//  OneViewController.swift
//  Loading
//
//  Created by Mateus Rodrigues on 28/04/20.
//  Copyright © 2020 Mateus Rodrigues. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        triggerLoading(in: imageView, duration: 2.0) {
            self.imageView.image = UIImage(named: "acabou-chorare")
        }
    }
    
    @IBAction func action(_ sender: UIButton) {        
        triggerLoading(in: sender, duration: 2.0)
    }
    
}
