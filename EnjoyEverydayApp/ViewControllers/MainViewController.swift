//
//  MainViewController.swift
//  EnjoyEverydayApp
//
//  Created by Илья Дубенский on 16.11.2022.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var datePickerSettings: UIDatePicker!
    @IBOutlet var resultButton: UIButton!

    // MARK: - Private Properties
    private var numberOfDays = ""

    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        setSettings()
    }

    // MARK: - IBActions
    @IBAction func datePicker(_ sender: UIDatePicker) {
        let range = sender.date..<Date.now
        numberOfDays = range.formatted(
            .components(style: .wide, fields: [.day])
        )
        resultButton.isEnabled = true
        resultButton.backgroundColor = .green
    }

    @IBAction func resultButtonDidTapped() {
        resultLabel.text = "Ты наслаждаешься жизнью уже \(numberOfDays)!"
        resultLabel.isHidden = false
    }
}

// MARK: - Private Methods
extension MainViewController {
    private func setSettings() {

        datePickerSettings.maximumDate = Date.now

        resultButton.isEnabled = false
        resultButton.backgroundColor = .red
        resultButton.layer.cornerRadius = 15

        resultLabel.isHidden = true
    }
}
