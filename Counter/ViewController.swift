//
//  ViewController.swift
//  Counter
//
//  Created by Дмитрий Перчемиди on 05.12.2024.
//

import UIKit


class ViewController: UIViewController {
    
    private var counter: Int = 0
    private var currentDateAndTime: String {
        let dateNow = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return dateFormatter.string(from: dateNow)
    }
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var makeZeroButton: UIButton!
    @IBOutlet weak var decreaseButton: UIButton!
    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet weak var infoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        makeZeroButton.tintColor = .white
        makeZeroButton.backgroundColor = .black
        makeZeroButton.layer.opacity = 0.6
        
        counterLabel.text = "\(counter)"
        counterLabel.textAlignment = .center
        counterLabel.font = .systemFont(ofSize: 70)
        
        infoTextView.text = "История изменений:"
        infoTextView.textAlignment = .center
        infoTextView.font = .systemFont(ofSize: 20)
        infoTextView.isEditable = false
        infoTextView.isScrollEnabled = true
        
        decreaseButton.tintColor = .white
        decreaseButton.backgroundColor = .blue
        increaseButton.tintColor = .white
        increaseButton.backgroundColor = .red
        
    }
    
    @IBAction func zeroButtonDidTap(_ sender: Any) {
        counter = 0
        counterLabel.text = "\(counter)"
        infoTextView.text += "\n [\(currentDateAndTime)]: значение сброшено"
    }
    
    
    @IBAction func increaseButtonDidTap(_ sender: Any) {
        counter += 1
        if counter >= 100_000 {
            counterLabel.text = String(format: "%.2E", Double(counter))
        } else {
            counterLabel.text = "\(counter)"
        }
        infoTextView.text += "\n [\(currentDateAndTime)]: значение изменено на +1"
        print(currentDateAndTime)
    }
    
    
    @IBAction func decreaseButtonDidTap(_ sender: Any) {
        if counter > 0 {
            infoTextView.text += "\n [\(currentDateAndTime)]: значение изменено на -1"
            counter -= 1
            if counter >= 100_000 {
                counterLabel.text = String(format: "%.2E", Double(counter))
            } else {
                counterLabel.text = "\(counter)"
            }
        } else {
            infoTextView.text += "\n [\(currentDateAndTime)]: попытка уменьшить значение счётчика ниже 0"
            counter += 0
        }
       
    }
}

