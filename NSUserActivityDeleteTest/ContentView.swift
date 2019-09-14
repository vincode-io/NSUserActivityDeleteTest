//
//  ContentView.swift
//  NSUserActivityDeleteTest
//
//  Created by Maurice Parker on 9/14/19.
//  Copyright © 2019 Vincode, Inc. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	
	@State var activity: NSUserActivity? = nil
	
    var body: some View {
		VStack {
			Spacer()
			Button(action: { self.createActivity() }) {
				Text("Create Activity")
			}
			Divider().frame(width: 100.0, height: 1.0, alignment: .center)
			Button(action: { self.deleteActivity() }) {
				Text("Delete Activity")
			}
			Spacer()
		}
    }

	func createActivity() {
		activity = NSUserActivity(activityType: "io.vincode.NSUserActivityDeleteTest.TestActivity")
		activity!.title = "NSUserActivity Delete Test"
		activity!.keywords = Set(["NSUserActivity"])
		activity!.isEligibleForPrediction = true
		activity!.isEligibleForSearch = true
		activity!.persistentIdentifier = "the.identifier.to.delete"
		activity!.becomeCurrent()
	}
	
	func deleteActivity() {
		activity?.invalidate()
		activity = nil
		NSUserActivity.deleteSavedUserActivities(withPersistentIdentifiers: ["the.identifier.to.delete"]) {}
	}
	
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
