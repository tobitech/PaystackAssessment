//
//  RootView.swift
//  PaystackAssessment
//
//  Created by Oluwatobi Omotayo on 19/04/2024.
//

import SwiftUI

struct RootView: View {
	var body: some View {
		CharactersView(model: CharactersModel(apiService: LiveAPIService()))
	}
}

#Preview {
	RootView()
}
