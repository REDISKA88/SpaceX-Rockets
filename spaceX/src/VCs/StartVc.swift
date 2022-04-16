import UIKit

class StartVc: UIViewController {
    
    let pageControl = UIPageControl()
    let padding: CGFloat = 20
    let pageWidth = UIScreen.main.bounds.width
    let tableViewCellIdentifier = "cell"
    let optionsTableViewCellId = "TableViewCell"
    let tableViewUniqueIdFactor = 1000
    var allLaunches: Launches?
    var allRocketsv4: SpaceXRockets?
    var reservedParams = [Parameters]()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupStackView()
        setupPageControl()
        customizeStartVc()
        Manager.shared.requestRockets { (rockets) in
            self.allRocketsv4 = rockets
            self.createTableView(pages: rockets.count)
        }
        Manager.shared.requestLaunches(urlString: Manager.urlLaunch) { (launches) in
            self.allLaunches = launches
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func createTableView(pages: Int){
        pageControl.numberOfPages = pages
        for modelIndex in 0 ..< pages {
                let tableView = UITableView()
                tableView.translatesAutoresizingMaskIntoConstraints = false
                tableView.tag = tableViewUniqueIdFactor + modelIndex
                registerCustomCells(for: tableView)
                reservedParams.append(setVaulesForRocketParameters(allRocketsv4![modelIndex]))
                tableView.dataSource = self
                tableView.delegate = self
                tableView.backgroundColor = .black
                tableView.tableFooterView = UIView()
                stackView.addArrangedSubview(tableView)
                tableView.widthAnchor.constraint(equalToConstant: pageWidth).isActive = true
            }
        }
    
    func registerCustomCells(for tableView: UITableView) {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: tableViewCellIdentifier)
        tableView.register(ImageViewCell.self, forCellReuseIdentifier: "ImageViewCell")
        tableView.register(NameAndSettingsCell.self, forCellReuseIdentifier: "NameAndSettingsCell")
        tableView.register(UINib(nibName: "infoCell", bundle: nil), forCellReuseIdentifier: "info")
        tableView.register(UINib(nibName: "DetailCell", bundle: nil), forCellReuseIdentifier: "detail")
        tableView.register(UINib(nibName: "OptionsTableViewCell", bundle: nil), forCellReuseIdentifier: "OptionsTableCell")
    }
    
    
    private func setupScrollView() {
        
        scrollView.delegate = self
        view.addSubview(scrollView)
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding).isActive = true
        scrollView.widthAnchor.constraint(equalToConstant: pageWidth).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding * 1.5).isActive = true
    }

    private func setupStackView() {
        
        scrollView.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 1).isActive = true
    }

    private func setupPageControl() {
        pageControl.numberOfPages = 1
        pageControl.currentPage = 0
        pageControl.tintColor = .black
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .white
        
        view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pageControl.topAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        // 200
        pageControl.widthAnchor.constraint(equalToConstant: 0).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
        
}

    extension StartVc: UIScrollViewDelegate {
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            if !(scrollView is UITableView) {
                let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
                pageControl.currentPage = Int(pageNumber)
            }
        }

}

