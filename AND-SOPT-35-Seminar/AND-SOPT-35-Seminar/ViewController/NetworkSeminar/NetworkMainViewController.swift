//
//  NetworkMainViewController.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 11/3/24.
//

import UIKit

final class NetworkMainViewController: BaseViewController {
    
    private let contentStackView = UIStackView()
    private let registerButton = UIButton()
    private let loginButton = UIButton()
    
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
        registerButton.do {
            $0.setTitle("회원가입", for: .normal)
            $0.configuration = buttonConfig
            $0.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        }
        loginButton.do {
            $0.setTitle("로그인", for: .normal)
            $0.configuration = buttonConfig
            $0.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        }
    }
    override func addViews() {
        view.addSubview(contentStackView)
        contentStackView.addArrangedSubViews(
            registerButton,
            loginButton
        )
    }
    override func setLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        contentStackView.snp.makeConstraints {
            $0.top.equalTo(safeArea).inset(50)
            $0.horizontalEdges.equalTo(safeArea).inset(50)
        }
    }
    
    @objc
    func registerButtonTapped() {
        let nextViewController = RegisterViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    @objc
    func loginButtonTapped() {
        let nextViewController = LoginViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
