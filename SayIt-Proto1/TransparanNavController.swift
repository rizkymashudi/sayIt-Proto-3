//
//  TransparanNavController.swift
//  SayIt-Proto1
//
//  Created by Meiselina Sundari on 29/04/21.
//

import UIKit

class TransparanNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
    }

}
