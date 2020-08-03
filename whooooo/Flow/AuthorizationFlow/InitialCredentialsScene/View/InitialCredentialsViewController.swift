//
//  InitialCredentialsViewController.swift
//  whooooo
//
//  Created by Uladzislau Volchyk on 8/1/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

import UIKit
import FirebaseAuth

protocol CredentialInputPresenter {
    func authorizeCredentials(email: String, password: String, login: String?)
    var confirmationCompletion: (() -> ())! {get set}
}

class InitialCredentialsViewController: BaseViewController, InitialCredentialsPresenterDelegate, UITextFieldDelegate {



    enum AuthState {
        case signIn, signUp
    }

    
    let presenter: CredentialInputPresenter!
    var currentState: AuthState = .signIn
    var layer:CAShapeLayer? = nil
    var layerWithTitle:CAShapeLayer? = nil
        
    init(presenter: CredentialInputPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.autocapitalizationType = .none
        textField.delegate = self
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.delegate = self
        return textField
    }()
    
    lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.placeholder = "Login"
        textField.delegate = self
        return textField
    }()
    
    
    lazy var signInLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign in"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = UIColor(red: 69/255, green: 67/255, blue: 70/255, alpha: 1.0)
        return label
    }()
    
    lazy var signInButton: UIButton = {
        let button = UIButton()
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 50
        button.backgroundColor = UIColor(red: 129/255, green: 75/255, blue: 112/255, alpha: 1.0)
//        button.addTarget(self, action: #selector(moveDown), for: .touchUpInside)
        button.addTarget(self, action: #selector(authorizationTap), for: .touchUpInside)
        button.setImage(UIImage(named: "next")?.tint(with: UIColor.white), for: .normal)
        return button
    }()
    
    lazy var signUpButton: UIButton = {
       let button = UIButton()
        button.setAttributedTitle(NSMutableAttributedString(string:"Sign Up", attributes:[NSAttributedString.Key.underlineStyle : 1]), for: .normal)
        button.addTarget(self, action: #selector(switchBetweenAuthorisationMethods), for: .touchUpInside)
        return button
    }()
    
    lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setAttributedTitle(NSMutableAttributedString(string:"Forgot Password", attributes:[NSAttributedString.Key.underlineStyle : 1]), for: .normal)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 250/255, alpha: 1.0)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        loginTextField.alpha = 0.0
        setupSignUpButton(button: signUpButton)
        setupForgotPasswordButton(button: forgotPasswordButton)
        setupLoginTextField(textField: loginTextField)
        setupEmailTextField(textField: emailTextField)
        setupPasswordTextField(textField: passwordTextField)
        setupSignInLabel(label: signInLabel)
        setupSignInButton(button: signInButton)
        complexShape3()
        layerWithTitle = complexShape()
        layer = complexShape2()
       // view.addSubview(signInButton)
        //signInButton.addTarget(presenter, action: #selector(presenter.signInTap), for: .touchUpInside)
        
//<<<<<<< HEAD:whooooo/Flows/AuthorizationFlow/InitialCredentialsScene/View/InitialCredentialsViewController.swift
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -150
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let emailBottomLine = CALayer()
        emailBottomLine.frame = CGRect(x: 0.0, y: 30, width: 300, height: 1.0)
        emailBottomLine.backgroundColor = UIColor.lightGray.cgColor
        emailTextField.borderStyle = UITextField.BorderStyle.none
        emailTextField.layer.addSublayer(emailBottomLine)
        
        let passwordBottomLine = CALayer()
        passwordBottomLine.frame = CGRect(x: 0.0, y: 30, width: 300, height: 1.0)
        passwordBottomLine.backgroundColor = UIColor.lightGray.cgColor
        passwordTextField.borderStyle = UITextField.BorderStyle.none
        passwordTextField.layer.addSublayer(passwordBottomLine)
        let passwordRepeatBottomLine = CALayer()
        passwordRepeatBottomLine.frame = CGRect(x: 0.0, y: 30, width: 300, height: 1.0)
        passwordRepeatBottomLine.backgroundColor = UIColor.lightGray.cgColor
        loginTextField.borderStyle = UITextField.BorderStyle.none
        loginTextField.layer.addSublayer(passwordRepeatBottomLine)
    }
    
    func setupSignInLabel(label: UILabel) {
        self.view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 100).isActive = true
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        label.leftAnchor.constraint(equalTo: passwordTextField.leftAnchor).isActive = true
        label.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 55).isActive = true
