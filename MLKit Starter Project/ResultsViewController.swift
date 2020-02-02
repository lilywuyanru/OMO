//
//  UIViewController.swift
//  MLKit Starter Project
//
//  Created by Lily Wu on 2020-02-01.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var resultView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var carbonScore: UILabel!
    @IBOutlet weak var binLabel: UILabel!
    
    @objc dynamic var resultImage: UIImage?
    @objc dynamic var resultText: String!
    @objc dynamic var carbon_score: String!
    @objc dynamic var bin: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red:0.22, green:0.74, blue:0.72, alpha:1.0)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "back", style: .plain, target: nil, action: nil)
        
        carbon_score = "0"
        bin = "not found"
        
        resultView.image = resultImage
        resultLabel.text = resultText

        set_carbon_score(food: resultText)
        set_bin(food: resultText)
        // Do any additional setup after loading the view.
    }
    
    func set_carbon_score(food: String) {
        if food == "Granny smith" {
            carbon_score = "12"
        }
        else {
            carbon_score = "0"
        }
        carbonScore.text = "Carbon score: \(carbon_score!)"
    }
    
    func set_bin(food: String) {
        if food == "Granny smith" {
            bin = "Organic"
        }
        else {
            bin = "Not found"
        }
        binLabel.text = "Garbage type: \(bin!)"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
