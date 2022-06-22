import UIKit

class SwitchTableViewCell: RegularTableViewCell {

    static let switchCellIdentifier = "SwitchTableViewCell"
    private var isSwitchOn: Bool?

    lazy var mySwitch: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.onTintColor = .systemBlue
        mySwitch.addTarget(self, action: #selector(switchChanged), for: UIControl.Event.valueChanged)
        return mySwitch
    }()

    @objc func switchChanged(mySwitch: UISwitch) {
        let state = mySwitch.isOn
        self.isSwitchOn = state
        print("Switch state changed to \(state ? "On" : "Off")")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .none
        contentView.addSubview(mySwitch)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        mySwitch.sizeToFit()
        mySwitch.frame = CGRect(x: contentView.bounds.size.width - mySwitch.frame.size.width - 20,
                                y: (contentView.bounds.size.height - mySwitch.bounds.size.height) / 2,
                                width: mySwitch.frame.size.width,
                                height: mySwitch.frame.size.height)
    }

    override func configure(with model: SettingsOption) {
        super.configure(with: model)
        mySwitch.isOn = isSwitchOn ?? (model.isOn ?? false)
    }
}