//        let labelTopAnchor = label.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 55)
//        labelTopAnchor.priority = UILayoutPriority(rawValue: 250)
//        labelTopAnchor.isActive = true
    }
    
    func setupForgotPasswordButton(button: UIButton) {
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 150).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30).isActive = true
        button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -10).isActive = true
    }
    
    func setupSignUpButton(button: UIButton) {
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30).isActive = true
        button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -10).isActive = true
    }
    
    func setupSignInButton(button: UIButton) {
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button.rightAnchor.constraint(equalTo: forgotPasswordButton.rightAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: signInLabel.centerYAnchor).isActive = true
    }
    
    func setupEmailTextField(textField: UITextField) {
        self.view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftAnchor.constraint(equalTo: signUpButton.leftAnchor).isActive = true
        textField.rightAnchor.constraint(equalTo: forgotPasswordButton.rightAnchor).isActive = true
        textField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        textField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 30).isActive = true
    }
    
    func setupPasswordTextField(textField: UITextField) {
        self.view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftAnchor.constraint(equalTo: signUpButton.leftAnchor).isActive = true
        textField.rightAnchor.constraint(equalTo: forgotPasswordButton.rightAnchor).isActive = true
        textField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        textField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30).isActive = true
    }
    
    func setupLoginTextField(textField: UITextField) {
        self.view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftAnchor.constraint(equalTo: signUpButton.leftAnchor).isActive = true
        textField.rightAnchor.constraint(equalTo: forgotPasswordButton.rightAnchor).isActive = true
        textField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 15).isActive = true
    }
    

     func complexShape() -> CAShapeLayer {
            let path = UIBezierPath()
            path.move(to: CGPoint(x: 0.0, y: 240))
            path.addCurve(to: CGPoint(x: self.view.frame.size.width/2 - 50, y: 150),
                          controlPoint1: CGPoint(x: self.view.frame.size.width - 100, y: 500),
                          controlPoint2: CGPoint(x: self.view.frame.size.width-50, y: 0))
            path.addLine(to: CGPoint(x: 0, y: 20))
            path.close()
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = path.cgPath
            shapeLayer.fillColor = UIColor(red: 129/255, green: 75/255, blue: 112/255, alpha: 1.0).cgColor
            self.view.layer.addSublayer(shapeLayer)
    
            let label = CATextLayer()
            label.frame = CGRect(x: 50, y: 165, width: 200, height: 40)
            label.font = UIFont(name:"HelveticaNeue-Bold", size: 14.5)
            //label.backgroundColor = UIColor.black.cgColor
            label.string = "Welcome"
    
            let label2 = CATextLayer()
            label2.frame = CGRect(x: 50, y: 205, width: 200, height: 40)
            //label2.backgroundColor = UIColor.black.cgColor
            label2.font = UIFont(name:"HelveticaNeue-Bold", size: 14.5)
            label2.string = "Back"
    
            shapeLayer.addSublayer(label)
            shapeLayer.addSublayer(label2)
            return shapeLayer
        }
    
    func changeLayerTitle(layer: CATextLayer, text:String) {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.moveIn
        layer.add(transition, forKey: "transition")
        layer.string = text
    }
    
    @objc func switchBetweenAuthorisationMethods() {
        
        let layerOne:CATextLayer = (layerWithTitle?.sublayers![0])! as! CATextLayer
        let layerTwo:CATextLayer = (layerWithTitle?.sublayers![1])! as! CATextLayer
        
        if (currentState == .signIn) {
            currentState = .signUp
//            signUpButton.setAttributedTitle(NSMutableAttributedString(string:"Sign in", attributes:[NSAttributedString.Key.underlineStyle : 1]), for: .normal)
//            signInLabel.text = "Sigh up"
            
            changeLayerTitle(layer: layerOne, text: "Join us")
            changeLayerTitle(layer: layerTwo, text: "")
            
            UIView.transition(with: signUpButton, duration: 0.5, options: .transitionFlipFromTop, animations: {
                self.signUpButton.setAttributedTitle(NSMutableAttributedString(string:"Sign in", attributes:[NSAttributedString.Key.underlineStyle : 1]), for: .normal)
            })
            UIView.transition(with: signInLabel, duration: 0.5, options: .transitionFlipFromLeft, animations: {
                self.signInLabel.text = "Sigh up"
            })
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.loginTextField.alpha = 1.0
            })
        } else {
            currentState = .signIn
            changeLayerTitle(layer: layerOne, text: "Welcome")
            changeLayerTitle(layer: layerTwo, text: "Back")
            
//            signUpButton.setAttributedTitle(NSMutableAttributedString(string:"Sign Up", attributes:[NSAttributedString.Key.underlineStyle : 1]), for: .normal)
//            signInLabel.text = "Sigh in"
            UIView.transition(with: signUpButton, duration: 0.5, options: .transitionFlipFromTop, animations: {
                self.signUpButton.setAttributedTitle(NSMutableAttributedString(string:"Sign Up", attributes:[NSAttributedString.Key.underlineStyle : 1]), for: .normal)
            })
            UIView.transition(with: signInLabel, duration: 0.5, options: .transitionFlipFromLeft, animations: {
                self.signInLabel.text = "Sigh in"
            })
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.loginTextField.alpha = 0.0
            })
        }
    }

    @objc func authorizationTap() {
       if let email = emailTextField.text, let password = passwordTextField.text {
           if currentState == .signUp, let login = loginTextField.text {
               presenter.authorizeCredentials(email: email, password: password, login: login)
               return
           }
            //moveDown()
           presenter.authorizeCredentials(email: email, password: password, login: nil)
        }
    }

    @objc func moveDown() {

        let squarePath = UIBezierPath(roundedRect: CGRect(x: 0, y: -self.view.frame.height, width: self.view.frame.width, height: self.view.frame.height), cornerRadius: 0)

                let shapLayer = CAShapeLayer()
                shapLayer.path = squarePath.cgPath
                shapLayer.fillColor = UIColor(red: 239/255, green: 148/255, blue: 144/255, alpha: 1.0).cgColor
                shapLayer.strokeColor = UIColor(red: 239/255, green: 148/255, blue: 144/255, alpha: 1.0).cgColor
                shapLayer.lineWidth = 3
                view.layer.addSublayer(shapLayer)


        let animateOutlineFromBottom = CABasicAnimation(keyPath: "position")
        animateOutlineFromBottom.fromValue = NSValue(cgPoint: CGPoint(x:0, y:0))
        animateOutlineFromBottom.toValue = NSValue(cgPoint: CGPoint(x:0,y:self.view.frame.height))
        animateOutlineFromBottom.duration =  0.5
        animateOutlineFromBottom.fillMode = CAMediaTimingFillMode.forwards
        shapLayer.add(animateOutlineFromBottom, forKey:"position")

        let moveDown = CABasicAnimation(keyPath: "position.y")
        moveDown.byValue = self.view.frame.height
        moveDown.duration   = 0.5;
        moveDown.isRemovedOnCompletion = false;
        moveDown.fillMode   = CAMediaTimingFillMode.forwards;
//        CATransaction.setCompletionBlock {
//        }
        layer!.add(moveDown, forKey: "y")
    }


    func complexShape2() -> CAShapeLayer {
            let path = UIBezierPath()
            path.move(to: CGPoint(x: 0, y: 0))


            path.addLine(to: CGPoint(x: self.view.frame.size.width, y: 0.0))
            path.addCurve(to: CGPoint(x: self.view.frame.size.width/2 - 50, y: 150),
                          controlPoint1: CGPoint(x: self.view.frame.size.width + 50.0, y: 350),
                          controlPoint2: CGPoint(x: self.view.frame.size.width, y: 0))
            path.addLine(to: CGPoint(x: 0, y: 50))
            //path.addLine(to: CGPoint(x: 0.0, y: self.view.frame.size.height))
            path.close()

            let shapeLayer = CAShapeLayer()
            shapeLayer.path = path.cgPath
            shapeLayer.fillColor = UIColor(red: 239/255, green: 148/255, blue: 144/255, alpha: 1.0).cgColor
            self.view.layer.addSublayer(shapeLayer)
            return shapeLayer
        }

    func complexShape3() {
        let path = UIBezierPath()
        path.addArc(withCenter: CGPoint(x: self.view.frame.size.width - 50, y: 100),
                    radius: 200,
                    startAngle: CGFloat(180.0).toRadians(),
                    endAngle: CGFloat(0).toRadians(),
                    clockwise: false)
        path.close()
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor(red: 230/255, green: 210/255, blue: 121/255, alpha: 1.0).cgColor
        self.view.layer.addSublayer(shapeLayer)
    }
}
    
    extension CGFloat {
        func toRadians() -> CGFloat {
            return self * CGFloat(Double.pi) / 180.0
        }
}

extension UIImage {
    func tint(with color: UIColor) -> UIImage {
        var image = withRenderingMode(.alwaysTemplate)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        color.set()

        image.draw(in: CGRect(origin: .zero, size: size))
        image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
