//
//  HomeVC.swift
//  SUVATSolver
//
//  Created by Edward Day on 03/10/2016.
//  Copyright © 2016 Edward Day. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var control: UISegmentedControl!
    @IBOutlet weak var box1: UITextField!
    @IBOutlet weak var box2: UITextField!
    @IBOutlet weak var box3: UITextField!
    @IBOutlet weak var box4: UITextField!
    @IBOutlet weak var answerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func calculateTapped(_ sender: AnyObject) {
        if control.selectedSegmentIndex == 0 {
            let time: String? = box1.text
            let acceleration: String? = box2.text
            let initialVelocity: String? = box3.text
            let finalVelocity: String? = box4.text
            if time != nil && time != "" && acceleration != nil && acceleration != "" && initialVelocity != nil && initialVelocity != "" && finalVelocity != nil && finalVelocity != ""{
                answerLabel.text = "Only fill three fields..."
                self.view.endEditing(true)
                return
            }
            //SUAT
            if time != nil && time != "" && acceleration != nil && acceleration != "" && initialVelocity != nil && initialVelocity != "" {
                let calculation1: Float = Float(initialVelocity!)! * Float(initialVelocity!)!
                let calculation2: Float = 0.5 * Float(acceleration!)! * (Float(time!)! * Float(time!)!)
                answerLabel.text = String("Displacement: \(calculation1 + calculation2)m")
                self.view.endEditing(true)
                return
            }
            //SUVT
            if time != nil && time != "" && finalVelocity != nil && finalVelocity != "" && initialVelocity != nil && initialVelocity != "" {
                let calculation1: Float = (Float(initialVelocity!)! + Float(finalVelocity!)!) / 2
                let calculation2: Float = calculation1 * Float(time!)!
                answerLabel.text = String("Displacement: \(calculation2)m")
                self.view.endEditing(true)
                return
            }
            //SUVA
            if finalVelocity != nil && finalVelocity != "" && acceleration != nil && acceleration != "" && initialVelocity != nil && initialVelocity != "" {
                let calculation1: Float = ((Float(finalVelocity!)! * Float(finalVelocity!)!) - (Float(initialVelocity!)! * Float(initialVelocity!)!))
                let calculation2: Float = calculation1 / (2 * Float(acceleration!)!)
                answerLabel.text = String("Displacement: \(calculation2)m")
                self.view.endEditing(true)
                return
            }
            //SVAT
            if finalVelocity != nil && finalVelocity != "" && acceleration != nil && acceleration != "" && time != nil && time != "" {
                let calculation1: Float = (Float(finalVelocity!)! * Float(time!)!) - (0.5 * Float(acceleration!)! * (Float(time!)! * Float(time!)!))
                answerLabel.text = String("Displacement: \(calculation1)m")
                self.view.endEditing(true)
                return
            }
            else {
                answerLabel.text = "Please fill three fields."
                return
            }

        }
        else if control.selectedSegmentIndex == 1 {
            let time: String? = box1.text
            let acceleration: String? = box2.text
            let displacement: String? = box3.text
            let finalV: String? = box4.text
            if time != nil && time != "" && acceleration != nil && acceleration != "" && displacement != nil && displacement != "" && finalV != nil && finalV != ""{
                answerLabel.text = "Only fill three fields..."
                self.view.endEditing(true)
                return
            }
            //UVAS
            if displacement != nil && displacement != "" && acceleration != nil && acceleration != "" && finalV != nil && finalV != "" {
                let calculation1: Float = (Float(finalV!)! * Float(finalV!)!) - (2 * Float(acceleration!)! * Float(displacement!)!)
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
            if displacement != nil && displacement != "" && time != nil && time != "" && finalV != nil && finalV != "" {
                let calculation1: Float = (2 * Float(displacement!)! / Float(time!)!) - Float(finalV!)!
                answerLabel.text = ("Initial Velocity: \(String(calculation1)) m/s")
                self.view.endEditing(true)
                return
            }
            //USAT
            if displacement != nil && displacement != "" && time != nil && time != "" && acceleration != nil && acceleration != "" {
                let calculation1: Float = (Float(displacement!)!) - (0.5 * Float(acceleration!)! * (Float(time!)! * Float(time!)!))
                let calculation2: Float = calculation1 / Float(time!)!
                answerLabel.text = ("Initial Velocity: \(String(calculation2)) m/s")
                self.view.endEditing(true)
                return
            }
            //UVAT
            if finalV != nil && finalV != "" && time != nil && time != "" && acceleration != nil && acceleration != "" {
                let calculation1: Float = Float(finalV!)! - (Float(acceleration!)! * Float(time!)!)
                answerLabel.text = ("Initial Velocity: \(String(calculation1)) m/s")
                self.view.endEditing(true)
                return
            }
            else {
                answerLabel.text = "Please fill three fields."
                return
            }
            
        }
        else if control.selectedSegmentIndex == 2 {
            let time: String? = box1.text
            let acceleration: String? = box2.text
            let displacement: String? = box3.text
            let initialV: String? = box4.text
            if time != nil && time != "" && acceleration != nil && acceleration != "" && initialV != nil && initialV != "" && displacement != nil && displacement != ""{
                answerLabel.text = "Only fill three fields..."
                self.view.endEditing(true)
                return
            }
            //VUSA
            if displacement != nil && displacement != "" && acceleration != nil && acceleration != "" && initialV != nil && initialV != "" {
                let calculation1: Float = (Float(initialV!)! * Float(initialV!)!) + (2 * Float(acceleration!)! * Float(displacement!)!)
                answerLabel.text = String("Final Velocity: \(calculation1) m/s")
                self.view.endEditing(true)
                return
            }
            //VSUT
            if displacement != nil && displacement != "" && time != nil && time != "" && initialV != nil && initialV != "" {
                let calculation1: Float = (2 * Float(displacement!)! / Float(time!)!) - Float(initialV!)!
                answerLabel.text = ("Final Velocity: \(String(calculation1)) m/s")
                self.view.endEditing(true)
                return
            }
            //VSAT
            if displacement != nil && displacement != "" && time != nil && time != "" && acceleration != nil && acceleration != "" {
                let calculation1: Float = (Float(displacement!)!) + (0.5 * Float(acceleration!)! * (Float(time!)! * Float(time!)!)) / Float(time!)!
                answerLabel.text = ("Final Velocity: \(String(calculation1)) m/s")
                self.view.endEditing(true)
                return
            }
            //VUAT
            if initialV != nil && initialV != "" && time != nil && time != "" && acceleration != nil && acceleration != "" {
                let calculation1: Float = Float(initialV!)! + (Float(acceleration!)! * Float(acceleration!)!)
                answerLabel.text = ("Final Velocity: \(String(calculation1)) m/s")
                self.view.endEditing(true)
                return
            }
            else {
                answerLabel.text = "Please fill three fields."
                return
            }
        }
    }
    @IBAction func tappedBackground(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func controlTapped(_ sender: AnyObject) {
        view.endEditing(true)
        if control.selectedSegmentIndex == 0 {
            box1.placeholder = "TIME"
            box2.placeholder = "ACCELERATION"
            box3.placeholder = "INITIAL VELOCITY"
            box4.placeholder = "FINAL VELOCITY"
            box1.text = nil
            box2.text = nil
            box3.text = nil
            box4.text = nil
        } else if control.selectedSegmentIndex == 1 {
            box1.placeholder = "TIME"
            box2.placeholder = "ACCELERATION"
            box3.placeholder = "DISPLACEMENT"
            box4.placeholder = "FINAL VELOCITY"
            box1.text = nil
            box2.text = nil
            box3.text = nil
            box4.text = nil
        } else if control.selectedSegmentIndex == 2 {
            box1.placeholder = "TIME"
            box2.placeholder = "ACCELERATION"
            box3.placeholder = "DISPLACEMENT"
            box4.placeholder = "INITIAL VELOCITY"
            box1.text = nil
            box2.text = nil
            box3.text = nil
            box4.text = nil
        } else if control.selectedSegmentIndex == 3 {
            box1.placeholder = "TIME"
            box2.placeholder = "DISPLACEMENT"
            box3.placeholder = "INITIAL VELOCITY"
            box4.placeholder = "FINAL VELOCITY"
            box1.text = nil
            box2.text = nil
            box3.text = nil
            box4.text = nil
        } else if control.selectedSegmentIndex == 4 {
            box1.placeholder = "DISPLACEMENT"
            box2.placeholder = "ACCELERATION"
            box3.placeholder = "INITIAL VELOCITY"
            box4.placeholder = "FINAL VELOCITY"
            box1.text = nil
            box2.text = nil
            box3.text = nil
            box4.text = nil
        }
        
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
