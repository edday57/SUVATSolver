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
        var accessoryView1 = UIView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 40))
        accessoryView1.backgroundColor = UIColor.white
        var minusBtn1: UIButton = UIButton.init(frame: CGRect(x: 0, y: 5, width: UIScreen.main.bounds.size.width, height: 30))
        minusBtn1.setTitleColor(UIColor.black, for: UIControlState.normal)
        minusBtn1.setTitle("-", for: UIControlState.normal)
        minusBtn1.addTarget(self, action: #selector(HomeVC.minusNumber1), for: UIControlEvents.touchUpInside)
        accessoryView1.addSubview(minusBtn1)
        accessoryView1.layer.borderWidth = 1
        accessoryView1.layer.borderColor = UIColor.lightGray.cgColor
        self.box1.inputAccessoryView = accessoryView1
        
        var accessoryView3 = UIView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 40))
        accessoryView3.backgroundColor = UIColor.white
        var minusBtn3: UIButton = UIButton.init(frame: CGRect(x: 0, y: 5, width: UIScreen.main.bounds.size.width, height: 30))
        minusBtn3.setTitleColor(UIColor.black, for: UIControlState.normal)
        minusBtn3.setTitle("-", for: UIControlState.normal)
        minusBtn3.addTarget(self, action: #selector(HomeVC.minusNumber3), for: UIControlEvents.touchUpInside)
        accessoryView3.addSubview(minusBtn3)
        accessoryView3.layer.borderWidth = 1
        accessoryView3.layer.borderColor = UIColor.lightGray.cgColor
        self.box3.inputAccessoryView = accessoryView3
        
        var accessoryView2 = UIView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 40))
        accessoryView2.backgroundColor = UIColor.white
        var minusBtn2: UIButton = UIButton.init(frame: CGRect(x: 0, y: 5, width: UIScreen.main.bounds.size.width, height: 30))
        minusBtn2.setTitleColor(UIColor.black, for: UIControlState.normal)
        minusBtn2.setTitle("-", for: UIControlState.normal)
        minusBtn2.addTarget(self, action: #selector(HomeVC.minusNumber2), for: UIControlEvents.touchUpInside)
        accessoryView2.addSubview(minusBtn2)
        accessoryView2.layer.borderWidth = 1
        accessoryView2.layer.borderColor = UIColor.lightGray.cgColor
        self.box2.inputAccessoryView = accessoryView2
        
        var accessoryView4 = UIView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 40))
        accessoryView4.backgroundColor = UIColor.white
        var minusBtn4: UIButton = UIButton.init(frame: CGRect(x: 0, y: 5, width: UIScreen.main.bounds.size.width, height: 30))
        minusBtn4.setTitleColor(UIColor.black, for: UIControlState.normal)
        minusBtn4.setTitle("-", for: UIControlState.normal)
        minusBtn4.addTarget(self, action: #selector(HomeVC.minusNumber4), for: UIControlEvents.touchUpInside)
        accessoryView4.addSubview(minusBtn4)
        accessoryView4.layer.borderWidth = 1
        accessoryView4.layer.borderColor = UIColor.lightGray.cgColor
        self.box4.inputAccessoryView = accessoryView4

        // Do any additional setup after loading the view.
    }


    func minusNumber1() {

        if (self.box1.text?.hasPrefix("-"))! {
            self.box1.text = box1.text?.replacingOccurrences(of: "-", with: "")
        } else {
            self.box1.text = "-\(self.box1.text!)"
        }
    }
    
    func minusNumber2() {
        
        if (self.box2.text?.hasPrefix("-"))! {
            self.box2.text = box2.text?.replacingOccurrences(of: "-", with: "")
        } else {
            self.box2.text = "-\(self.box2.text!)"
        }
    }
    
    func minusNumber3() {
        
        if (self.box3.text?.hasPrefix("-"))! {
            self.box3.text = box3.text?.replacingOccurrences(of: "-", with: "")
        } else {
            self.box3.text = "-\(self.box3.text!)"
        }
    }
    
    func minusNumber4() {
        
        if (self.box4.text?.hasPrefix("-"))! {
            self.box4.text = box4.text?.replacingOccurrences(of: "-", with: "")
        } else {
            self.box4.text = "-\(self.box4.text!)"
        }
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
                answerLabel.text = String("Final Velocity: \(sqrtf(calculation1)) m/s")
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
        else if control.selectedSegmentIndex == 3 {
            let time: String? = box1.text
            let finalV: String? = box4.text
            let displacement: String? = box2.text
            let initialV: String? = box3.text
            if finalV != nil && finalV != "" && time != nil && time != "" && initialV != nil && initialV != "" && displacement != nil && displacement != ""{
                answerLabel.text = "Only fill three fields..."
                self.view.endEditing(true)
                return
            }
            //ASUV
            if displacement != nil && displacement != "" && finalV != nil && finalV != "" && initialV != nil && initialV != "" {
                let calculation1: Float = ((Float(finalV!)! * Float(finalV!)!) - (Float(initialV!)! * Float(initialV!)!)) / (2 * Float(displacement!)!)
                answerLabel.text = String("Acceleration: \(calculation1) m/s2")
                self.view.endEditing(true)
                return
            }
            //ASUT
            if displacement != nil && displacement != "" && time != nil && time != "" && initialV != nil && initialV != "" {
                let calculation1: Float = (Float(displacement!)! - (Float(initialV!)! * Float(time!)!)) / (0.5 * (Float(time!)! * Float(time!)!))
                answerLabel.text = String("Acceleration: \(calculation1) m/s2")
                self.view.endEditing(true)
                return
            }
            //ASVT
            if displacement != nil && displacement != "" && time != nil && time != "" && finalV != nil && finalV != "" {
                let calculation1: Float = (Float(displacement!)! - (Float(finalV!)! * Float(time!)!)) / (-0.5 * (Float(time!)! * Float(time!)!))
                answerLabel.text = String("Acceleration: \(calculation1) m/s2")
                self.view.endEditing(true)
                return
            }
            //ATUV
            if initialV != nil && initialV != "" && time != nil && time != "" && finalV != nil && finalV != "" {
                let calculation1: Float = (Float(finalV!)! - Float(initialV!)!) / Float(time!)!
                answerLabel.text = String("Acceleration: \(calculation1) m/s2")
                self.view.endEditing(true)
                return
            }
            else {
                answerLabel.text = "Please fill three fields."
                return
            }
        }
        else if control.selectedSegmentIndex == 4 {
            let displacement: String? = box1.text
            let finalV: String? = box4.text
            let acceleration: String? = box2.text
            let initialV: String? = box3.text
            if finalV != nil && finalV != "" && acceleration != nil && acceleration != "" && initialV != nil && initialV != "" && displacement != nil && displacement != ""{
                answerLabel.text = "Only fill three fields..."
                self.view.endEditing(true)
                return
            }
            //TSUV
            if displacement != nil && displacement != "" && finalV != nil && finalV != "" && initialV != nil && initialV != "" {
                let calculation1: Float = (Float(displacement!)! * 2) / (Float(initialV!)! + Float(finalV!)!)
                if calculation1 >= 0 {
                answerLabel.text = String("Time: \(calculation1) seconds")
                } else {
                answerLabel.text = String("No real solutions...")
                }
                self.view.endEditing(true)
                return
            }
            //TUVA
            if acceleration != nil && acceleration != "" && finalV != nil && finalV != "" && initialV != nil && initialV != "" {
                let calculation1: Float = (Float(finalV!)! - Float(initialV!)!) / Float(acceleration!)!
                if calculation1 >= 0 {
                    answerLabel.text = String("Time: \(calculation1) seconds")
                } else {
                    answerLabel.text = String("No real solutions...")
                }
                self.view.endEditing(true)
                return
            }
            //TSUA
            if displacement != nil && displacement != "" && acceleration != nil && acceleration != "" && initialV != nil && initialV != "" {
                /*print(displacement!)
                print(acceleration!)
                print(initialV!)
                */
                let a: Float = 0.5 * Float(acceleration!)!
                let b: Float = Float(initialV!)!
                let c: Float = Float(displacement!)! * -1
            /*    print(a)
                print(b)
                print(c)
 */
                let discriminant: Float = (b * b) - (4 * a * c)
                if discriminant < 0 {
                    answerLabel.text = "No real solutions..."
                    self.view.endEditing(true)
                    return
                }
                let answer1: Float = ((b * -1) + (sqrtf(discriminant))) / (2 * a)
                let answer2: Float = ((b * -1) - (sqrtf(discriminant))) / (2 * a)
                
                if answer1 >= 0 && answer2 >= 0 {
                    answerLabel.text = "Time: \(answer1) or \(answer2) seconds"
                    self.view.endEditing(true)
                    return
                }
                if answer1 >= 0 && answer2 < 0 {
                    answerLabel.text = "Time: \(answer1) seconds"
                    self.view.endEditing(true)
                    return
                }
                if answer2 >= 0 && answer1 < 0 {
                    answerLabel.text = "Time: \(answer2) seconds"
                    self.view.endEditing(true)
                    return
                }
                if answer2 < 0 && answer1 < 0 {
                    answerLabel.text = "No real solutions..."
                    self.view.endEditing(true)
                    return
                }
                
                self.view.endEditing(true)
                return
            }
            //TSVA
            if displacement != nil && displacement != "" && acceleration != nil && acceleration != "" && finalV != nil && finalV != "" {
                let a: Float = 0.5 * Float(acceleration!)!
                let b: Float = Float(finalV!)! * -1
                let c: Float = Float(displacement!)!
                let discriminant: Float = (b * b) - (4 * a * c)
                if discriminant < 0 {
                    answerLabel.text = "No real solutions..."
                    self.view.endEditing(true)
                    return
                }
                let answer1: Float = ((b * -1) + (sqrtf(discriminant))) / (2 * a)
                let answer2: Float = ((b * -1) - (sqrtf(discriminant))) / (2 * a)
                
                if answer1 >= 0 && answer2 >= 0 {
                    answerLabel.text = "Time: \(answer1) or \(answer2) seconds"
                    self.view.endEditing(true)
                    return
                }
                if answer1 >= 0 && answer2 < 0 {
                    answerLabel.text = "Time: \(answer1) seconds"
                    self.view.endEditing(true)
                    return
                }
                if answer2 >= 0 && answer1 < 0 {
                    answerLabel.text = "Time: \(answer2) seconds"
                    self.view.endEditing(true)
                    return
                }
                if answer2 < 0 && answer1 < 0 {
                    answerLabel.text = "No real solutions..."
                    self.view.endEditing(true)
                    return
                }
                
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

