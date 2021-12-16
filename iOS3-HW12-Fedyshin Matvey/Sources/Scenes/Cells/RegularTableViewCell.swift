import UIKit

class RegularTableViewCell: UITableViewCell {

    static let identifier = "RegularTableViewCell"

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


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        accessoryType = .disclosureIndicator
        contentView.addSubview(label)
        contentView.addSubview(containerView)
        containerView.addSubview(icon)
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
    }

    public func setup(with model: SettingsOption) {
        icon.image = model.icon
        label.text = model.title
        containerView.backgroundColor = model.backgroundColor
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        label.text = nil
        icon.image = nil

    }
}
