//
//  SecondViewController.swift
//  UnitTest_Pratice
//
//  Created by ByungHoon Ann on 2022/10/10.
//

import UIKit

class SecondViewController: UIViewController {
    
    var viewModel = SecondViewControllerViewModel(networkManager: NetworkManager())
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
