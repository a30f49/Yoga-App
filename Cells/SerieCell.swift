import UIKit

class SerieCell: UITableViewCell {
    var sportImageView = UIImageView()
    var sportTitle = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(sportImageView)
        addSubview(sportTitle)
        configureTitleLabel()
        configureImageView()
        setupImageconstraint()
        setupTitleConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(series: Serie) {
        sportImageView.image = series.image
        sportTitle.text = series.title
    }
    
    func configureImageView() {
        sportImageView.layer.cornerRadius = 0
        sportImageView.contentMode = .scaleAspectFill
        sportImageView.layer.shadowRadius = 2
        sportImageView.layer.shadowColor = UIColor.black.cgColor
        sportImageView.layer.shadowOpacity = 0.25
        sportImageView.layer.masksToBounds = false
    }
    
    func configureTitleLabel() {
        sportTitle.font = .systemFont(ofSize: 20, weight: .medium)
        sportTitle.textColor = .white
        sportTitle.layer.shadowColor = UIColor.black.cgColor
        sportTitle.layer.shadowRadius = 1.0
        sportTitle.layer.shadowOpacity = 1.0
        sportTitle.layer.shadowOffset = CGSize(width: 1, height: 1)
        sportTitle.layer.masksToBounds = false
    }
    
    func setupImageconstraint() {
        sportImageView.translatesAutoresizingMaskIntoConstraints = false
        sportImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17).isActive = true
        sportImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17).isActive = true
        sportImageView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        sportImageView.clipsToBounds = true
    }
    
    func setupTitleConstraint() {
        sportTitle.translatesAutoresizingMaskIntoConstraints = false
        sportTitle.centerYAnchor.constraint(equalTo: sportImageView.centerYAnchor).isActive = true
        sportTitle.leadingAnchor.constraint(equalTo: sportImageView.leadingAnchor, constant: 30).isActive = true
    }
}
