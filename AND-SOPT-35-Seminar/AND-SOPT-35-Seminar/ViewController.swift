//
//  ViewController.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 10/5/24.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Components
    
    private lazy var titleLabel = UILabel()
    private lazy var imageView = UIImageView()
    private lazy var nextButton = UIButton()
    private lazy var changeButton = UIButton()
    private lazy var titleTextField = UITextField()
    private lazy var contentTextField = UITextField()
    
    
    private var isNavigation = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        initAttributes()
        addViews()
    }
    
    private func initAttributes() {
        titleLabel = {
            let label = UILabel(frame: CGRect(origin: CGPoint(x: 130, y: 80), size: CGSize(width: 150, height: 100)))
            label.text = "네비게이션"
            label.font = .boldSystemFont(ofSize: 20)
            label.textAlignment = .center
            return label
        }()
        
        imageView = {
            let imageView = UIImageView(frame: CGRect(x: 300, y: 120, width: 30, height: 30))
            let image = UIImage(systemName: "hand.point.down.fill")
            
            imageView.layer.cornerRadius = 15
            imageView.image = image
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.tintColor = .systemPink
            
            return imageView
        }()
        
        nextButton = {
            let button = UIButton(frame: CGRect(origin: CGPoint(x: 130, y: 550), size: CGSize(width: 150, height: 50)))
            button.setTitle("다음", for: .normal)
            button.backgroundColor = .systemOrange
            button.setTitleColor(.white, for: .normal)
            button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
            return button
        }()
        
        changeButton = {
            let button = UIButton(frame: CGRect(origin: CGPoint(x: 130, y: 610), size: CGSize(width: 150, height: 50)))
            button.setTitle("변경하기!!!!", for: .normal)
            button.backgroundColor = .systemBlue
            button.setTitleColor(.white, for: .normal)
            button.addTarget(self, action: #selector(changeButtonTapped), for: .touchUpInside)
            return button
        }()
        
        titleTextField = {
            let textField = UITextField(frame: CGRect(origin: CGPoint(x: 50, y: 170), size: CGSize(width: 300, height: 50)))
            textField.placeholder = "제목을 입력하세요."
            textField.clearButtonMode = .whileEditing
            textField.borderStyle = .roundedRect
            return textField
        }()
        
        contentTextField = {
            let textField = UITextField(frame: CGRect(origin: CGPoint(x: 50, y: 230), size: CGSize(width: 300, height: 300)))
            textField.placeholder = "내용을 입력하세요."
            textField.clearButtonMode = .whileEditing
            textField.borderStyle = .roundedRect
            return textField
        }()
    }
    
    private func addViews() {
        [titleLabel, imageView, nextButton, changeButton, titleTextField, contentTextField].forEach {
            view.addSubview($0)
        }
    }
    
    @objc func changeButtonTapped() {
        self.isNavigation.toggle()
        titleLabel.text = isNavigation ? "네비게이션" : "모달"
    }
    
    @objc func nextButtonTapped() {
        guard let title = titleTextField.text,
              let content = contentTextField.text else { return }
        let nextViewController = DetailViewController()
        nextViewController.dataBind(title: title, content: content)
        print(title)
        if isNavigation {
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else {
            self.present(nextViewController, animated: true)
        }
    }
}
