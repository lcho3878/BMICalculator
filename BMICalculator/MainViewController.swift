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
        
        heightQuestionLabel.text = "키(cm)가 어떻게 되시나요?"
        heightQuestionLabel.font = .boldSystemFont(ofSize: 16)
        
        heightView.layer.cornerRadius = 10
        heightView.layer.borderColor = UIColor.black.cgColor
        heightView.layer.borderWidth = 2
        
        heightTextField.borderStyle = .none
        heightTextField.keyboardType = .numberPad
        
        weightQuestionLabel.text = "몸무게(kg)가 어떻게 되시나요?"
        weightQuestionLabel.font = .boldSystemFont(ofSize: 16)
        
        weightView.layer.cornerRadius = 10
        weightView.layer.borderColor = UIColor.black.cgColor
        weightView.layer.borderWidth = 2
        
        weightTextField.borderStyle = .none
        weightTextField.keyboardType = .numberPad
        
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
    
    private func calculateBMI(_ height: Int, _ weight: Int) -> String {
        let h = Double(height)/100
        let w = Double(weight)
        let result = w / (h * h)
        return String(format: "%.2f", result)
        
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
        guard heightTextField.text != "" else {
            showAlert("키가 입력되지 않았습니다.")
            return
        }
        
        guard weightTextField.text != "" else {
            showAlert("몸무게가 입력되지 않았습니다.")
            return
        }
        
        guard let height = Int(heightTextField.text!) else { return }
        guard let weight = Int(weightTextField.text!) else { return }
        let bmi = calculateBMI(height, weight)
        showAlert("BMI는 \(bmi)입니다")
    }
    
    @IBAction func randomButtonClicked(_ sender: UIButton) {
        let height = Int.random(in: 100...200)
        let weight = Int.random(in: 50...100)
        heightTextField.text = String(height)
        weightTextField.text = String(weight)
        let bmi = calculateBMI(height, weight)
        showAlert("BMI는 \(bmi)입니다")
    }
    
    @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
}

