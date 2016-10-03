//
//  InitialVelocityVC.swift
//  SUVATSolver
//
//  Created by Edward Day on 30/09/2016.
//  Copyright © 2016 Edward Day. All rights reserved.
//

import UIKit

class InitialVelocityVC: UIViewController {

    @IBOutlet weak var displacementTextField: UITextField!
    @IBOutlet weak var finalVTextField: UITextField!
    @IBOutlet weak var accelerationTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateBtnPressed(_ sender: AnyObject) {
        if timeTextField.text != nil && timeTextField.text != "" && accelerationTextField.text != nil && accelerationTextField.text != "" && displacementTextField.text != nil && displacementTextField.text != "" && finalVTextField.text != nil && finalVTextField.text != ""{
            answerLabel.text = "Nothing to work out..."
            self.view.endEditing(true)
            return
        }
        //UVAS
        if displacementTextField.text != nil && displacementTextField.text != "" && accelerationTextField.text != nil && accelerationTextField.text != "" && finalVTextField.text != nil && finalVTextField.text != "" {
            let calculation1: Float = (Float(finalVTextField.text!)! * Float(finalVTextField.text!)!) - (2 * Float(accelerationTextField.text!)! * Float(displacementTextField.text!)!)
            let calculation2: Float = sqrtf(calculation1)
            if calculation2 < 0 {
                answerLabel.text = "An error occured..."
            }
            else {
            answerLabel.text = ("Initial Velocity: \(String(calculation2)) m/s")
            }
            self.view.endEditing(true)
            return
        }
        //USVT
        if displacementTextField.text != nil && displacementTextField.text != "" && timeTextField.text != nil && timeTextField.text != "" && finalVTextField.text != nil && finalVTextField.text != "" {
            let calculation1: Float = (2 * Float(displacementTextField.text!)! / Float(timeTextField.text!)!) - Float(finalVTextField.text!)!
            answerLabel.text = ("Initial Velocity: \(String(calculation1)) m/s")
            self.view.endEditing(true)
            return
        }
        //USAT
        if displacementTextField.text != nil && displacementTextField.text != "" && timeTextField.text != nil && timeTextField.text != "" && accelerationTextField.text != nil && accelerationTextField.text != "" {
            let calculation1: Float = (Float(displacementTextField.text!)!) - (0.5 * Float(accelerationTextField.text!)! * (Float(timeTextField.text!)! * Float(timeTextField.text!)!))
            let calculation2: Float = calculation1 / Float(timeTextField.text!)!
            answerLabel.text = ("Initial Velocity: \(String(calculation2)) m/s")
            self.view.endEditing(true)
            return
        }
        //UVAT
        if finalVTextField.text != nil && finalVTextField.text != "" && timeTextField.text != nil && timeTextField.text != "" && accelerationTextField.text != nil && accelerationTextField.text != "" {
            let calculation1: Float = Float(finalVTextField.text!)! - (Float(accelerationTextField.text!)! * Float(timeTextField.text!)!)
            answerLabel.text = ("Initial Velocity: \(String(calculation1)) m/s")
            self.view.endEditing(true)
            return
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        return
    }

    @IBOutlet weak var answerLabel: UILabel!

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
