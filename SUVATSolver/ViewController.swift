//
//  ViewController.swift
//  SUVATSolver
//
//  Created by Edward Day on 29/09/2016.
//  Copyright © 2016 Edward Day. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var finalVelocity: UIView!
    @IBOutlet weak var initialVelocity: UIView!
    @IBOutlet weak var displacement: UIView!
    @IBOutlet weak var control: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialVelocity.isHidden = true
        finalVelocity.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func segmentedControl(_ sender: AnyObject) {
        if control.selectedSegmentIndex == 0 {
            displacement.isHidden = false
            initialVelocity.isHidden = true
            finalVelocity.isHidden = true
        }
        else if control.selectedSegmentIndex == 1 {
            displacement.isHidden = true
            initialVelocity.isHidden = false
            finalVelocity.isHidden = true
        }
        else if control.selectedSegmentIndex == 2 {
            displacement.isHidden = true
            initialVelocity.isHidden = true
            finalVelocity.isHidden = false
        }
    }


}

