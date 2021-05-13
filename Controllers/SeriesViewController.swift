import UIKit
class SeriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    let tableView = UITableView()
    var series: [Serie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        tableView.register(SerieCell.self, forCellReuseIdentifier: "SerieCell")
        tableView.delegate = self
        tableView.dataSource = self
        series = fetchData()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .systemBackground
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return series.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellSerie = tableView.dequeueReusableCell(withIdentifier: "SerieCell", for: indexPath) as! SerieCell
        cellSerie.clipsToBounds = true
        cellSerie.selectionStyle = .none
        let sport = series[indexPath.row]
        cellSerie.set(series: sport)
        return cellSerie
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailsViewController()
        let Serie = series[indexPath.row]
        vc.Serie = Serie
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension SeriesViewController {
    func fetchData() -> [Serie] {
        let sport1 = Serie(title: "Vinyasa".uppercased(), image: Images.Vinyasa)
        let sport2 = Serie(title: "Ashtanga".uppercased(), image: Images.Ashtanga)
        let sport3 = Serie(title: "Hatha".uppercased(), image: Images.Hatha)
        return [sport1, sport2, sport3]
    }
}
