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
    
    private let buttonConfig = UIButton.Configuration.filled()
    
    override func viewWillAppear(_ animated: Bool) {
        //TODO: 나의 정보 (이름, 취미) API 호출
        
        DispatchQueue.main.async {
            self.userService.loadMyHobby() { [weak self] result in
                guard let self = self else { return }
                
                switch result {
                    case let .success(hobby):
                    myHobbyLabel.text = hobby
                    case let .failure(error):
                    myHobbyLabel.text = "\(error.errorMessage)"
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func initAttributes() {
        contentStackView.do {
            $0.axis = .vertical
            $0.alignment = .center
            $0.spacing = 50
        }
        nameLabel.do {
            $0.text = "이름 적기"
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
    }
    
    override func addViews() {
        view.addSubview(contentStackView)
        contentStackView.addArrangedSubViews(
            nameLabel,
            myHobbyLabel,
            changeButton,
            idTextField,
            searchButton,
            yourHobbyLabel
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
        
    }
    @objc
    func searchButtonTapped() {
        
    }
}
