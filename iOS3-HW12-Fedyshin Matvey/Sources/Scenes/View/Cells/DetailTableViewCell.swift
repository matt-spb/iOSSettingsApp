import UIKit

class DetailTableViewCell: RegularTableViewCell {

    static let detailCellIdentifier = "DetailTableViewCell"

    lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(detailLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        detailLabel.frame = CGRect(x: contentView.frame.size.width / 2,
                                   y: 0,
                                   width: contentView.frame.size.width / 2 - 10,
                                   height: contentView.bounds.size.height)
    }

    override func configure(with model: SettingsOption) {
        super.configure(with: model)
        detailLabel.text = model.detailInfo
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        detailLabel.text = nil
    }
}
