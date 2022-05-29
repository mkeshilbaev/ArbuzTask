//
//  Watermelon.swift
//  Arbuz
//
//  Created by Madi Keshilbayev on 28.05.2022.
//

import Foundation

enum status {
	case ripe, notRipe, plucked
}

struct Watermelon {
	var spawn: String
	var weight: Double
	var isSliced: Bool = false
	var slicingPrice: Double = 250.0
	var status: status
	var description: String = "Казахстанский арбуз выращенный в пригороде Алматы местными фермерами"
	var pricePerKilo = 200.0
}
