//
//  ViewController.swift
//  Calculator Plus
//
//  Created by Raihan on 23/3/21.
//

import UIKit

class ViewController: UIViewController {
    private var label: UILabel = {
      let label = UILabel(frame: CGRect(x: 0, y: UIScreen.main.bounds.height/2, width: UIScreen.main.bounds.width, height: 50))
      label.textAlignment = .center
      label.text = "No Storyboard!"
      return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .lightGray
            view.addSubview(label)
    }


}

