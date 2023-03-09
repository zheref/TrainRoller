//
//  DetailsViewController.swift
//  TrainRoller
//
//  Created by Jean Karel on 9/03/23.
//

import UIKit

class DetailsViewController: UIViewController {
    var model: Workout?
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = model?.name
    }
}
