//
//  BaseViewController.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 10/16/24.
//

import UIKit
import SnapKit
import Then

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        initAttributes()
        addViews()
        setLayout()
    }
    
    func initAttributes() { }
    
    func addViews() { }
    
    func setLayout() { }
    
}
