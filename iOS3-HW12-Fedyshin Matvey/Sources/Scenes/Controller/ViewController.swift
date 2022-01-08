//
//  ViewController.swift
//  TableView Practice
//
//  Created by matt_spb on 14.12.2021.
//

import UIKit

class ViewController: UIViewController {

    var model = [Section]()

    lazy var tableView: UITableView = {
        let table = UITableView(frame: view.bounds, style: .grouped)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        title = "Settings"
        view.backgroundColor = .systemBackground
        model = SettingsModel.createModels()
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.register(RegularTableViewCell.self,
                           forCellReuseIdentifier: RegularTableViewCell.identifier)
        tableView.register(SwitchTableViewCell.self,
                           forCellReuseIdentifier: SwitchTableViewCell.switchCellIdentifier)
        tableView.register(DetailTableViewCell.self,
                           forCellReuseIdentifier: DetailTableViewCell.detailCellIdentifier)

        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return model.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model[section].options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let model = model[indexPath.section].options[indexPath.row]

        switch model.cellType {
            case .regularCell:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: RegularTableViewCell.identifier, for: indexPath) as? RegularTableViewCell else { return UITableViewCell() }
                cell.configure(with: model)
                return cell
            case .switchCell:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.switchCellIdentifier, for: indexPath) as? SwitchTableViewCell else { return SwitchTableViewCell() }
                cell.configure(with: model)
                return cell
            case .detailCell:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.detailCellIdentifier, for: indexPath) as? DetailTableViewCell else { return UITableViewCell() }
                cell.configure(with: model)
                return cell
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let model = model[indexPath.section].options[indexPath.row]
        print("Нажата ячейка \(model.title)")
    }
}
