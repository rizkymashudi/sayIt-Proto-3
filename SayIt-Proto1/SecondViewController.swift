//
//  SecondViewController.swift
//  SayIt-Proto1
//
//  Created by Ardyansyah Wijaya on 27/04/21.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var yourNameLabel: UILabel!
    @IBOutlet weak var yourTopicLabel: UILabel!
    @IBOutlet weak var yourEnemyLabel: UILabel!
    @IBOutlet weak var doLabel: UILabel!
//    @IBOutlet weak var hereLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var topicTextField: UITextField!
    @IBOutlet weak var enemyTextField: UITextField!
    @IBOutlet weak var doTextfield: UITextField!
//    @IBOutlet weak var hereTextField: UITextField!
    
    @IBOutlet weak var resultButton: UIButton!
    
    var selectedOption: String = ""
    var selectedTopic: String = ""
    var bottomLine = CALayer()
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        topicTextField.delegate = self
        enemyTextField.delegate = self
        doTextfield.delegate = self
//        hereTextField.delegate = self
//        resultButton.isEnabled = false
//        resultButton.alpha = 1
        UITextField.appearance().tintColor = .black
        
        self.navigationController?.navigationBar.tintColor = UIColor.white

        //Letter spacing
        yourNameLabel.attributedText = NSAttributedString(string: "test",attributes:[ NSAttributedString.Key.kern: 1])
        yourTopicLabel.attributedText = NSAttributedString(string: "test",attributes:[ NSAttributedString.Key.kern: 1])
        yourEnemyLabel.attributedText = NSAttributedString(string: "test",attributes:[ NSAttributedString.Key.kern: 1])
        doLabel.attributedText = NSAttributedString(string: "test",attributes:[ NSAttributedString.Key.kern: 1])
//        hereLabel.attributedText = NSAttributedString(string: "test",attributes:[ NSAttributedString.Key.kern: 1])
        
        //Set bottom border textfield
        nameTextField.setBottomBorder()
        nameTextField.setPadding()
        topicTextField.setBottomBorder()
        topicTextField.setPadding()
        enemyTextField.setBottomBorder()
        enemyTextField.setPadding()
        doTextfield.setBottomBorder()
        doTextfield.setPadding()
//        hereTextField.setBottomBorder()
//        hereTextField.setPadding()
    
        checkOptionSelected()
//        checkInputText()
        

        resultButton?.isUserInteractionEnabled = false
        resultButton.alpha = 0.5
