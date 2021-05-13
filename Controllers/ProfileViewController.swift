import UIKit
import SafariServices
import Firebase
class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SFSafariViewControllerDelegate {
    
    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    var accountSections = ["Customer support",
                           "Instagram",
                           "Terms and conditions",
                           "Privacy policy"]
    
    var subtitleSections = ["Chat with us",
                            "Follow our journey",
                            "Read our terms of service",
                            "Learn about our data treatment"]
    
    let urlArray = ["https://drift.me/sullivan",
                    "https://www.instagram.com/",
                    "https://developers.google.com/terms/",
                    "https://cloud.google.com/terms/"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
    }
    
    func SignOut() {
          let firebaseAuth = Auth.auth()
          do {
              try firebaseAuth.signOut()
            print("user logout")
          } catch let signOutError as NSError {
              print ("Error signing out: %@", signOutError)
            let alert = UIAlertController(title: "Error", message: "We were not able to sign you out, check your internet connection.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
          }
      }
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return accountSections.count
        }
        else {
            return 1
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let settingCell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
            settingCell.accessoryType = .disclosureIndicator
            settingCell.textLabel?.text = accountSections[indexPath.row]
            settingCell.detailTextLabel?.text = subtitleSections[indexPath.row]
            settingCell.textLabel?.font = .preferredFont(forTextStyle: .headline)
            settingCell.textLabel?.font = .boldSystemFont(ofSize: 18)
            settingCell.detailTextLabel?.font = .preferredFont(forTextStyle: .subheadline)
            settingCell.detailTextLabel?.textColor = .systemGray
            settingCell.selectionStyle = .none
            return settingCell
        } else {
            let authCell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
            authCell.accessoryType = .disclosureIndicator
            authCell.textLabel?.text = "Log Out"
            authCell.detailTextLabel?.text = "Get back soon!"
            authCell.textLabel?.font = .systemFont(ofSize: 20, weight: .medium)
            authCell.detailTextLabel?.font = .systemFont(ofSize: 18, weight: .regular)
            authCell.selectionStyle = .none
            return authCell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let safariVC = SFSafariViewController(url: NSURL(string: urlArray[indexPath.row])! as URL)
            present(safariVC, animated: true, completion: nil)
            safariVC.delegate = self
        } else
        if indexPath.section == 1  {
            SignOut()
        }
    }
}
