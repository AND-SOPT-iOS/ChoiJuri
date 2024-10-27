//
//  ChartViewController.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 10/26/24.
//

import UIKit

class ChartViewController: UIViewController {
    
    private let tableView = UITableView()
    private let appList = App.mockData
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(tableView)
        setLayout()
        setStyle()
        
    }
    
    private func setStyle() {
        
        tableView.do {
            $0.register(
                ChartCell.self,
                forCellReuseIdentifier: ChartCell.identifier)
            $0.rowHeight = 100
            $0.dataSource = self
        }
    }
    
    private func setLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension ChartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChartCell.identifier, for: indexPath) as? ChartCell else {
            return UITableViewCell()
        }
        cell.configure(app: appList[indexPath.row])
        return cell
    }
}
