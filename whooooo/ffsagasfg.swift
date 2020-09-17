////
////  ViewController.swift
////  testapp
////
////  Created by Roman on 8/1/20.
////  Copyright © 2020 Roman. All rights reserved.
////
//
//import UIKit
//
//class ViewController: UIViewController {
//    
//    var layer:CAShapeLayer? = nil
//    
//    
//
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 250/255, alpha: 1.0)
//        complexShape3()
//        complexShape()
//        
//        
//        
//
//        
//
//        
//     
//        
//        layer = complexShape2()
//        
//        textField.placeholder = "Password"
//        emailTextField.placeholder = "Email"
//        
//        
//        var attrs = [
//            NSAttributedString.Key.underlineStyle : 1]
//       
//        
//        var attributedString = NSMutableAttributedString(string:"")
//        var attributedString2 = NSMutableAttributedString(string:"")
//       
//        
//        let attributedString = NSMutableAttributedString(string:"Forgot Password", attributes:attrs)
//        
//        let buttonTitleStr2 = NSMutableAttributedString(string:"Sign Up", attributes:attrs)
//        attributedString2.append(buttonTitleStr2)
//        
//       
//        
//        buttonForgotPassword.setAttributedTitle(attributedString, for: .normal)
//        buttonSignUp.setAttributedTitle(attributedString2, for: .normal)
//       
//        
//        labelSignIn.text = "Sign in"
//        labelSignIn.textAlignment = .center
//        labelSignIn.font = UIFont.boldSystemFont(ofSize: 25)
//        labelSignIn.textColor = UIColor(red: 69/255, green: 67/255, blue: 70/255, alpha: 1.0)
//        
//        
//        buttonForgotPassword.translatesAutoresizingMaskIntoConstraints = false
//        buttonSignUp.translatesAutoresizingMaskIntoConstraints = false
//        labelSignIn.translatesAutoresizingMaskIntoConstraints = false
//        buttonSignIn.translatesAutoresizingMaskIntoConstraints = false
//        
//        buttonSignUp.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        buttonSignUp.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        buttonSignUp.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30).isActive = true
//        buttonSignUp.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -10).isActive = true
//        
//        buttonForgotPassword.widthAnchor.constraint(equalToConstant: 150).isActive = true
//        buttonForgotPassword.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        buttonForgotPassword.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30).isActive = true
//        buttonForgotPassword.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -10).isActive = true
//    
//        emailLabel.translatesAutoresizingMaskIntoConstraints = false
//        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
//        
//        
//        emailTextField.translatesAutoresizingMaskIntoConstraints = false
//        
//        emailTextField.leftAnchor.constraint(equalTo: buttonSignUp.leftAnchor).isActive = true
//        emailTextField.rightAnchor.constraint(equalTo: buttonForgotPassword.rightAnchor).isActive = true
//        emailTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        emailTextField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 30).isActive = true
//        
//        
//        emailLabel.leftAnchor.constraint(equalTo: buttonSignUp.leftAnchor).isActive = true
//        emailLabel.rightAnchor.constraint(equalTo: buttonForgotPassword.rightAnchor).isActive = true
//        emailLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        emailLabel.bottomAnchor.constraint(equalTo: self.emailTextField.topAnchor).isActive = true
//        
//        
//        
//        textField.translatesAutoresizingMaskIntoConstraints = false
//    
//        textField.leftAnchor.constraint(equalTo: buttonSignUp.leftAnchor).isActive = true
//        textField.rightAnchor.constraint(equalTo: buttonForgotPassword.rightAnchor).isActive = true
//        textField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        textField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30).isActive = true
//        
//        
//        passwordLabel.leftAnchor.constraint(equalTo: buttonSignUp.leftAnchor).isActive = true
//        passwordLabel.rightAnchor.constraint(equalTo: buttonForgotPassword.rightAnchor).isActive = true
//        passwordLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        passwordLabel.bottomAnchor.constraint(equalTo: self.textField.topAnchor).isActive = true
//        
//        labelSignIn.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        labelSignIn.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        labelSignIn.leftAnchor.constraint(equalTo: textField.leftAnchor).isActive = true
//        labelSignIn.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 80).isActive = true
//        
//        buttonSignIn.layer.masksToBounds = true
//        buttonSignIn.layer.cornerRadius = 50
//        buttonSignIn.backgroundColor = UIColor(red: 129/255, green: 75/255, blue: 112/255, alpha: 1.0)
//        buttonSignIn.addTarget(self, action: #selector(moveDown), for: .touchUpInside)
//        
//        buttonSignIn.setImage(UIImage(named: "next")?.tint(with: UIColor.white), for: .normal)
//        buttonSignIn.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        buttonSignIn.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        buttonSignIn.rightAnchor.constraint(equalTo: buttonForgotPassword.rightAnchor).isActive = true
//        buttonSignIn.centerYAnchor.constraint(equalTo: labelSignIn.centerYAnchor).isActive = true
//        
//        
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        var bottomLine = CALayer()
//        bottomLine.frame = CGRect(x: 0.0, y: emailTextField.frame.height, width: emailTextField.frame.width, height: 1.0)
//        bottomLine.backgroundColor = UIColor.lightGray.cgColor
//        emailTextField.borderStyle = UITextField.BorderStyle.none
//        emailTextField.layer.addSublayer(bottomLine)
//
//        
//        
//        var bottomLine2 = CALayer()
//               bottomLine2.frame = CGRect(x: 0.0, y: textField.frame.height, width: textField.frame.width, height: 1.0)
//               bottomLine2.backgroundColor = UIColor.lightGray.cgColor
//        
//        
//                textField.borderStyle = UITextField.BorderStyle.none
//                textField.layer.addSublayer(bottomLine2)
//    }
//
//    func complexShape() {
//        let path = UIBezierPath()
//        path.move(to: CGPoint(x: 0.0, y: 240))
//        path.addCurve(to: CGPoint(x: self.view.frame.size.width/2 - 50, y: 150),
//                      controlPoint1: CGPoint(x: self.view.frame.size.width - 100, y: 500),
//                      controlPoint2: CGPoint(x: self.view.frame.size.width-50, y: 0))
//        path.addLine(to: CGPoint(x: 0, y: 20))
//        path.close()
//        let shapeLayer = CAShapeLayer()
//        shapeLayer.path = path.cgPath
//        shapeLayer.fillColor = UIColor(red: 129/255, green: 75/255, blue: 112/255, alpha: 1.0).cgColor
//        self.view.layer.addSublayer(shapeLayer)
//        
//        let label = CATextLayer()
//        label.frame = CGRect(x: 50, y: 165, width: 200, height: 40)
//        label.font = UIFont(name:"HelveticaNeue-Bold", size: 14.5)
//        //label.backgroundColor = UIColor.black.cgColor
//        label.string = "Welcome"
//        
//        let label2 = CATextLayer()
//        label2.frame = CGRect(x: 50, y: 205, width: 200, height: 40)
//        //label2.backgroundColor = UIColor.black.cgColor
//        label2.font = UIFont(name:"HelveticaNeue-Bold", size: 14.5)
//        label2.string = "Back"
//       
//        shapeLayer.addSublayer(label)
//        shapeLayer.addSublayer(label2)
//    }
//    
//    
//    @objc func moveDown() {
//        
//        let squarePath = UIBezierPath(roundedRect: CGRect(x: 0, y: -self.view.frame.height, width: self.view.frame.width, height: self.view.frame.height), cornerRadius: 0)
//               
//                let shapLayer = CAShapeLayer()
//                shapLayer.path = squarePath.cgPath
//                shapLayer.fillColor = UIColor(red: 239/255, green: 148/255, blue: 144/255, alpha: 1.0).cgColor
//                shapLayer.strokeColor = UIColor(red: 239/255, green: 148/255, blue: 144/255, alpha: 1.0).cgColor
//                shapLayer.lineWidth = 3
//                view.layer.addSublayer(shapLayer)
//        
//        
//        let animateOutlineFromBottom = CABasicAnimation(keyPath: "position")
//        animateOutlineFromBottom.fromValue = NSValue(cgPoint: CGPoint(x:0, y:0))
//        animateOutlineFromBottom.toValue = NSValue(cgPoint: CGPoint(x:0,y:self.view.frame.height))
//        animateOutlineFromBottom.duration =  0.5
//        animateOutlineFromBottom.fillMode = CAMediaTimingFillMode.forwards
//        shapLayer.add(animateOutlineFromBottom, forKey:"position")
//        
//        let moveDown = CABasicAnimation(keyPath: "position.y")
//        moveDown.byValue = self.view.frame.height
//        moveDown.duration   = 0.5;
//        moveDown.isRemovedOnCompletion = false;
//        moveDown.fillMode   = CAMediaTimingFillMode.forwards;
//        CATransaction.setCompletionBlock {
//             let vc = UIViewController()
//             vc.view.backgroundColor = UIColor.green
//             vc.modalPresentationStyle = .fullScreen
//             self.present(vc, animated: false, completion: nil)
//        }
//        layer!.add(moveDown, forKey: "y")
//    }
//   
//    
//    func complexShape2() -> CAShapeLayer {
//            let path = UIBezierPath()
//            path.move(to: CGPoint(x: 0, y: 0))
//            
//            
//            path.addLine(to: CGPoint(x: self.view.frame.size.width, y: 0.0))
//            path.addCurve(to: CGPoint(x: self.view.frame.size.width/2 - 50, y: 150),
//                          controlPoint1: CGPoint(x: self.view.frame.size.width + 50.0, y: 350),
//                          controlPoint2: CGPoint(x: self.view.frame.size.width, y: 0))
//            path.addLine(to: CGPoint(x: 0, y: 50))
//            //path.addLine(to: CGPoint(x: 0.0, y: self.view.frame.size.height))
//            path.close()
//         
//            let shapeLayer = CAShapeLayer()
//            shapeLayer.path = path.cgPath
//            shapeLayer.fillColor = UIColor(red: 239/255, green: 148/255, blue: 144/255, alpha: 1.0).cgColor
//            self.view.layer.addSublayer(shapeLayer)
//            return shapeLayer
//        }
//    
//    func complexShape3() {
//        let path = UIBezierPath()
//        path.addArc(withCenter: CGPoint(x: self.view.frame.size.width - 50, y: 100),
//                    radius: 200,
//                    startAngle: CGFloat(180.0).toRadians(),
//                    endAngle: CGFloat(0).toRadians(),
//                    clockwise: false)
//        path.close()
//        let shapeLayer = CAShapeLayer()
//        shapeLayer.path = path.cgPath
//        shapeLayer.fillColor = UIColor(red: 230/255, green: 210/255, blue: 121/255, alpha: 1.0).cgColor
//        self.view.layer.addSublayer(shapeLayer)
//    }
//}
//
//extension CGFloat {
//    func toRadians() -> CGFloat {
//        return self * CGFloat(M_PI) / 180.0
//    }
//}
//
//extension UIImage {
//    func tint(with color: UIColor) -> UIImage {
//        var image = withRenderingMode(.alwaysTemplate)
//        UIGraphicsBeginImageContextWithOptions(size, false, scale)
//        color.set()
//
//        image.draw(in: CGRect(origin: .zero, size: size))
//        image = UIGraphicsGetImageFromCurrentImageContext()!
//        UIGraphicsEndImageContext()
//        return image
//    }
//}
//
