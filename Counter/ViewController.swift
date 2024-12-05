//
//  ViewController.swift
//  Counter
//
//  Created by Дмитрий Перчемиди on 05.12.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private var counter: Int = 0
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var tapForCountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = "\(counter)"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonDidTap(_ sender: Any) {
        counter += 1
        counterLabel.text = "\(counter)"
    }
    
    
}


