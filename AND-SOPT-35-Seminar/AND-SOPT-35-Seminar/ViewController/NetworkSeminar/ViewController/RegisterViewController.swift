//
//  RegisterViewController.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 11/3/24.
//

import UIKit

final class RegisterViewController: BaseViewController {
    
    private let userService = UserService()
    
    private let contentStackView = UIStackView()
    private let idTextField = UITextField()
    private let pwTextField = UITextField()
    private let hobbyTextField = UITextField()
    private let registerButton = UIButton()
    private let descriptionLabel = UILabel()
    
    private var buttonConfig = UIButton.Configuration.filled()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func initAttributes() {
        contentStackView.do {
            $0.axis = .vertical
            $0.spacing = 50
            $0.alignment = .center
        }
        idTextField.do {
            $0.placeholder = "id를 입력해주세요(8자미만)"
            $0.delegate = self
        }
        pwTextField.do {
            $0.placeholder = "비밀번호를 입력해주세요(8자미만)"
            $0.isSecureTextEntry = true
            $0.delegate = self
        }
        hobbyTextField.do {
            $0.placeholder = "취미를 입력해주세요(8자미만)"
            $0.delegate = self
        }
        registerButton.do {
            $0.setTitle("회원가입하기", for: .normal)
            $0.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
            $0.configuration = buttonConfig
        }
    }
    override func addViews() {
        view.addSubview(contentStackView)
        contentStackView.addArrangedSubViews(
            idTextField,
            pwTextField,
            hobbyTextField,
            registerButton,
            descriptionLabel
        )
    }
    override func setLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        contentStackView.snp.makeConstraints {
            $0.top.equalTo(safeArea).inset(50)
            $0.horizontalEdges.equalTo(safeArea)
        }
    }
    
    @objc
    func registerButtonTapped() {
        guard let name = idTextField.text,
              let pw = pwTextField.text,
              let hobby = hobbyTextField.text
        else {
            return
        }
        
        userService.register(
            username: name,
            password: pw,
            hobby: hobby
        ) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                switch result {
                case .success:
                    let nextViewController = LoginViewController()
                    self.navigationController?.pushViewController(nextViewController, animated: true)
                case let .failure(error):
                    self.descriptionLabel.text = error.errorMessage
                }
            }
        }
    }
}

extension RegisterViewController: UITextFieldDelegate {
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
