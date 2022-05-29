//
//  DataManager.swift
//  Arbuz
//
//  Created by Madi Keshilbayev on 28.05.2022.
//

import Foundation


class DataManager {
	var basketSum: Double = 0

	var products: [Watermelon] = [
		Watermelon.init(spawn: "Almaty", weight: 10.5, isSliced: false, status: .ripe),
		Watermelon.init(spawn: "Almaty", weight: 7.2, isSliced: false, status: .notRipe),
		Watermelon.init(spawn: "Almaty", weight: 10.0, isSliced: false, status: .plucked),
		Watermelon.init(spawn: "Oskemen", weight: 17.4, isSliced: false, status: .plucked)
	]

	var filteredProducts: [Watermelon] { products.filter { $0.status == .plucked }}
}
