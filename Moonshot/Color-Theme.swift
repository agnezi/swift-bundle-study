//
//  Color-Theme.swift
//  Moonshot
//
//  Created by agnezi.io on 01/10/22.
//

import Foundation
import SwiftUI

extension ShapeStyle where Self == Color {
	static var darkBackground: Color {
		Color(red: 0.1, green: 0.1, blue: 0.2)
	}
	
	static var lightBackground: Color {
		Color(red: 0.2, green: 0.2, blue: 0.3)
	}
}

public extension Color {
		static func random(randomOpacity: Bool = false) -> Color {
				Color(
						red: .random(in: 0...1),
						green: .random(in: 0...1),
						blue: .random(in: 0...1),
						opacity: randomOpacity ? .random(in: 0...1) : 1
				)
		}
}
