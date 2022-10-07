//
//  MissionView.swift
//  Moonshot
//
//  Created by agnezi.io on 01/10/22.
//

import SwiftUI

struct MissionView: View {
	
	let mission: Mission
	let crew: [Crew]
	
	var body: some View {
		GeometryReader { geo in
			ScrollView {
				VStack {
					Image(mission.image)
						.resizable()
						.scaledToFit()
						.frame(maxWidth: geo.size.width * 0.7)
						.padding(.top)
					
					
					VStack(alignment: .leading) {
						
						Rectangle()
							.frame(height: 2)
							.foregroundColor(.lightBackground)
							.padding(.vertical)
						
						Text("Mission Highlights")
							.font(.title).bold()
							.padding(.bottom, 0)
						
						HStack(alignment: .center) {
							Text("Launch Date: ")
								.bold()
							Text(mission.formattedLaunchDate)
								.font(.footnote)
								.foregroundColor(.secondary)
						}
						.padding(.bottom, 5)
						
						Text(mission.description)
					}
					.padding(.horizontal)
					
					ScrollCrewComponent(crew: crew)
					
				}
				.padding(.bottom)
			}
		}
		.navigationTitle(mission.displayName)
		.navigationBarTitleDisplayMode(.inline)
		.background(.darkBackground)
	}
	
	init(mission: Mission, astronauts: [String:Astronaut]) {
		self.mission = mission
		self.crew = mission.crew.map { member in
			if let astronaut = astronauts[member.name] {
				return Crew(role: member.role, astronaut: astronaut)
			} else {
				fatalError("Missing \(member.name)")
			}
		}
	}
}

struct MissionView_Previews: PreviewProvider {
	static let missions: [Mission] = Bundle.main.decode("missions.json")
	static let astronauts: [String:Astronaut] = Bundle.main.decode("astronauts.json")
	
	static var previews: some View {
		MissionView(mission: missions[0], astronauts: astronauts)
			.preferredColorScheme(.dark )
	}
}
