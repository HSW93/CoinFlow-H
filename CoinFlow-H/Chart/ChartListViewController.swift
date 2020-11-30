//
//  ChartListViewController.swift
//  CoinFlow-H
//
//  Created by 황성우 on 2020/11/07.
//

import UIKit

class ChartListViewController: UIViewController {

    @IBOutlet weak var chartCollectionView: UICollectionView!
    @IBOutlet weak var chartTableView: UITableView!
    @IBOutlet weak var chartTableViewHeight: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NetworkManager.requestCoinList { result in
            switch result {
            
            
            case .success(let coins):
                print("--> coin list: \(coins.count)")
            case .failure(let error):
                print("--> error: \(error.localizedDescription)")
            }
        }
        
        NetworkManager.requestCoinChartData { result in
            switch result {
            case .success(let coinChartDats):
                print("--> chart data: \(coinChartDats.count)")
            case .failure(let error):
                print("--> error: \(error.localizedDescription)")
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        adjustTableViewHeight()
    }
}

// MARK: - Private Method
extension ChartListViewController {
    private func adjustTableViewHeight() {
        chartTableViewHeight.constant = chartTableView.contentSize.height
    }
    
    private func showDetail() {
        let storyboard = UIStoryboard(name: "Chart", bundle: .main)
        let chartDetailViewController = storyboard.instantiateViewController(identifier: "ChartDetailViewController")
        
        navigationController?.pushViewController(chartDetailViewController, animated: true)
    }
}

// MARK: - CollectionView
extension ChartListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChartCardCell", for: indexPath) as? ChartCardCell else {
            return UICollectionViewCell()
        }
        
        cell.backgroundColor = UIColor.randomColor()
        return cell
    }
}

extension ChartListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = collectionView.bounds.width - 20 * 2 - 15
        let height: CGFloat = 200
        
        return CGSize(width: width, height: height)
    }
}

class ChartCardCell: UICollectionViewCell {
    
}

// MARK: - TableView
extension ChartListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChartListCell", for: indexPath) as? ChartListCell else {
            return UITableViewCell()
        }
        
        cell.backgroundColor = UIColor.randomColor()
        return cell
    }
}

class ChartListCell: UITableViewCell {
    
}
