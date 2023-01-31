//
//  BasicUnitTestViewController.swift
//  UnitTest_Pratice
//
//  Created by ByungHoon Ann on 2023/01/31.
//

import UIKit

class BasicUnitTestViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ferrari = Car(type: .Sport, transmissionMode: .Drive)
        ferrari.start(minutes: 120)
        print(ferrari.miles) // => 140
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
