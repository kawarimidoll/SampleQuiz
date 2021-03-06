//
//  ScoreViewController.swift
//  SampleQuiz
//
//  Created by kawarimidoll on 2021/05/13.
//

import UIKit

class ScoreViewController: UIViewController {
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var shareButton: UIButton!
    @IBOutlet var returnTopButton: UIButton!

    var correct = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        scoreLabel.text = "Your score: \(correct)!"

        // Do any additional setup after loading the view.
        shareButton.layer.borderWidth = 2
        shareButton.layer.borderColor = UIColor.black.cgColor
        returnTopButton.layer.borderWidth = 2
        returnTopButton.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func shareButtonAction(_ sender: Any) {
        let activityItems = ["\(correct)問正解しました！","#クイズアプリ"]
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        self.present(activityVC, animated: true)
    }

    @IBAction func toTopButtonAction(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true)
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
