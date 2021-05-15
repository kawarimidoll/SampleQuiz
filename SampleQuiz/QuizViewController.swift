//
//  QuizViewController.swift
//  SampleQuiz
//
//  Created by kawarimidoll on 2021/05/13.
//

import UIKit

class QuizViewController: UIViewController {
    @IBOutlet var quizNumberLabel: UILabel!
    @IBOutlet var quizTextView: UITextView!
    @IBOutlet var answerButton1: UIButton!
    @IBOutlet var answerButton2: UIButton!
    @IBOutlet var answerButton3: UIButton!
    @IBOutlet var answerButton4: UIButton!
    @IBOutlet var judgeImageView: UIImageView!

    var csvArray: [String] = []
    var quizArray: [String] = []
    var quizCount = 0
    var correctCount = 0
    var selectLevel = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        let filename = "quiz\(selectLevel)"
        print(filename)

        csvArray = loadCSV(fileName: filename)
        print(csvArray)
        setQuiz()

        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let scoreVC = segue.destination as! ScoreViewController
        scoreVC.correct = correctCount
    }

    @IBAction func btnAction(sender: UIButton) {
        print(sender.tag)
        if sender.tag == Int(quizArray[1]) {
            correctCount += 1
            judgeImageView.image = UIImage(named: "correct")
        } else {
            judgeImageView.image = UIImage(named: "incorrect")
        }
        print("Score: \(correctCount)")
        self.judgeImageView.isHidden = false
        answerButton1.isEnabled = false
        answerButton2.isEnabled = false
        answerButton3.isEnabled = false
        answerButton4.isEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.judgeImageView.isHidden = true
            self.answerButton1.isEnabled = true
            self.answerButton2.isEnabled = true
            self.answerButton3.isEnabled = true
            self.answerButton4.isEnabled = true
            self.nextQuiz()
        }
    }

    func setQuiz() {
        quizArray = csvArray[quizCount].components(separatedBy: ",")
        quizNumberLabel.text = "Question \(quizCount+1)"
        quizTextView.text = quizArray[0]
        answerButton1.setTitle(quizArray[2], for: .normal)
        answerButton2.setTitle(quizArray[3], for: .normal)
        answerButton3.setTitle(quizArray[4], for: .normal)
        answerButton4.setTitle(quizArray[5], for: .normal)
    }

    func nextQuiz() {
        quizCount += 1
        if quizCount < csvArray.count {
            setQuiz()
        } else {
            performSegue(withIdentifier: "toScoreVC", sender: nil)
        }
    }

    func loadCSV(fileName: String) -> [String] {
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do {
            let csvData = try String(contentsOfFile: csvBundle, encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            csvArray = lineChange.components(separatedBy: "\n")
            csvArray.removeLast()
        } catch {
            print("error!")
        }
        return csvArray
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
