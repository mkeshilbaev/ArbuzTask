//
//  ViewController.swift
//  Arbuz
//
//  Created by Madi Keshilbayev on 28.05.2022.
//

/*
Представьте, что компания Arbuz.kz решила запустить новый продукт – онлайн-заказ арбузов с грядки у фермера.

Какие минимально необходимые возможности должны быть у продукта:

– выбрать ряд и место на грядке, с которого нужно сорвать арбуз;
– проверить статус арбуза: неспелый, спелый, уже сорван;
 
– учитывать, что вес у арбузов может быть разным;
– указать количество, от 1 до 3 штук;
– заказать опциональную услугу “Порезать дольками”.

 – указать адрес доставки и телефон заказчика;
 – выбрать дату и время доставки (не далее 9 дней от текущей даты)

Ваша задача:

Разработать форму заказа арбуза в приложении на iOS: сверстать экран с формой заказа, добавить валидацию полей, удобно и
эстетично оформить экран, соблюдая гайдлайны платформы.
*/

import UIKit

class ViewController: UIViewController {

	var isAdded: Bool = false
	private var dataManager = DataManager()
	private var basketSum = DataManager().basketSum
	
	@IBOutlet var productImageView: UIImageView!

	@IBOutlet var productNameLabel: UILabel!
	@IBOutlet var productPriceLabel: UILabel!
	@IBOutlet var productDescriptionLabel: UILabel!
	@IBOutlet var totalSumLabel: UILabel!
	@IBOutlet var productCountLabel: UILabel!
	@IBOutlet var productWeightLabel: UILabel!

	@IBOutlet var changeCountButton: UIStepper!
	@IBOutlet var changeWeightButton: UIStepper!
	@IBOutlet var makeOrderButton: UIButton!
	@IBOutlet var makeSclicingButton: UIButton!

	override func viewDidLoad() {
		super.viewDidLoad()
		setupElements()
	}

	private func setupElements(){
		makeOrderButton.layer.cornerRadius = 20

		changeCountButton.maximumValue = 3
		changeCountButton.minimumValue = 1

		changeWeightButton.minimumValue = 5
		changeWeightButton.maximumValue = 15
		changeWeightButton.stepValue = 5

		productPriceLabel.text = "KZT \(Int(dataManager.products[0].pricePerKilo)) x кг"
		productDescriptionLabel.text = dataManager.products[0].description

		productCountLabel.text = "1 шт"
		productWeightLabel.text = "10 кг"

		basketSum = Double(dataManager.products[0].pricePerKilo) * (Double(productWeightLabel.text?.trimmingCharacters(in: .letters).trimmingCharacters(in: .whitespaces) ?? "10") ?? 0.0) * (Double(productCountLabel.text?.trimmingCharacters(in: .letters).trimmingCharacters(in: .whitespaces) ?? "1") ?? 0.0)
		totalSumLabel.text = "KZT \(basketSum)"

		makeSclicingButton.setImage(.add, for: .normal)
	}

	@IBAction func changeCountButtonTapped(_ sender: UIStepper) {
		productCountLabel.text = "\(Int(sender.value)) шт"
		basketSum =  Double(dataManager.products[0].pricePerKilo) * (Double(productWeightLabel.text?.trimmingCharacters(in: .letters).trimmingCharacters(in: .whitespaces) ?? "0") ?? 0.0) * Double(sender.value)
		totalSumLabel.text = "KZT \(basketSum)"
	}

	@IBAction func changeWeightButton(_ sender: UIStepper) {
		productWeightLabel.text = "\(Int(sender.value)) кг"
		basketSum =  Double(dataManager.products[0].pricePerKilo) * (Double(productCountLabel.text?.trimmingCharacters(in: .letters).trimmingCharacters(in: .whitespaces) ?? "0") ?? 0.0) * Double(sender.value)
		totalSumLabel.text = "KZT \(basketSum)"
	}

	@IBAction func makeSlicesButtonTapped(_ sender: UIButton) {
		sender.setImage(.checkmark, for: .normal)

		if isAdded {
			isAdded = false
			sender.setImage(.add, for: .normal)
			totalSumLabel.text = "KZT \((Double(totalSumLabel.text?.trimmingCharacters(in: .letters).trimmingCharacters(in: .whitespaces).trimmingCharacters(in: .symbols) ?? "0") ?? 0.0) - dataManager.products[0].slicingPrice)"
		}
		else{
			isAdded = true
			sender.setImage(.checkmark, for: .normal)
			totalSumLabel.text = "KZT \((Double(totalSumLabel.text?.trimmingCharacters(in: .letters).trimmingCharacters(in: .whitespaces).trimmingCharacters(in: .symbols) ?? "0") ?? 0.0) + dataManager.products[0].slicingPrice)"
		}
	}
	
	@IBAction func orderButtonTapped(_ sender: UIButton) {
	}
}

