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
            $0.placeholder = "id를 입력해주세요"
        }
        pwTextField.do {
            $0.placeholder = "비밀번호를 입력해주세요"
        }
        hobbyTextField.do {
            $0.placeholder = "취미를 입력해주세요"
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
        DispatchQueue.main.async {
            self.userService.register(username: name, password: pw, hobby: hobby, completion: { [weak self] result in
                guard let self = self else { return }
                
                switch result {
                case .success:
                    let nextViewController = LoginViewController()
                    navigationController?.pushViewController(nextViewController, animated: true)
                case let .failure(error):
                    descriptionLabel.text = error.errorMessage
                }
            })
        }
    }
}
