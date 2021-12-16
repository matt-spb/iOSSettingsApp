import UIKit

class SwitchTableViewCell: UITableViewCell {

    static let identifier = "SwitchTableViewCell"

    lazy var label: UILabel = {
        let label = UILabel()
        return label
    }()

    lazy var icon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()

    lazy var containerView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 8

        return view
    }()

    lazy var mySwitch: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.isOn = false
        mySwitch.onTintColor = .systemBlue
        mySwitch.addTarget(self, action: #selector(switchChanged), for: UIControl.Event.valueChanged)

        return mySwitch
    }()

    @objc func switchChanged(mySwitch: UISwitch) {
        let state = mySwitch.isOn
        print("Switch state changed to \(state ? "On" : "Off")")

    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        accessoryType = .none

        contentView.addSubview(label)
        contentView.addSubview(containerView)
        containerView.addSubview(icon)
        contentView.addSubview(mySwitch)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let containerSize = contentView.frame.size.height - 10
        containerView.frame = CGRect(x: 10, y: 0,
                                     width: containerSize, height: containerSize)
        containerView.center.y = contentView.center.y

        let iconSize = containerSize - 8
        icon.frame = CGRect(x: (containerSize - iconSize) / 2,
                            y: (containerSize - iconSize) / 2,
                            width: iconSize,
                            height: iconSize)

        icon.clipsToBounds = true
        icon.tintColor = .white

        label.frame = CGRect(x: containerSize + 25,
                             y: 0,
                             width: contentView.bounds.size.width - containerSize - 10,
                             height: contentView.bounds.size.height)

        mySwitch.sizeToFit()
        mySwitch.frame = CGRect(x: contentView.bounds.size.width - mySwitch.frame.size.width - 20,
                                y: (contentView.bounds.size.height - mySwitch.bounds.size.height) / 2,
                                width: mySwitch.frame.size.width,
                                height: mySwitch.frame.size.height)
    }

    public func setup(with model: SettingsSwitchOption) {
        icon.image = model.icon
        label.text = model.title
        mySwitch.isOn = model.isOn
        containerView.backgroundColor = model.backgroundColor
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        label.text = nil
        icon.image = nil
        mySwitch.isOn = false
        containerView.backgroundColor = nil
    }
}
