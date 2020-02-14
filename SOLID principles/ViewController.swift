//
//  ViewController.swift
//  SOLID principles
//
//  Created by Vokh Stag on 26/01/2020.
//  Copyright © 2020 Vokh Stag. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let urlString = "https://raw.githubusercontent.com/Softex-Group/task-mobile/master/test.json"
    
    //Внешние зависимости
    let networkService = NetworkService()
    let dataStore = DataStore()

    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveButton.layer.cornerRadius = saveButton.frame.width/2
        
        networkService.dataFetcher(urlString: urlString)
    }

    //MARK: - Business logic
    
    //обработка имени
    func changeName() {
        guard let name = textLabel.text, name != "" else {
            showAlert()
            return
        }
        dataStore.saveNameInCache(name: name)
    }
    
    //MARK: - User Interface
    
    //отображение алерта
    func showAlert() {
        let alert = UIAlertController(title: "WARNING!", message: "Youre name can't be empty", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func changeLabel(_ sender: UITextField) {
        textLabel.text = sender.text
    }
    
    @IBAction func saveButtonTouch(_ sender: UIButton) {
        changeName()
    }
    
}

