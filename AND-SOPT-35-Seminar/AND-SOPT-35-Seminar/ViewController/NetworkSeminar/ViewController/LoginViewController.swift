//
//  LoginViewController.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 11/2/24.
//

import UIKit

final class LoginViewController: BaseViewController {
    
    private let loginService = LoginService()
    
    private let contentStackView = UIStackView()
    private let idTextField = UITextField()
    private let passwordTextField = UITextField()
    private let button = UIButton()
    private var descriptionLabel = UILabel()
    
    private var buttonConfig = UIButton.Configuration.filled()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
    }
    
    override func initAttributes() {
        contentStackView.do {
            $0.axis = .vertical
            $0.spacing = 50
            $0.alignment = .center
        }
        idTextField.do {
            $0.placeholder = "id를 입력하세요"
            $0.delegate = self
        }
        passwordTextField.do {
            $0.placeholder = "비밀번호를 입력하세요"
            $0.isSecureTextEntry = true
            $0.delegate = self
        }
        button.do {
            $0.setTitle("로그인하기", for: .normal)
            $0.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
            $0.configuration = buttonConfig
        }
    }

    override func addViews() {
        view.addSubview(contentStackView)
        contentStackView.addArrangedSubViews(
            idTextField,
            passwordTextField,
            button,
            descriptionLabel
        )
    }
    
    override func setLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        contentStackView.snp.makeConstraints {
            $0.top.equalTo(safeArea).inset(20)
            $0.horizontalEdges.equalTo(safeArea)
        }
    }
    
    @objc
    func loginButtonTapped() {
        print("login button 눌림")
        guard let id = idTextField.text,
              let pw = passwordTextField.text
        else { return }
        
        loginService.login(id: id, 
                           pw: pw,
                           completion: { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                switch result {
                case let .success(token):
                    self.descriptionLabel.text = "\(token)"
                    let nextViewController = HobbyViewController()
                    self.navigationController?.pushViewController(nextViewController, animated: true)
                case let .failure(error):
                    self.descriptionLabel.text = error.errorMessage
                }
            }
        })
    }
}

extension LoginViewController: UITextFieldDelegate {
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
