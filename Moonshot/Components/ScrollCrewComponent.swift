//
//  ScrollCrewView.swift
//  Moonshot
//
//  Created by agnezi.io on 03/10/22.
//

import SwiftUI

struct ScrollCrewComponent: View {
	let crew: [Crew]
	
	var body: some View {
		VStack(alignment: .leading) {
			
			Rectangle()
				.frame(height: 2)
				.foregroundColor(.lightBackground)
				.padding()
			
			Text("Crew")
				.font(.title).bold()
				.padding(.bottom, 5)
				.padding(.horizontal)
			
			ScrollView(.horizontal, showsIndicators: false) {
				HStack {
					ForEach(crew, id: \.role) { crewMember in
						NavigationLink {
							AstronautView(astronaut: crewMember.astronaut)
						} label: {
							HStack {
								Image(crewMember.astronaut.id)
									.resizable()
									.frame(width: 104, height: 72)
									.clipShape(Capsule()									)
									.overlay(
										Capsule()
											.strokeBorder(.white, lineWidth: 1)
									)
								
								VStack(alignment: .leading) {
									Text(crewMember.astronaut.name)
										.foregroundColor(.white)
										.font(.headline)
									
									Text(crewMember.role)
										.foregroundColor(.secondary)
								}
							}
							.padding(.horizontal)
						}
					}
				}
			}
		}
	}
}

struct ScrollCrewView_Previews: PreviewProvider {
	static let astronauts: [String:Astronaut] = Bundle.main.decode("astronauts.json")
	
	static var previews: some View {
		ScrollCrewComponent(crew: [
			Crew(role: "Commander",
					 astronaut: astronauts["grissom"]!
					)
		])
			.preferredColorScheme(.dark)
	}
}
