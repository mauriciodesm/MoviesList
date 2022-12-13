import UIKit
import SnapKit

class MoviesTableViewCell: UITableViewCell {
    private var stackView: UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 16
        return stack
    }()
    
    private var moviePoster: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 1,
                             y: 1,
                             width: 90,
                             height: 120)
        view.layer.cornerRadius = 18
        return view
    }()
    
    private var secondaryStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 8
        return stack
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(hex: "FFFFFF")
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(hex: "FFFFFF")?
                           .withAlphaComponent(0.75)
        label.font = UIFont.systemFont(ofSize: 14,
                                         weight: .regular)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
        self.setUpConstraints()
        self.applyAdditionalChanges()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView(){
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(moviePoster)
        stackView.addArrangedSubview(secondaryStackView)
        secondaryStackView.addArrangedSubview(titleLabel)
        secondaryStackView.addArrangedSubview(releaseDateLabel)
    }
    
    private func setUpConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().inset(8)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(80)
        }
        
        moviePoster.snp.makeConstraints { make in
            make.top.bottom.leading.equalToSuperview()
            make.trailing.equalTo(stackView.snp.leading).offset(90)
        }
        
        secondaryStackView.snp.makeConstraints { make in
            make.centerY.equalTo(self.contentView)
            make.trailing.equalTo(self.stackView.snp.trailing)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
        }
        
        releaseDateLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
    }
    
    private func applyAdditionalChanges() {
        titleLabel.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    }
    
}
