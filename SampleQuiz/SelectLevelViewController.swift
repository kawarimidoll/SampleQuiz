//
//  SelectLevelViewController.swift
//  SampleQuiz
//
//  Created by kawarimidoll on 2021/05/15.
//

import UIKit

class SelectLevelViewController: UIViewController {
    @IBOutlet var lebel1Button: UIButton!
    @IBOutlet var lebel2Button: UIButton!
    @IBOutlet var lebel3Button: UIButton!

    var selectTag = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lebel1Button.layer.borderWidth = 2
        lebel1Button.layer.borderColor = UIColor.black.cgColor
        lebel2Button.layer.borderWidth = 2
        lebel2Button.layer.borderColor = UIColor.black.cgColor
        lebel3Button.layer.borderWidth = 2
        lebel3Button.layer.borderColor = UIColor.black.cgColor
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let quizVC = segue.destination as! QuizViewController
        quizVC.selectLevel = selectTag
    }


    @IBAction func levelButtonAction(sender: UIButton) {
        print(sender.tag)
        selectTag = sender.tag
        performSegue(withIdentifier: "toQuizVC", sender: nil)

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
