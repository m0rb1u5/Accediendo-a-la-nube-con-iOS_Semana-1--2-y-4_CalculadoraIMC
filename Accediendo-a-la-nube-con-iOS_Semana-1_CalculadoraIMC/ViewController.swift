//
//  ViewController.swift
//  Accediendo-a-la-nube-con-iOS_Semana-1_CalculadoraIMC
//
//  Created by Juan Carlos Carbajal Ipenza on 24/09/16.
//  Copyright © 2016 Juan Carlos Carbajal Ipenza. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var peso: UITextField!
    @IBOutlet weak var estatura: UITextField!
    @IBOutlet weak var scroll: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        peso.delegate = self
        estatura.delegate = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func calcularIMC(sender: AnyObject) {
        var IMC: Double
        let pesoLocal: Double?
        pesoLocal=Double(self.peso.text!)
        let estaturaLocal: Double = Double(self.estatura.text!)!
        IMC = pesoLocal! / (estaturaLocal*estaturaLocal)
        print("Resultado:\(IMC)")
    }
    @IBAction func textFieldDoneEditing(sender: UITextField) {
        sender.resignFirstResponder() // desaparecer el teclado
    }
    @IBAction func backgroundTap(sender: UIControl) {
        peso.resignFirstResponder()
        estatura.resignFirstResponder()
    }
    @IBAction func textFieldDidBeginEditing(textField: UITextField) {
        var punto: CGPoint
        punto = CGPointMake(0, textField.frame.origin.y - 50)
        self.scroll.setContentOffset(punto, animated: true)
    }
    @IBAction func textFieldDidEndEditing(textField: UITextField) {
        self.scroll.setContentOffset(CGPointZero, animated: true)
    }
}

