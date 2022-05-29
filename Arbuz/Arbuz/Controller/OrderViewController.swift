//
//  OrderViewController.swift
//  Arbuz
//
//  Created by Madi Keshilbayev on 28.05.2022.
//

import UIKit

class OrderViewController: UIViewController {

	@IBOutlet var addressTextField: UITextField!
	@IBOutlet var deliveryDateTimePicker: UIDatePicker!
	@IBOutlet var phoneNumberTextField: UITextField!
	@IBOutlet var orderButton: UIButton!
	@IBOutlet var validationLabel: UILabel!
	@IBOutlet var submitButton: UIButton!

	override func viewDidLoad() {
        super.viewDidLoad()

		addressTextField.layer.cornerRadius = 20
		phoneNumberTextField.layer.cornerRadius = 20
		submitButton.layer.cornerRadius = 20

		deliveryDateTimePicker.minimumDate = .now
		let currentDate = Date()
		var dateComponent = DateComponents()
		dateComponent.day = 9
		let futureDate = Calendar.current.date(byAdding: dateComponent, to: currentDate)
		deliveryDateTimePicker.maximumDate = futureDate
    }
    
	@IBAction func orderButtonTapped(_ sender: UIButton) {
		guard let phone = phoneNumberTextField.text else { return }
		guard let address = addressTextField.text else { return }

		if !address.isEmpty && phone.isEmpty {
			validationLabel.textColor = .red
			validationLabel.text = "Enter phone number..."
		}
		if address.isEmpty && !phone.isEmpty {
			validationLabel.textColor = .red
			validationLabel.text = "Enter address..."
		}
		if address.isEmpty && phone.isEmpty {
			validationLabel.textColor = .red
			validationLabel.text = "Enter address and phone number..."
		}
		if phone.isValidPhoneNumber() == false {
			validationLabel.textColor = .red
			validationLabel.text = "You've entered wrong phone number..."
		}
		else{
			validationLabel.textColor = .green
			validationLabel.text = "Successfully ordered!"
		}
	}

}


extension String {
	func isValidPhoneNumber() -> Bool {
		let regEx = "^\\+?77([0124567][0-8]\\d{7})$"
		let phoneCheck = NSPredicate(format: "SELF MATCHES[c] %@", regEx)
		return phoneCheck.evaluate(with: self)
	}
}
