//
//  NewExersiceController.swift
//  TrainRoller
//
//  Created by Jean Karel on 12/03/23.
//

import UIKit

class NewExersiceController: UIViewController {
    
    var handler: ((Workout) -> Void)?
    
    // Intractuar con la información que ingresó el user
    @IBOutlet weak var exersiceNameTextField: UITextField!
    @IBOutlet weak var exersiceSetsTextField: UITextField!
    @IBOutlet weak var exersiceRepsTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    // Botón
    @IBAction func newExcersiceButtonTap(_ sender: Any) {
        let newUserExersice = Workout(name: exersiceNameTextField.text!,
                                      reps: Int(exersiceRepsTextField.text!)!,
                                      sets: Int(exersiceSetsTextField.text!)!,
                                      muscle: .back,
                                      restSeconds: 21)
        
        handler?(newUserExersice)
        dismiss(animated: true)
    }
    
}

// TAREA HACER SAFE UWPING - O CON GUARD.
