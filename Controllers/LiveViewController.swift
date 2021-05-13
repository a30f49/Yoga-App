import UIKit
import SafariServices
import Firebase

class LiveViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SFSafariViewControllerDelegate  {
    
    let tableView = UITableView()
    private var service: LiveService?
    var lives = [Live]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.tableView.separatorStyle = .none
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        loadData()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
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

    func loadData() {
       service = LiveService()
        service?.get(collectionID: "Live") { [weak self] lives in
          self?.lives = lives.filter { (liveService) -> Bool in
               liveService.liveActive != false
           }.sorted(by: { (a, b) -> Bool in
               a.dateLive < b.dateLive
           })
          self?.tableView.reloadData()
       }
   }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lives.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let live = lives[indexPath.row]
        let safariVC = SFSafariViewController(url: (NSURL(string: "\(live.liveURL ?? "")")! as? URL)!)
        present(safariVC, animated: true, completion: nil)
        safariVC.delegate = self
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let liveCell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let live = lives[indexPath.row]
        liveCell.accessoryType = .disclosureIndicator
        liveCell.textLabel?.text = "\(live.title ?? "")"
        liveCell.detailTextLabel?.text = "\(live.dateString )"
        liveCell.textLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        liveCell.detailTextLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        liveCell.selectionStyle = .none
        return liveCell
    }
}
