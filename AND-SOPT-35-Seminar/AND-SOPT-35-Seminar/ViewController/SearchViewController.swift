//
//  SearchViewController.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 12/2/24.
//

import UIKit

import RxSwift
import RxCocoa

class SearchViewController: UIViewController {
    
    private let appList = App.mockData
    private let tableView = UITableView()
    private let searchBar = UISearchBar()
    
    var searchedList: [App] = []
    
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.do {
            $0.register(
                ChartCell.self,
                forCellReuseIdentifier: ChartCell.identifier)
            $0.rowHeight = 90
            $0.dataSource = self
            $0.delegate = self
        }
        
        [searchBar, tableView].forEach {
            view.addSubview($0)
        }
        
        searchBar.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.leading.trailing.equalToSuperview()
        }
        tableView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(20)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        rxSetup()
    }
    
    private func rxSetup() {
        searchBar.rx.text.orEmpty
            .debounce(RxTimeInterval.microseconds(500), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .subscribe(
                onNext: { [weak self] t in
                    
                    self?.searchedList = self?.appList.filter { $0.title.hasPrefix(t) } ?? []
                    self?.tableView.reloadData()
                })
            .disposed(by: disposeBag)
        
    }
    
    
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchedList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChartCell.identifier, for: indexPath) as? ChartCell else {
            return UITableViewCell()
        }
        cell.configure(app: searchedList[indexPath.row])
        
        return cell
    }
    
    
}
