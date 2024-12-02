//
//  ChartViewController.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 10/26/24.
//

import UIKit

final class ChartViewController: BaseViewController {
    
    private let tableView = UITableView()
    private let appList = App.mockData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "인기 차트"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func initAttributes() {
        tableView.do {
            $0.register(
                ChartCell.self,
                forCellReuseIdentifier: ChartCell.identifier)
//            $0.rowHeight = UITableView.automaticDimension
            $0.rowHeight = 90
            $0.dataSource = self
            $0.delegate = self
        }
    }
    
    override func addViews() {
        view.addSubview(tableView)
    }
    
    override func setLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension ChartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, 
                   didSelectRowAt indexPath: IndexPath) {
        let viewController = DetailViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension ChartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, 
                   numberOfRowsInSection section: Int) -> Int {
        return appList.count
    }
    
    func tableView(_ tableView: UITableView, 
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChartCell.identifier, for: indexPath) as? ChartCell else {
            return UITableViewCell()
        }
        cell.configure(app: appList[indexPath.row])
        
        return cell
    }
}
