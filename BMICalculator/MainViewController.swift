//
//  ViewController.swift
//  BMICalculator
//
//  Created by 이찬호 on 5/21/24.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var mainImageView: UIImageView!
    
    @IBOutlet var heightQuestionLabel: UILabel!
    @IBOutlet var weightQuestionLabel: UILabel!
    @IBOutlet var heightView: UIView!
    @IBOutlet var weightView: UIView!
    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!
    
    @IBOutlet var randomButton: UIButton!
    @IBOutlet var resultButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        titleLabel.text = "BMI Calculator"
        titleLabel.font = .boldSystemFont(ofSize: 24)
        
        subTitleLabel.text = "당신의 BMI 지수를 알려드릴게요."
        subTitleLabel.font = .boldSystemFont(ofSize: 16)
        subTitleLabel.numberOfLines = 0
        
        mainImageView.image = UIImage(named: "image")
        
        heightQuestionLabel.text = "키가 어떻게 되시나요?"
        heightQuestionLabel.font = .boldSystemFont(ofSize: 16)
        
        heightView.layer.cornerRadius = 10
        heightView.layer.borderColor = UIColor.black.cgColor
        heightView.layer.borderWidth = 2
        
        heightTextField.borderStyle = .none
        
        weightQuestionLabel.text = "몸무게가 어떻게 되시나요?"
        weightQuestionLabel.font = .boldSystemFont(ofSize: 16)
        
        weightView.layer.cornerRadius = 10
        weightView.layer.borderColor = UIColor.black.cgColor
        weightView.layer.borderWidth = 2
        
        weightTextField.borderStyle = .none
        
        randomButton.setTitle("랜덤으로 BMI 계산하기", for: .normal)
        randomButton.setTitleColor(.red, for: .normal)
        
        resultButton.setTitle("결과 확인", for: .normal)
        resultButton.setTitleColor(.white, for: .normal)
        resultButton.backgroundColor = .purple
        resultButton.layer.cornerRadius = 10
        
    }
    
    private func showAlert(_ message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
    }
    
    private func calculateBMI(_ height: Int, _ weight: Int) -> Double {
        return Double(height / weight)
        
    }
    
    @IBAction func textFieldChanged(_ sender: UITextField) {
        let input = sender.text!
        guard input != "" else { return }
        guard Int(input) != nil else {
            showAlert("숫자만 입력해주세요")
            sender.text?.popLast()
            return }
    }
    
    @IBAction func resultButtonClicked(_ sender: UIButton) {
        guard let height = Int(heightTextField.text!) else { return }
        guard let weight = Int(weightTextField.text!) else { return }
        let bmi = calculateBMI(height, weight)
        showAlert("BMI는 \(bmi)입니다")
    }
    
    
}

