import UIKit
import Firebase
import AVKit
class DetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var Serie: Serie!
    let tableView = UITableView()
    private var service: VideoService?

    var videos = [Video]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.tableView.separatorStyle = .none
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "\(Serie.title)"
        tableView.register(videoCell.self,
                           forCellReuseIdentifier: videoCell.identifier)
        setupTableView()
        loadData()
    }

    func loadData() {
        service = VideoService()
        service?.get(collectionID: "Video") { videos in
            self.videos = videos.filter { (videos) in
                //filter videos by category
                videos.category == self.Serie.title
            }
            self.tableView.reloadData()
        }
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.allowsSelection = true
        tableView.separatorStyle = .none
        tableView.backgroundColor = .systemBackground
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let videoCell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! videoCell
        let video = self.videos[indexPath.row]
        videoCell.selectionStyle = .none
        videoCell.courseTitle.text = "\(video.title ?? "")"
        videoCell.timeLabel.text = " \(video.duration ?? 0.0) "
        if let url = URL(string: video.imageURL) {
            videoCell.courseImage.kf.setImage(with: url)
        }
        return videoCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let video = self.videos[indexPath.row]
        let videoURL = NSURL(string: "\(video.videoURL ?? "")")
        let player = AVPlayer(url: videoURL! as URL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true)
        {
           playerViewController.player!.play()
        }
    }
}
