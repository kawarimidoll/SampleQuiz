//
//  ViewController.swift
//  SampleQuiz
//
//  Created by kawarimidoll on 2021/05/13.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var startButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startButton.layer.borderWidth = 2
        startButton.layer.borderColor = UIColor.black.cgColor
    }


}

