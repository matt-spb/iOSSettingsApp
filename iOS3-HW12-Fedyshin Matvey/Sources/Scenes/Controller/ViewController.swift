import UIKit

class ViewController: UIViewController {

    var model = [Section]()

    private var settingsView: SettingsView? {
        guard isViewLoaded else { return nil }
        return view as? SettingsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    func configure() {
        view = SettingsView()
        title = "Settings"

        settingsView?.tableView.delegate = self
        settingsView?.tableView.dataSource = self
        model = SettingsModel.createModels()
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
        guard let settingsView = settingsView else { return UITableViewCell() }
        let cell = settingsView.getCell(for: model)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let model = model[indexPath.section].options[indexPath.row]
        print("Нажата ячейка \(model.title)")
    }
}
