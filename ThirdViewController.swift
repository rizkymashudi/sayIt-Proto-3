//
//  ThirdViewController.swift
//  SayIt-Proto1
//
//  Created by Ardyansyah Wijaya on 27/04/21.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var resultTextView: UITextView!
    @IBOutlet weak var SomethingBtn: UIButton!
    
    
    var topicType: String = ""
    var resultName: String = ""
    var resultTopic: String = ""
    var resultEnemy: String = ""
    var resultDo: String = ""
    
    
    @IBAction func backToMainButton(_ sender: Any) {
        performSegue(withIdentifier: "backToMain", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.resultTextView.layer.cornerRadius = 9
        checkOptionRes()
    }
    
    
    func checkOptionRes(){
        if (topicType == "type1") {
            resultTextView.text = "Hello, My name is \(resultName), I am  \(resultTopic) years old, I am from \(resultEnemy), and I am a \(resultDo)"
        } else if (topicType == "type2") {
            resultTextView.text = "I would like to tell you about \(resultName), that happened \(resultTopic), it's \(resultEnemy) and I feel \(resultDo)"
        } else if (topicType == "type3") {
            resultTextView.text = "Excuse me, regarding \(resultName), would you : a. Explain regarding \(resultTopic). b. Tell me regarding \(resultEnemy), I didn't quite catch what you said. c. Give your opinion about \(resultEnemy)."
        } else if (topicType == "type4") {
            resultTextView.text = "In my opinion, regarding \(resultName), I \(resultTopic) because \(resultEnemy) as explained on \(resultDo)"
        } else if (topicType == "type5") {
            resultTextView.text = "I am sorry \(resultName), I was wrong when I \(resultTopic), I won't do it again, and I will make it up by \(resultEnemy), will \(resultName) forgive me?"
        }
    }
    
    


}
