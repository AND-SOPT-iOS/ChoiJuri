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
        }
        passwordTextField.do {
            $0.placeholder = "비밀번호를 입력하세요"
            $0.isSecureTextEntry = true
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
