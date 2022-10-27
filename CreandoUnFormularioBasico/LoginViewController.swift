//
//  LoginViewController.swift
//  CreandoUnFormularioBasico
//
//  Created by TEO on 24/10/22.
//

import UIKit

class LoginViewController: UIViewController{
    
    private struct Constant{
        static let expectedEmail = "hola@test.com"
        static let expectedPassword = "Password123*"
        static let successValidationMessage = "Conexion exitosa"
        static let failureValidationMessage = "Credenciales incorrectas"
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        processCredential()
    }
    
    //Este método está relacionado con la logica de negocio para no tener todo en el metodo del boton que es el relacionado con la vista (para ademas usar clean arquitecture)
    func processCredential(){
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        // 1. Force unwrap (!)
        // 2. Nil coalscing (??)
        // 3. Optional binding
        // 3.1 if let / if var
        // 3.2 guad let / guard var
        let credentialsAreValid = validateCredentials(email: email, password: password)
        processValidationResult(result: credentialsAreValid)
        
    }
        
        
    func validateCredentials(email:String, password:String) -> Bool {
        /*let condition = email == Constant.expectedEmail && password == Constant.expectedPassword
        if condition {
           return condition
        } else {
           return condition
        }*/
        return email == Constant.expectedEmail && password == Constant.expectedPassword
    }
    
    
    func processValidationResult(result:Bool){
        let message : String
        if result {
            //Mensaje de exito
            message = Constant.successValidationMessage
        } else {
            //Mensaje de error
            message = Constant.failureValidationMessage
        }
        resultLabel.text = message
        resultLabel.isHidden = false
    }
        
}
