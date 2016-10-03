//
//  FinalVelocityVC.swift
//  SUVATSolver
//
//  Created by Edward Day on 01/10/2016.
//  Copyright © 2016 Edward Day. All rights reserved.
//

import UIKit

class FinalVelocityVC: UIViewController {

    @IBOutlet weak var displacementTextField: UITextField!
    @IBOutlet weak var initialVTextField: UITextField!
    @IBOutlet weak var accelerationTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var answerLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateBtnPressed(_ sender: AnyObject) {
        if timeTextField.text != nil && timeTextField.text != "" && accelerationTextField.text != nil && accelerationTextField.text != "" && initialVTextField.text != nil && initialVTextField.text != "" && displacementTextField.text != nil && displacementTextField.text != ""{
            answerLabel.text = "Nothing to work out..."
            self.view.endEditing(true)
            return
        }
        //VUSA
        if timeTextField.text != nil && timeTextField.text != "" && accelerationTextField.text != nil && accelerationTextField.text != "" && initialVTextField.text != nil && initialVTextField.text != "" {
            let calculation1: Float = (Float(initialVTextField.text!)! * Float(initialVTextField.text!)!) + (2 * Float(accelerationTextField.text!)! * Float(displacementTextField.text!)!)
            answerLabel.text = String("Final Velocity: \(calculation1) m/s")
            self.view.endEditing(true)
            return
        }
        //VSUT
        if displacementTextField.text != nil && displacementTextField.text != "" && timeTextField.text != nil && timeTextField.text != "" && initialVTextField.text != nil && initialVTextField.text != "" {
            let calculation1: Float = (2 * Float(displacementTextField.text!)! / Float(timeTextField.text!)!) - Float(initialVTextField.text!)!
            answerLabel.text = ("Final Velocity: \(String(calculation1)) m/s")
            self.view.endEditing(true)
            return
        }
        //VSAT
        if displacementTextField.text != nil && displacementTextField.text != "" && timeTextField.text != nil && timeTextField.text != "" && accelerationTextField.text != nil && accelerationTextField.text != "" {
            let calculation1: Float = (Float(displacementTextField.text!)!) + (0.5 * Float(accelerationTextField.text!)! * (Float(timeTextField.text!)! * Float(timeTextField.text!)!)) / Float(timeTextField.text!)!
            answerLabel.text = ("Final Velocity: \(String(calculation1)) m/s")
            self.view.endEditing(true)
            return
        }
        //VUAT
        if initialVTextField.text != nil && initialVTextField.text != "" && timeTextField.text != nil && timeTextField.text != "" && accelerationTextField.text != nil && accelerationTextField.text != "" {
            let calculation1: Float = Float(initialVTextField.text!)! + (Float(accelerationTextField.text!)! * Float(accelerationTextField.text!)!)
            answerLabel.text = ("Final Velocity: \(String(calculation1)) m/s")
            self.view.endEditing(true)
            return
        }
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        return
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
