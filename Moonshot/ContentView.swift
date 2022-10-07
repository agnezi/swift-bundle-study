//
//  ContentView.swift
//  Moonshot
//
//  Created by agnezi.io on 27/09/22.
//

import SwiftUI

struct ContentView: View {
	enum VisibilityMode {
		case grid, list
	}
	
	@State private var visibilityMode: VisibilityMode = .grid
	
	let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
	let missions: [Mission] = Bundle.main.decode("missions.json")
	
	let columns = [
		GridItem(.adaptive(minimum: 150)),
	]
	
	
	var body: some View {
		NavigationView {
			Group {
				if visibilityMode == .list {
				
					List {
						ForEach(missions) { mission in
							NavigationLink {
								MissionView(mission: mission, astronauts: astronauts)
							} label : {
								HStack {
									Image(mission.image)
										.resizable()
										.scaledToFit()
										.frame(width:30, height: 30)
									Text(mission.displayName)
								}
							}
						}
					}.background(.darkBackground)
					
				} else {
					
					ScrollView {
						LazyVGrid(columns: columns) {
							ForEach(missions) { mission in
								NavigationLink {
									MissionView(mission: mission, astronauts: astronauts)
								} label: {
									VStack {
										Image(mission.image)
											.resizable()
											.scaledToFit()
											.frame(width: 100, height: 100)
											.padding()
										
										
										VStack {
											Text(mission.displayName)
												.font(.headline)
												.foregroundColor(.white)
											
											Text(mission.formattedLaunchDate)
												.font(.caption)
												.foregroundColor(.white.opacity(0.5))
										}
										.padding(.vertical)
										.frame(maxWidth: .infinity)
										.background(.lightBackground)
									}
									.clipShape(RoundedRectangle(cornerRadius: 10))
									.overlay {
										RoundedRectangle(cornerRadius: 10)
											.stroke(.lightBackground)
									}
								}
							}
						}
						.padding([.horizontal, .bottom])
					}
					.navigationTitle("Moonshot")
					.background(.darkBackground)
					.preferredColorScheme(.dark)
					.navigationBarBackButtonHidden(true)
				}
			}
		}
		.toolbar {
			Button(visibilityMode == .grid ? "List" : "Grid", action: {toggleVisibilityMode()} )
		}
	}
	
	func toggleVisibilityMode() {
		if visibilityMode == .grid {
			visibilityMode = .list
		} else {
			visibilityMode = .grid
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
