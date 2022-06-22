//
//  SettingsView.swift
//  iOS3-HW12-Fedyshin Matvey
//
//  Created by matt_spb on 08.01.2022.
//

import UIKit

final class SettingsView: UIView {
    
    private var models = [Section]()

    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(RegularTableViewCell.self,
                           forCellReuseIdentifier: RegularTableViewCell.identifier)
        table.register(SwitchTableViewCell.self,
                           forCellReuseIdentifier: SwitchTableViewCell.switchCellIdentifier)
        table.register(DetailTableViewCell.self,
                           forCellReuseIdentifier: DetailTableViewCell.detailCellIdentifier)
        
        table.delegate = self
        table.dataSource = self
        return table
    }()

    //MARK: - Inits

    init() {
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        backgroundColor = .systemBackground
        setupHierarchy()
        setupLayout()
    }

    //MARK: - Settings
    
    func configure(with models: [Section]) {
        self.models = models
        tableView.reloadData()
    }

    private func setupHierarchy() {
        addSubview(tableView)
    }

    private func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    func getCell(for model: SettingsOption) -> UITableViewCell {
        switch model.cellType {
            case .regularCell:
                guard let cell = tableView.dequeueReusableCell(
                        withIdentifier: RegularTableViewCell.identifier)
                        as? RegularTableViewCell else { return UITableViewCell() }
                cell.configure(with: model)
                return cell
            case .switchCell:
                guard let cell = tableView.dequeueReusableCell(
                        withIdentifier: SwitchTableViewCell.switchCellIdentifier)
                        as? SwitchTableViewCell else { return SwitchTableViewCell() }
                cell.configure(with: model)
                return cell
            case .detailCell:
                guard let cell = tableView.dequeueReusableCell(
                        withIdentifier: DetailTableViewCell.detailCellIdentifier)
                        as? DetailTableViewCell else { return UITableViewCell() }
                cell.configure(with: model)
                return cell
        }
    }
}

extension SettingsView: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let model = models[indexPath.section].options[indexPath.row]
        let cell = getCell(for: model)
        return cell
    }
}

extension SettingsView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let model = models[indexPath.section].options[indexPath.row]
        print("Нажата ячейка \(model.title)")
    }
}
