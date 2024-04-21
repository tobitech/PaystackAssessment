//
//  PaystackAssessmentTests.swift
//  PaystackAssessmentTests
//
//  Created by Oluwatobi Omotayo on 20/04/2024.
//

import XCTest
@testable import PaystackAssessment

@MainActor
final class PaystackAssessmentTests: XCTestCase {
	
	var model: CharactersModel!
	
	override func setUp() {
		model = CharactersModel(
			apiService: MockAPIService(
				characters: [
					.rick, .gomez
				]
			)
		)
	}
	
	func testSearchCharacterFlow() async throws {
		await model.getCharacters()
		
		XCTAssertEqual(model.characters[0].name, "Rick Sanchez")
		XCTAssertEqual(model.filteredCharacters[0].name, "Rick Sanchez")
		
		model.queryChanged("Rick")
		XCTAssertEqual(model.characters[0].name, "Rick Sanchez")
		XCTAssertEqual(model.filteredCharacters[0].name, "Rick Sanchez")
		
		model.queryChanged("Ricky")
		XCTAssertEqual(model.characters[0].name, "Rick Sanchez")
		XCTAssertEqual(model.filteredCharacters[0].name, "Ricky Gomez")
		
		model.queryChanged("")
		XCTAssertEqual(model.characters[0].name, "Rick Sanchez")
		XCTAssertEqual(model.filteredCharacters[0].name, "Rick Sanchez")
		
		model.queryChanged("4343pwo")
		XCTAssertEqual(model.characters[0].name, "Rick Sanchez")
		XCTAssertEqual(model.filteredCharacters.count, 0)
	}
	
}
