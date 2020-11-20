//
//  DetailVC.swift
//  Stargazers
//
//  Created by Nicola Ferrara on 18/11/2020.
//

import UIKit

final class DetailVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: DetailVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    
    private func setup() {
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.register(UINib(nibName: "StargazersTableViewCell", bundle: nil), forCellReuseIdentifier: "StargazersTableViewCell")
        
    }
    
    private func bindVM() {
        
        guard let _ = self.viewModel else {
            return
        }
    }
    
    deinit {
        print("Deinit DetailVC")
    }
}

// MARK: - UITableView

extension DetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let model = viewModel?.model else { return 0 }
        return model.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let pokemonModel = viewModel?.model else { return UITableViewCell() }

        let cell = tableView.dequeueReusableCell(withIdentifier: "StargazersTableViewCell", for: indexPath) as! StargazersTableViewCell

        cell.config(owner: pokemonModel[indexPath.row].name, image: pokemonModel[indexPath.row].avatarUrl)

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
