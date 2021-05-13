import UIKit
import Kingfisher

class videoCell: UITableViewCell {
    static let identifier = "VideoCell"
    var courseImage = UIImageView()
    var courseTitle = UILabel()
    var timeLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(courseImage)
        addSubview(courseTitle)
        addSubview(timeLabel)
        configureimageView()
        configureTitle()
        configuretimeLabel()
      }
    
    required init?(coder _: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    func configureimageView() {
        courseImage.translatesAutoresizingMaskIntoConstraints = false
        courseImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17).isActive = true
        courseImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17).isActive = true
        courseImage.heightAnchor.constraint(equalToConstant: 220).isActive = true
        courseImage.clipsToBounds = true
    }
  
    func configureTitle() {
        courseTitle.numberOfLines = -1
        courseTitle.textColor = .black
        courseTitle.font = .systemFont(ofSize: 18, weight: .medium)
        courseTitle.translatesAutoresizingMaskIntoConstraints = false
        courseTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18).isActive = true
        courseTitle.topAnchor.constraint(equalTo: courseImage.bottomAnchor, constant: 10).isActive = true
    }
    
    func configuretimeLabel() {
        timeLabel.numberOfLines = -1
        timeLabel.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        timeLabel.textColor = .white
        timeLabel.font = .systemFont(ofSize: 18, weight: .medium)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.rightAnchor.constraint(equalTo: courseImage.rightAnchor, constant: -18).isActive = true
        timeLabel.bottomAnchor.constraint(equalTo: courseImage.bottomAnchor, constant: -15).isActive = true
    }
 
}
