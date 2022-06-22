//
//  SettingsView.swift
//  iOS3-HW12-Fedyshin Matvey
//
//  Created by matt_spb on 08.01.2022.
//

import UIKit

final class SettingsView: UIView {

    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(RegularTableViewCell.self,
                           forCellReuseIdentifier: RegularTableViewCell.identifier)
        table.register(SwitchTableViewCell.self,
                           forCellReuseIdentifier: SwitchTableViewCell.switchCellIdentifier)
        table.register(DetailTableViewCell.self,
                           forCellReuseIdentifier: DetailTableViewCell.detailCellIdentifier)
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
