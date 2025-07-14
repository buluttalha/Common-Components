//
//  SCTTableListController.swift
//  TalipBOKESadaPayCase
//
//  Created by Talip on 18.11.2022.
//

import UIKit
import BaseFoundation

public final class SCTTableListController<CellType: UITableViewCell & CellConfigurable>: UIViewController, UITableViewDataSource, UITableViewDelegate {
    public var didSelect: ((_ model: CellType.ModelType, _ indexPath: IndexPath) -> ())?
    public var cellForRowAt: ((_ cell: CellType, _ model: CellType.ModelType, _ indexPath: IndexPath) -> ())?
    
    private lazy var modelList = [CellType.ModelType]()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: .plain)
        tableView.register(CellType.self)
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = seperatorStyle
        return tableView
    }()
    
    private var emptyView: UIView?
    private var seperatorStyle: UITableViewCell.SeparatorStyle = .none
    private var heightForRowAt: CGFloat = 70
    
    public init(emptyView: UIView = UIView(),
                seperatorStyle: UITableViewCell.SeparatorStyle = .none,
                heightForRowAt: CGFloat = 70) {
        super.init(nibName: nil, bundle: nil)
        self.emptyView = emptyView
        self.seperatorStyle = seperatorStyle
        self.heightForRowAt = heightForRowAt
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    public func reload(with modelList: [CellType.ModelType]) {
        self.modelList = modelList
        self.tableView.reloadData()
        
        if self.modelList.count == 0 {
            self.emptyView?.frame = tableView.frame
            tableView.backgroundView = emptyView
        } else {
            tableView.backgroundView = nil
        }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: CellType.self, for: indexPath)
        cell.configure(with: modelList[indexPath.row])
        cellForRowAt?(cell, modelList[indexPath.row], indexPath)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelect?(modelList[indexPath.row], indexPath)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        self.heightForRowAt
    }
}

private extension SCTTableListController {
    func setupLayout() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
