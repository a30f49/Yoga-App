import UIKit
import Firebase
class TabBarController: UITabBarController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().barTintColor = .lightText
        tabBar.tintColor = .black
        setupViewControllers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupViewControllers()
    }
 
   func setupViewControllers() {
           viewControllers = [
               generateNavigationController(for: SeriesViewController(), title: NSLocalizedString("Series", comment: ""), image: UIImage(systemName: "play.rectangle")!),
               generateNavigationController(for: LiveViewController(), title: NSLocalizedString("Live Classes", comment: ""), image: UIImage(systemName: "video")!),
               generateNavigationController(for: ProfileViewController(), title: NSLocalizedString("Profile", comment: ""), image: UIImage(systemName: "person")!)
           ]
       }
    
    fileprivate func generateNavigationController(for rootViewController: UIViewController,
                                                  title: String,
                                                  image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
}
