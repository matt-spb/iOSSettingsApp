//
//  ViewController.swift
//  TableView Practice
//
//  Created by matt_spb on 14.12.2021.
//

import UIKit

struct Section {
    let options: [SettingsOptionsType]
}

enum SettingsOptionsType {
    case staticCell(model: SettingsOption)
    case switchCell(model: SettingsSwitchOption)
    case detailCell(model: SettingsDetailOption)
}

struct SettingsDetailOption {
    let title: String
    let detailInfo: String
    let icon: UIImage!
    let backgroundColor: UIColor
}

struct SettingsSwitchOption {
    let title: String
    let icon: UIImage!
    let backgroundColor: UIColor
    var isOn: Bool
}

struct SettingsOption {
    let title: String
    let icon: UIImage!
    let backgroundColor: UIColor
}

class ViewController: UIViewController {

    var model = [Section]()

    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero)

        return table
    }()

    private func setupTableView() {
        tableView.frame = view.bounds
        view.addSubview(tableView)
        tableView.register(RegularTableViewCell.self, forCellReuseIdentifier: RegularTableViewCell.identifier)
        tableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.identifier)

        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        view.backgroundColor = .systemBackground
        setupTableView()
        setupModel()
    }

    private func setupModel() {
        model.append(Section(options: [
            .switchCell(model: SettingsSwitchOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), backgroundColor: .systemOrange, isOn: false)),
            .detailCell(model: SettingsDetailOption(title: "Wi-Fi", detailInfo: "Home WiFi", icon: UIImage(systemName: "wifi"), backgroundColor: .systemBlue)),
            .detailCell(model: SettingsDetailOption(title: "Bluetooth", detailInfo: "On", icon: UIImage(named: "bluetooth"), backgroundColor: .systemBlue)),
            .staticCell(model: SettingsOption(title: "Mobile Data", icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), backgroundColor: .systemGreen)),
            .staticCell(model: SettingsOption(title: "Personal Hotspot", icon: UIImage(systemName: "personalhotspot"), backgroundColor: .systemGreen))
        ]))

        model.append(Section(options: [
            .staticCell(model: SettingsOption(title: "Notifications", icon: UIImage(systemName: "bell.badge.fill"), backgroundColor: .systemRed)),
            .staticCell(model: SettingsOption(title: "Sounds & Haptics", icon: UIImage(systemName: "speaker.wave.3.fill"), backgroundColor: .systemRed)),
            .staticCell(model: SettingsOption(title: "Focus", icon: UIImage(systemName: "moon.fill"), backgroundColor: .systemPurple)),
            .staticCell(model: SettingsOption(title: "Screen Time", icon: UIImage(systemName: "hourglass"), backgroundColor: .systemPurple))
        ]))

        model.append(Section(options: [
            .staticCell(model: SettingsOption(title: "General", icon: UIImage(systemName: "gear"), backgroundColor: .systemGray)),
            .staticCell(model: SettingsOption(title: "Control Centre", icon: UIImage(systemName: "switch.2"), backgroundColor: .systemGray)),
            .staticCell(model: SettingsOption(title: "Display & Brightness", icon: UIImage(systemName: "textformat.size"), backgroundColor: .systemBlue)),
            .staticCell(model: SettingsOption(title: "Home Screen", icon: UIImage(systemName: "apps.ipad.landscape"), backgroundColor: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))),
            .staticCell(model: SettingsOption(title: "Accessibility", icon: UIImage(systemName: "figure.walk.circle"), backgroundColor: .systemBlue)),
            .staticCell(model: SettingsOption(title: "Wallpaper", icon: UIImage(systemName: "circle.hexagongrid"), backgroundColor: .systemGreen)),
            .staticCell(model: SettingsOption(title: "Face ID & Passcode", icon: UIImage(systemName: "faceid"), backgroundColor: .systemGreen)),
            .staticCell(model: SettingsOption(title: "Exposure Notifications", icon: UIImage(systemName: "sun.min.fill"), backgroundColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))),
            .staticCell(model: SettingsOption(title: "Battery", icon: UIImage(systemName: "battery.100"), backgroundColor: .systemGreen)),
            .staticCell(model: SettingsOption(title: "Privacy", icon: UIImage(systemName: "hand.raised.fill"), backgroundColor: .systemBlue))
        ]))

        model.append(Section(options: [
            .staticCell(model: SettingsOption(title: "App Store", icon: UIImage(systemName: "applelogo"), backgroundColor: .systemBlue)),
            .staticCell(model: SettingsOption(title: "Wallet & Apple Pay", icon: UIImage(systemName: "creditcard.fill"), backgroundColor: .systemGray2))
        ]))
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

        switch model.self {
            case .staticCell(let model):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: RegularTableViewCell.identifier, for: indexPath) as? RegularTableViewCell else { return UITableViewCell() }
                cell.setup(with: model)
                return cell
            case .switchCell(let model):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier, for: indexPath) as? SwitchTableViewCell else { return SwitchTableViewCell() }
                cell.setup(with: model)
                return cell
            case .detailCell(let model):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as? DetailTableViewCell else { return UITableViewCell() }
                cell.setup(with: model)
                return cell
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let type = model[indexPath.section].options[indexPath.row]

        switch type.self {
            case .staticCell(let model):
                print("Нажата ячейка \(model.title)")
            case .switchCell(let model):
                print("Нажата ячейка \(model.title)")
            case .detailCell(let model):
                print("Нажата ячейка \(model.title)")
        }
    }
}