//        nameTextField.addTarget(self, action: #selector(textChanged(_:)), for: .editingChanged)
//        topicTextField.addTarget(self, action: #selector(textChanged(_:)), for: .editingChanged)
//        enemyTextField.addTarget(self, action: #selector(textChanged(_:)), for: .editingChanged)
//        doTextfield.addTarget(self, action: #selector(textChanged(_:)), for: .editingChanged)
//        hereTextField.addTarget(self, action: #selector(textChanged(_:)), for: .editingChanged)
        
        
    }
    
    //cek texfield prevent klik button before input
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        let name = nameTextField.text ?? ""
        let topic = topicTextField.text ?? ""
        let enemy = enemyTextField.text ?? ""
        let doTeks = doTextfield.text ?? ""
        
        if (selectedOption == "2" || selectedOption == "4") && !name.isEmpty && !topic.isEmpty && !enemy.isEmpty {
            resultButton?.isUserInteractionEnabled = true
            resultButton?.alpha = 1.0
        } else if !name.isEmpty && !topic.isEmpty && !enemy.isEmpty && !doTeks.isEmpty {
            resultButton?.isUserInteractionEnabled = true
            resultButton?.alpha = 1.0
        } else {
            resultButton?.isUserInteractionEnabled = false
            resultButton?.alpha = 0.5
        }
        
        return true
    }
    
    func checkOptionSelected(){
        if (selectedOption == "0") {
            nameTextField.attributedPlaceholder =
                NSAttributedString(string: "Enter your name...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
            topicTextField.attributedPlaceholder =
                NSAttributedString(string: "Enter your age...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
            enemyTextField.attributedPlaceholder =
                NSAttributedString(string: "Enter your origin...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
            doTextfield.attributedPlaceholder =
                NSAttributedString(string: "Enter your job...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
            
            selectedTopic = "type1"
            yourNameLabel.text = "Whats your name?"
            yourTopicLabel.text = "How old are you?"
            yourEnemyLabel.text = "Where are you from?"
            doLabel.text = "What is your occupation?"
//            hereLabel.isHidden = true
//            hereTextField.isHidden = true
            
        } else if (selectedOption == "1") {
            nameTextField.attributedPlaceholder =
                NSAttributedString(string: "Enter your topic...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
            topicTextField.attributedPlaceholder =
                NSAttributedString(string: "Enter when...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
            enemyTextField.attributedPlaceholder =
                NSAttributedString(string: "Enter your description...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
            doTextfield.attributedPlaceholder =
                NSAttributedString(string: "Enter your opinion...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
            
            selectedTopic = "type2"
            yourNameLabel.text = "What would you like to describe? (an event, a remark, an object, a topic)"
            yourTopicLabel.text = "When did the thing you’d like to describe happen? (just now, a while ago, some time ago)"
            yourEnemyLabel.text = "How can you describe it?"
            doLabel.text = "How do you feel about it?"
//            hereLabel.isHidden = true
//            hereTextField.isHidden = true
            
        } else if (selectedOption == "2") {
            nameTextField.attributedPlaceholder =
                NSAttributedString(string: "Enter your topic...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
            topicTextField.attributedPlaceholder =
                NSAttributedString(string: "Enter your question...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
            enemyTextField.attributedPlaceholder =
                NSAttributedString(string: "Enter your sub-topic...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
            
            selectedTopic = "type3"
            yourNameLabel.text = "What is the topic in question?"
            yourTopicLabel.text = "What would you like to know about it? (something about the topic, a detail or an opinion)"
            yourEnemyLabel.text = "Is there anything specific? (Sub-Topic)"
            doLabel.isHidden = true
            doTextfield.isHidden = true
//            hereLabel.isHidden = true
//            hereTextField.isHidden = true
            
        } else if (selectedOption == "3") {
            nameTextField.attributedPlaceholder =
                NSAttributedString(string: "Enter the topic...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
            topicTextField.attributedPlaceholder =
                NSAttributedString(string: "Yes/No...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
            enemyTextField.attributedPlaceholder =
                NSAttributedString(string: "Enter your explanation...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
            doTextfield.attributedPlaceholder =
                NSAttributedString(string: "Enter your supporting foundation...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
            
            selectedTopic = "type4"
            yourNameLabel.text = "What would you like to give an opinion / idea about?"
            yourTopicLabel.text = "Do you agree with it? (yes/no)"
            yourEnemyLabel.text = "Why so? (Explain why you think the way you do)"
            doLabel.text = "Is there anything to support your claim"
//            hereLabel.isHidden = true
//            hereTextField.isHidden = true
            
        } else if (selectedOption == "4") {
            nameTextField.attributedPlaceholder =
                NSAttributedString(string: "Enter who...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
            topicTextField.attributedPlaceholder =
                NSAttributedString(string: "Enter what...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
            enemyTextField.attributedPlaceholder =
                NSAttributedString(string: "Enter your compensation...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
            
            selectedTopic = "type5"
            yourNameLabel.text = "Who are you apologizing to?"
            yourTopicLabel.text = "What are you apologizing about?"
            yourEnemyLabel.text = "How do you intend to make it right?"
            doLabel.isHidden = true
            doTextfield.isHidden = true
//            hereLabel.isHidden = true
//            hereTextField.isHidden = true
        }
        
    }

    
    
//    func checkInputText(){
//        if (nameTextField.text?.isEmpty == true || topicTextField.text?.isEmpty == true || enemyTextField.text?.isEmpty == true) {
//            resultButton.isEnabled = false
//            resultButton.alpha = 0.5
//        } else {
//            resultButton.isEnabled = true
//            resultButton.alpha = 0
//        }
//
//    }
    
    
    //dissmiss keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        topicTextField.resignFirstResponder()
        enemyTextField.resignFirstResponder()
        doTextfield.resignFirstResponder()
//        hereTextField.resignFirstResponder()
        return true
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showResult") {
            let thirdVC = segue.destination as! ThirdViewController
            thirdVC.topicType = selectedTopic
            thirdVC.resultName = nameTextField.text!
            thirdVC.resultTopic = topicTextField.text!
            thirdVC.resultEnemy = enemyTextField.text!
            thirdVC.resultDo = doTextfield.text!

        }
    }

}

//extension UILabel {
//
//      func attributeMyLabel(text: String) -> NSAttributedString{
//        self.attributedText = NSAttributedString(string: text, attributes:[NSAttributedString.Key.kern: 1.3])
//        return self.attributedText!
//      }
//
//    //I've used a function, but this can be transformed into a var
//
//      func attributeMyLabelSelfText() -> NSAttributedString{
//        self.attributedText = NSAttributedString(string: self.text!, attributes:[NSAttributedString.Key.kern: 1.3])
//        return self.attributedText!
//      }
//    }


//set texfield underline border
extension UITextField {
    func setBottomBorder(){
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
    
    func setPadding(){
        let paddingView = UIView(frame: CGRect(x:0, y:0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}



//character spacing
//extension UILabel {
//    func addCharacterSpacing(kernValue: Double = 3) {
//            if let labelText = text, labelText.isEmpty == false {
//                let attributedString = NSMutableAttributedString(string: labelText)
//                attributedString.addAttribute(.kern,
//                                              value: kernValue,
//                                              range: NSRange(location: 0, length: attributedString.length - 1))
//                attributedText = attributedString
//            }
//        }
//}
