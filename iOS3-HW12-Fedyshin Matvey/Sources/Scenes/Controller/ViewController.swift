import UIKit

class ViewController: UIViewController {

    var model: SettingsModel?

    private var settingsView: SettingsView? {
        guard isViewLoaded else { return nil }
        return view as? SettingsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    func configure() {
        model = SettingsModel()
        view = SettingsView()
        title = "Settings"
        guard let models = model?.createModels() else { return }
        settingsView?.configure(with: models)
    }
}
