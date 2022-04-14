import UIKit

class StartVc: UIViewController {
    
    var images = [UIImage(named: "img")]
    
        let scrollView: UIScrollView =
        {
            let scrollView = UIScrollView()
            scrollView.isPagingEnabled = true
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            return scrollView
        }()
        
        let stackView: UIStackView =
        {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.distribution = .equalSpacing
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        let pageControl = UIPageControl()
        
        let padding: CGFloat = 20
        let pageWidth = UIScreen.main.bounds.width
        let tableViewCellIdentifier = "cell"
        let tableViewUniqueIdFactor = 1000
        var allLaunches: Launches?
        var allRocketsv4: SpaceXRockets?

    
    
        override func viewDidLoad()
        {
            super.viewDidLoad()
            setupScrollView()
            setupStackView()
            setupPageControl()
            Manager.shared.getRockets { (rockets) in
            self.allRocketsv4 = rockets
                self.createTableView(pages: rockets.count)
            }
           
//            Manager.shared.getLaunches { (launches) in
//                print(launches)
//                self.allLaunches = launches
//            }
            

            let https = "https://api.spacexdata.com/v4/launches"
            request(urlString: https) { (launches) in
                self.allLaunches = launches
            }
            
            title = "SpaceX-Rockets"
            view.backgroundColor = .black
            navigationController?.navigationBar.barTintColor = .clear
            navigationController?.navigationBar.tintColor = .white
            
    
            // createTableView()
    }
    
    
    func request(urlString: String, completion: @escaping (Launches?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if error != nil {
                    print("error")
                    completion(nil)
                    return
                }
                guard let data = data else { return }
                do {
                    let decoder = JSONDecoder()
                   // decoder.dateDecodingStrategy = .iso8601
                    let launches = try decoder.decode(Launches.self, from: data)
                    completion(launches)
                } catch let jsonError {
                    print("Fail to decode JSON", jsonError)
                    completion(nil)
                }
            }
        }.resume()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    private func setupScrollView() {
        
        scrollView.delegate = self
        
        view.addSubview(scrollView)
        
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
            .isActive = true
        
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                        constant: padding).isActive = true
        
        scrollView.widthAnchor.constraint(equalToConstant: pageWidth).isActive = true
        
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                           constant: -padding * 1.5).isActive = true
    }

    private func setupStackView() {
        
        scrollView.addSubview(stackView)
        
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor)
            .isActive = true
        
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor)
            .isActive = true
        
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
            .isActive = true
        
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
            .isActive = true
        stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor,
                                          multiplier: 1).isActive = true
    }

    private func setupPageControl() {
        pageControl.numberOfPages = 1
        pageControl.currentPage = 0
        pageControl.tintColor = .black
        //pageControl.tintColor = randomColor()
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .white
        
        view.addSubview(pageControl)
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            .isActive = true
        
        pageControl.topAnchor.constraint(equalTo: scrollView.bottomAnchor)
            .isActive = true
        
        // 200
        pageControl.widthAnchor.constraint(equalToConstant: 0)
            .isActive = true
        
        pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            .isActive = true
    }

    private func createTableView(pages: Int) {
        pageControl.numberOfPages = pages
        for modelIndex in 0 ..< pages {
                let tableView = UITableView()
                
                tableView.translatesAutoresizingMaskIntoConstraints = false
            
                tableView.tag = tableViewUniqueIdFactor + modelIndex
            
                tableView.register(UITableViewCell.self,
                                   forCellReuseIdentifier: tableViewCellIdentifier)
                tableView.register(ImageViewCell.self, forCellReuseIdentifier: "ImageViewCell")
                tableView.register(UINib(nibName: "infoCell", bundle: nil), forCellReuseIdentifier: "info")
                tableView.register(UINib(nibName: "DetailCell", bundle: nil), forCellReuseIdentifier: "detail")
            
                tableView.dataSource = self
                tableView.delegate = self
                
                tableView.backgroundColor = .black
               // tableView.layer.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                
                tableView.tableFooterView = UIView()
                
                stackView.addArrangedSubview(tableView)
                
                tableView.widthAnchor.constraint(equalToConstant: pageWidth)
                    .isActive = true
            }
        }
        
    }

    extension StartVc: UIScrollViewDelegate {
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView)
        {
            if !(scrollView is UITableView)
            {
                let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
                pageControl.currentPage = Int(pageNumber)
            }
        }

}
extension StartVc: UITableViewDataSource, UITableViewDelegate {
   /*
    @objc func openDetail(sender: UIButton){
        let anotherVc = OpenVc()
        let currentModel = sender.tag
        anotherVc.instanceOfRocket = dataController.spacexStorage[currentModel]
        navigationController?.pushViewController(anotherVc, animated: true)
    }
 */
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            let currentImage = images[indexPath.row]
            let cropImage = currentImage!.getCropRatio()
            let resultHeight: CGFloat = (tableView.frame.width / cropImage)
            return resultHeight
        }
       
        if indexPath.row == 13 {
            return 100
        }
         return 60
    }
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 14
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let modelIndex = tableView.tag - tableViewUniqueIdFactor
        let rocketAtIndex = allRocketsv4?[modelIndex]
        //let rocket = rocketDataArray[modelIndex]
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageViewCell") as! ImageViewCell
            if let url = URL(string: (rocketAtIndex?.flickrImages![0])!) {
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url) {
                        if let image = UIImage(data: data) {
                            DispatchQueue.main.async {
                                cell.mainImageView.image = image
                            }
                        }
                    }
                }
            }
            cell.mainImageView.layer.cornerRadius = 30
            cell.mainImageView.layer.masksToBounds = true
            cell.backgroundColor = .black
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier)!
            cell.selectionStyle = .none
            let font: UIFont = UIFont.boldSystemFont(ofSize: 30)
            cell.textLabel?.textColor = .white
            cell.textLabel?.font = font
            cell.textLabel?.text = rocketAtIndex?.name
            cell.backgroundColor = .black
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "info", for: indexPath) as! infoCell
            cell.titleLabel.text = "Первый запуск"
            cell.valueLabel.text = ""
            //cell.unitLabel.text = rocket.launchDate
            cell.unitLabel.text = rocketAtIndex?.firstFlight
            cell.unitLabel.font = UIFont.systemFont(ofSize: 20)
            cell.unitLabel.textColor = .white
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "info", for: indexPath) as! infoCell
            cell.titleLabel.text = "Страна"
            //cell.valueLabel.text = rocket.countryName
            cell.valueLabel.text = ""
            //cell.unitLabel.text = rocket.countryName
            
            if rocketAtIndex?.country?.contains("Marshall Islands") == true {
                cell.unitLabel.text = "Marshall Islands"
            } else { cell.unitLabel.text = rocketAtIndex?.country }
            cell.unitLabel.font = UIFont.systemFont(ofSize: 20)
            cell.unitLabel.textColor = .white
            return cell
            
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "info", for: indexPath) as! infoCell
            guard let cost = rocketAtIndex?.costPerLaunch else {
                cell.valueLabel.text = "UNKNOWN"
                cell.valueLabel.font = UIFont.boldSystemFont(ofSize: 20)
                cell.unitLabel.text = "$"
                return cell
            }
            
            cell.titleLabel.text = "Стоимость запуска"
            cell.valueLabel.text = String(cost)
            cell.valueLabel.font = UIFont.boldSystemFont(ofSize: 20)
            cell.unitLabel.text = "$"
            return cell
        
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier)!
            cell.selectionStyle = .none
            cell.textLabel?.textColor = .white
            cell.backgroundColor = .black
            cell.textLabel?.text = "ПЕРВАЯ СТУПЕНЬ"
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            return cell
            
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "info", for: indexPath) as! infoCell
            cell.titleLabel.text = "Количество двигателей"
            //cell.valueLabel.text = "\(rocket.firstStageEngines)"
            guard let engines = rocketAtIndex?.firstStage?.engines else {
                cell.valueLabel.font = UIFont.boldSystemFont(ofSize: 20)
                cell.unitLabel.text = "UNKNOWN"
                return cell
            }
            cell.valueLabel.text = String(engines)
            cell.valueLabel.font = UIFont.boldSystemFont(ofSize: 20)
            cell.unitLabel.text = "nan"
            cell.unitLabel.textColor = .clear
            return cell
        case 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: "info", for: indexPath) as! infoCell
            cell.titleLabel.text = "Колличетво топлива"
            cell.valueLabel.text = String(rocketAtIndex?.firstStage?.fuelAmountTons ?? 0)
           // cell.valueLabel.text = "\(rocket.firstStageFuel)"
            cell.valueLabel.font = UIFont.boldSystemFont(ofSize: 20)
            cell.unitLabel.text = "tons"
            return cell
            
        case 8:
            let cell = tableView.dequeueReusableCell(withIdentifier: "info", for: indexPath) as! infoCell
            cell.titleLabel.text = "Время сгорания"
            cell.valueLabel.text = "\(rocketAtIndex?.firstStage?.burnTimeSEC ?? 0)"
            cell.valueLabel.font = UIFont.boldSystemFont(ofSize: 20)
            cell.unitLabel.text = "sec"
            return cell
            
        case 9:
            let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier)!
            cell.textLabel?.textColor = .white
            cell.backgroundColor = .black
            cell.selectionStyle = .none
            cell.textLabel?.text = "ВТОРАЯ СТУПЕНЬ"
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            return cell
        case 10:
            let cell = tableView.dequeueReusableCell(withIdentifier: "info", for: indexPath) as! infoCell
            cell.titleLabel.text = "Количество двигателей"
            guard let engines = rocketAtIndex?.firstStage?.engines else {
                cell.valueLabel.font = UIFont.boldSystemFont(ofSize: 20)
                cell.unitLabel.text = "UNKNOWN"
                return cell
            }
            cell.valueLabel.text = String(engines)
            cell.valueLabel.font = UIFont.boldSystemFont(ofSize: 20)
            cell.unitLabel.text = "nan"
            cell.unitLabel.textColor = .clear
            return cell
        case 11:
            let cell = tableView.dequeueReusableCell(withIdentifier: "info", for: indexPath) as! infoCell
            cell.titleLabel.text = "Колличетво топлива"
            cell.valueLabel.text = String(rocketAtIndex?.secondStage?.fuelAmountTons ?? 0)
            cell.unitLabel.text = "tons"
            return cell
            
        case 12:
            let cell = tableView.dequeueReusableCell(withIdentifier: "info", for: indexPath) as! infoCell
            cell.titleLabel.text = "Время сгорания"
            cell.valueLabel.text = "\(rocketAtIndex?.secondStage?.burnTimeSEC ?? 0)"
            cell.unitLabel.text = "sec"
            return cell
            
        case 13:
            let cell = tableView.dequeueReusableCell(withIdentifier: "detail", for: indexPath) as! DetailCell

            cell.backgroundColor = .black
            
            cell.myButton.layer.cornerRadius = cell.myButton.frame.size.height/2
            cell.myButton.layer.borderWidth = 0.5
            cell.myButton.tag = modelIndex
            cell.myButton.addTarget(self, action: #selector(openNewViewController(sender:)), for: .touchUpInside)

    
            return cell
    
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier)!
            cell.selectionStyle = .none
            //cell.backgroundColor = .black
            return cell
        }
        
    }
    
}

extension StartVc {
    @objc func openNewViewController(sender:UIButton) {
        let openvc = OpenVc()
        let currentModel = sender.tag
        if let rocketId = allRocketsv4?[currentModel].id {
            for now in allLaunches! {
                if let id = now.rocket {
                    if id.hashValue == rocketId.hashValue {
                        if openvc.currentSpaceshipLaunches == nil {
                            openvc.currentSpaceshipLaunches = [SpaceXLaunches]()
                            openvc.currentSpaceshipLaunches.append(now)
                        } else {
                            openvc.currentSpaceshipLaunches.append(now)
                        }
                        
                    }
                }
            }
        }
        if let currentRocketName = allRocketsv4?[currentModel].name {
            openvc.rocketName = currentRocketName
        }
        if openvc.currentSpaceshipLaunches == nil {
            openvc.currentSpaceshipLaunches = [SpaceXLaunches(rocket: Rocket(rawValue: "empty"), success: false, name: "Ожидаем запуск", id: "0")]
        }
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white,
                              NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 20)]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        // openvc.launchList = dataController.spasexLaunchesData[currentModel]
        self.navigationController?.pushViewController(openvc, animated: true)
    }
}


