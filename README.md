Movies App
Example Project Idea

Four-paged movie list app.

Keywords

-MVVM
-Table view
-Codable
-SPM
-SnapKit
-Kingfisher
-Network Layer
-URLSession
-Singleton
-UserDefaults

Understanding Tab Bar and Navigation Controller
Understanding MVVM by separating logic between controller and view model
Learning to implement table view
Integrate third-party library
Build UI programmatically in controller
Using UserDefaults
Integrate network layer by URLSession
Using model(such as Movie) with Codable

Architecture

MVVM.
Using protocols to pass the data from the network layer to the screen

Language / Framework

Swift with UIKit
Responsive Design

Integrate SnapKit to build UI programmatically. No need to use any Storyboard or xib files
Use table view in the list screen
Download movie images via Kingfisher

Logic

The search and filter mechanism in the list screen must work without   blocking UI
Implement Codable to your Movie model and store movies as an array in a singleton object
Store bookmarked movies in the UserDefaults as an array
