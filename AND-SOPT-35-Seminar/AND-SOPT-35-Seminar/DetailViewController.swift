//
//  DetailViewController.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 10/5/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    private lazy var button = UIButton()
    private var titleLabel = UILabel()
    private var contentLabel = UILabel()
    
    private var receivedTitleText: String?
    private var receivedContentText: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray3
        
        initAttributes()
        addViews()
    }
    
    private func initAttributes() {
        button = {
            let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
            button.setTitle("이전 화면으로", for: .normal)
            button.tintColor = .darkGray
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            return button
        }()
        
        titleLabel = {
            let label = UILabel(frame: CGRect(origin: CGPoint(x: 130, y: 150), size: CGSize(width: 150, height: 100)))
            label.font = .boldSystemFont(ofSize: 20)
            label.text = receivedTitleText
            label.textAlignment = .center
            return label
        }()
        
        contentLabel = {
            let label = UILabel(frame: CGRect(origin: CGPoint(x: 130, y: 220), size: CGSize(width: 150, height: 100)))
            label.font = .systemFont(ofSize: 16)
            label.text = receivedContentText
            label.textAlignment = .center
            return label
        }()
    }
    
    private func addViews() {
        [button, titleLabel, contentLabel].forEach {
            view.addSubview($0)
        }
    }
    
    func dataBind(title: String, content: String) {
        self.receivedTitleText = title
        self.receivedContentText = content
    }
    
    @objc func buttonTapped() {

        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }

}
