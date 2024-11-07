//
//  ChangeHobbyViewController.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 11/6/24.
//

import UIKit

final class ChangeHobbyViewController: BaseViewController {
    
    private let userService = UserService()
    
    private let contentStackView = UIStackView()
    private let titleLabel = UILabel()
    private let hobbyTextField = UITextField()
    private let passwordTextFied = UITextField()
    private let changeButton = UIButton()
    
    private let buttonConfig = UIButton.Configuration.filled()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func initAttributes() {
        contentStackView.do {
            $0.axis = .vertical
            $0.alignment = .center
            $0.spacing = 30
        }
        titleLabel.do {
            $0.text = "내 취미 변경하기"
        }
        hobbyTextField.do {
            $0.placeholder = "\(UserDefaults.standard.string(forKey: "hobby") ?? "취미를 입력하세요(8자미만)")"
            $0.delegate = self
        }
        passwordTextFied.do {
            $0.placeholder = "비밀번호를 입력하세요"
            $0.isSecureTextEntry = true
            $0.delegate = self
        }
        changeButton.do {
            $0.setTitle("변경하기", for: .normal)
            $0.configuration = buttonConfig
            $0.addTarget(self, action: #selector(changeButtonTapped), for: .touchUpInside)
        }
    }
    
    override func addViews() {
        view.addSubview(contentStackView)
        contentStackView.addArrangedSubViews(
            titleLabel,
            hobbyTextField,
            passwordTextFied,
            changeButton
        )
    }
    
    override func setLayout() {
        let safeArea = view.safeAreaLayoutGuide
        contentStackView.snp.makeConstraints {
            $0.top.equalTo(safeArea).inset(30)
            $0.horizontalEdges.equalTo(safeArea)
        }
    }
    
    @objc
    func changeButtonTapped() {
        guard let hobby = hobbyTextField.text,
              let password = passwordTextFied.text
        else { return }
        
        DispatchQueue.main.async {
            self.userService.changeUser(
                hobby: hobby,
                password: password
            ) { [weak self] result in
                guard let self = self else { return }
                
                switch result {
                case .success:
                    self.dismiss(animated: true)
                case let .failure(error):
                    print("\(error.errorMessage)")
                }
            }
        }
    }
}

extension ChangeHobbyViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // 백스페이스 처리
        if let char = string.cString(using: String.Encoding.utf8) {
            // backspace는 \b의 문자를 가지고 UInt32의 형태로 변환하면 -92가 됨
            let isBackSpace = strcmp(char, "\\b")
            // 만약 backspace가 들어온다면 사용자의 입력 실행
            if isBackSpace == -92 {
                return true
            }
        }
        guard textField.text!.count < 8 else { return false }
        return true
    }
}
