//
//  DisplacementVC.swift
//  SUVATSolver
//
//  Created by Edward Day on 29/09/2016.
//  Copyright © 2016 Edward Day. All rights reserved.
//

import UIKit

class DisplacementVC: UIViewController {

    @IBOutlet weak var finalVTextField: UITextField!
    @IBOutlet weak var initialVTextField: UITextField!
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
    
    @IBAction func tapped(_ sender: AnyObject) {
    }
    @IBAction func calculateBtnPressed(_ sender: AnyObject) {
        if timeTextField.text != nil && timeTextField.text != "" && accelerationTextField.text != nil && accelerationTextField.text != "" && initialVTextField.text != nil && initialVTextField.text != "" && finalVTextField.text != nil && finalVTextField.text != ""{
            answerLabel.text = "Nothing to work out..."
            self.view.endEditing(true)
            return
        }
        //SUAT
        if timeTextField.text != nil && timeTextField.text != "" && accelerationTextField.text != nil && accelerationTextField.text != "" && initialVTextField.text != nil && initialVTextField.text != "" {
            let calculation1: Float = Float(initialVTextField.text!)! * Float(timeTextField.text!)!
            let calculation2: Float = 0.5 * Float(accelerationTextField.text!)! * (Float(timeTextField.text!)! * Float(timeTextField.text!)!)
            answerLabel.text = String("Displacement: \(calculation1 + calculation2)m")
            self.view.endEditing(true)
            return
        }
        //SUVT
        if timeTextField.text != nil && timeTextField.text != "" && finalVTextField.text != nil && finalVTextField.text != "" && initialVTextField.text != nil && initialVTextField.text != "" {
            let calculation1: Float = (Float(initialVTextField.text!)! + Float(finalVTextField.text!)!) / 2
            let calculation2: Float = calculation1 * Float(timeTextField.text!)!
            answerLabel.text = String("Displacement: \(calculation2)m")
            self.view.endEditing(true)
            return
        }
        //SUVA
        if finalVTextField.text != nil && finalVTextField.text != "" && accelerationTextField.text != nil && accelerationTextField.text != "" && initialVTextField.text != nil && initialVTextField.text != "" {
            let calculation1: Float = ((Float(finalVTextField.text!)! * Float(finalVTextField.text!)!) - (Float(initialVTextField.text!)! * Float(initialVTextField.text!)!))
            let calculation2: Float = calculation1 / (2 * Float(accelerationTextField.text!)!)
            answerLabel.text = String("Displacement: \(calculation2)m")
            self.view.endEditing(true)
            return
        }
       //SVAT
        if finalVTextField.text != nil && finalVTextField.text != "" && accelerationTextField.text != nil && accelerationTextField.text != "" && timeTextField.text != nil && timeTextField.text != "" {
            let calculation1: Float = (Float(finalVTextField.text!)! * Float(timeTextField.text!)!) - (0.5 * Float(accelerationTextField.text!)! * (Float(timeTextField.text!)! * Float(timeTextField.text!)!))
            answerLabel.text = String("Displacement: \(calculation1)m")
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
