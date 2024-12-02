//
//  HobbyViewController.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 11/3/24.
//

import UIKit

final class HobbyViewController: BaseViewController {
    private let userService = UserService()
    
    private let contentStackView = UIStackView()
    private let nameLabel = UILabel()
    private let myHobbyLabel = UILabel()
    private let changeButton = UIButton()
    
    private let idTextField = UITextField()
    private let searchButton = UIButton()
    private let yourHobbyLabel = UILabel()
    private let logoutButton = UIButton()
    
    private let buttonConfig = UIButton.Configuration.filled()
    
    override func viewWillAppear(_ animated: Bool) {
        
        userService.loadMyHobby() { [weak self] result in
            guard let self = self else { return }
            
            switch result {
                case let .success(hobby):
                self.myHobbyLabel.text = hobby
                case let .failure(error):
                self.myHobbyLabel.text = "\(error.errorMessage)"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: true)
    }
    
    override func initAttributes() {
        contentStackView.do {
            $0.axis = .vertical
            $0.alignment = .center
            $0.spacing = 50
        }
        nameLabel.do {
            $0.text = "\(UserDefaults.standard.string(forKey: "name") ?? "")의 취미는"
        }
        changeButton.do {
            $0.setTitle("정보 변경하기", for: .normal)
            $0.configuration = buttonConfig
            $0.addTarget(self, action: #selector(changeButtonTapped), for: .touchUpInside)
        }
        idTextField.do {
            $0.placeholder = "검색할 id를 입력해주세요."
        }
        searchButton.do {
            $0.setTitle("검색", for: .normal)
            $0.configuration = buttonConfig
            $0.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        }
        logoutButton.do {
            $0.setTitle("로그아웃", for: .normal)
            $0.configuration = buttonConfig
            $0.tintColor = .systemRed
            $0.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        }
    }
    
    override func addViews() {
        view.addSubview(contentStackView)
        contentStackView.addArrangedSubViews(
            nameLabel,
            myHobbyLabel,
            changeButton,
            idTextField,
            searchButton,
            yourHobbyLabel,
            logoutButton
        )
    }
    
    override func setLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        contentStackView.snp.makeConstraints {
            $0.top.equalTo(safeArea)
            $0.horizontalEdges.equalTo(safeArea)
        }
    }
    
    @objc
    func changeButtonTapped() {
        let viewController = ChangeHobbyViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    @objc
    func searchButtonTapped() {
        guard let num = Int(idTextField.text ?? "0")
        else { return }
        
        userService.searchOtherHobby(num: num) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                switch result {
                case let .success(hobby):
                    self.yourHobbyLabel.text = "\(num)번의 취미는 " + hobby
                case let .failure(error):
                    print("\(error.errorMessage)")
                }
            }
        }
    }
    
    @objc
    func logoutButtonTapped() {
        UserDefaults.standard.removeObject(forKey: "token")
        UserDefaults.standard.removeObject(forKey: "hobby")
        UserDefaults.standard.removeObject(forKey: "name")
        
        navigationController?.popToRootViewController(animated: true)
    }
}
