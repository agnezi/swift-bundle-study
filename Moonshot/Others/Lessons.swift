//
//  ContentView.swift
//  Moonshot
//
//  Created by agnezi.io on 27/09/22.
//

import SwiftUI


struct User: Codable {
	let name: String
	let address: Address
}

struct Address: Codable {
	let street: String
	let city: String
}


struct CustomText: View {
	var text: String
	
	var body: some View {
		Text(text)
	}
	
	init(_ text: String) {
		self.text = text
	}
}

let layout = [
	GridItem(.fixed(80)),
	GridItem(.fixed(80)),
]

struct LessonsView: View {
	var body: some View {
		NavigationView{
			VStack {
				
				ScrollView {
					LazyVGrid(columns: layout) {
						ForEach(0..<100) {
							Text("Item \($0)")
						}
					}
				}
				
				
				
				
				
				Button("Decode JSON") {
					let input = """
{
 "name": "Jonas",
 "address": {
	"street": "Rua da Alegria",
	"city": "Cidade da Felicidade"
}
}
"""
					
					let data = Data(input.utf8)
					
					if let user = try? JSONDecoder().decode(User.self, from: data) {
						print(user.address.street)
						print(user.name)
					}
					
				}
				
				//MARK: NavigationView and NavigationLink
				List(0..<100) { row in
					NavigationLink {
						Text("Something")
					} label: {
						CustomText("Some Text \(row)")
					}
				}
				
				//MARK: GeometryReader
				GeometryReader { geo in
					VStack(alignment: .center) {
						Image("Javascript")
							.resizable()
							.scaledToFit()
							.frame(width: geo.size.width * 0.8)
					}
				}
				
				//MARK: ScrollView
				ScrollView {
					LazyVStack {
						ForEach(0..<100) { row in
							CustomText("Some Text \(row)")
						}
					}
				}
			}
			.padding()
		}
	}
}

struct LessonsView_Previews: PreviewProvider {
	static var previews: some View {
		LessonsView()
	}
}

