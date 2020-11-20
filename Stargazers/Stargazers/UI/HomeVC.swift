//
//  HomeVC.swift
//  Stargazers
//
//  Created by Nicola Ferrara on 18/11/2020.
//

import UIKit

final class HomeVC: UIViewController {
    
    @IBOutlet weak var ownerLabel: UITextField!
    @IBOutlet weak var repositoryLabel: UITextField!
    @IBOutlet weak var goButton: UIButton!
    
    var viewModel: HomeVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = HomeVM()
        bindVM()
    }
    
    private func bindVM() {
        
        guard let viewModel = self.viewModel else {
            return
        }
        
        viewModel.apiFinish = { [weak self] gotData in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if gotData {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    if let vc = storyboard.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC {
                    vc.viewModel = DetailVM(user: viewModel.model)
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                    
                } else {
                    let alert = UIAlertController(title: "Errore!", message: "I dati inseriti non sono corretti", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert, animated: true)
                }
            }
        }
    }

    @IBAction func goButtonDidTap(_ sender: UIButton) {
        guard let owner = ownerLabel.text, let repository = repositoryLabel.text else { return }
        self.viewModel?.getData(with: owner, repository: repository)
    }
}
