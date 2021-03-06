//
//  Constant.swift
//  Movies
//
//  Created by TarıkOzturk on 2.07.2022.
//

import UIKit

enum CellIdent {
    static let movieCell = "MovieCell"
    static let bookmarkCell = "BookmarkCell"
}

enum ViewSymbols {
    static let display = "display"
    static let book = "book"
    static let star = "star"
    static let starFill = "star.fill"
}

enum CustomColor {
    static let backGroundColor = UIColor(named: "BackgroundColor")
    static let textColor = UIColor(named: "TextColor")
    static let titleColor = UIColor(named: "TitleColor")
    static let contentViewColor = UIColor(named: "ContentColor")
    static let rateColor = UIColor(named: "RateColor")
}

enum ErrorCode {
    static let dataTaskError = "DataTask error:"
    static let responseError =  "Empty Response"
    static let responseStatusCode = "Response status code:"
    static let emptyData = "Empty Data"
    static let errorProcessingJson = "Error processing json data:"
    static let fatalInitError = "init(coder:) has not been implemented"
}

enum Titles {
    static let appTitle = NSLocalizedString("Movies", comment: "App title")
    static let movieTabTitle = NSLocalizedString("Movies", comment: "Tabbar movies button")
    static let bookMarkTabTitle =  NSLocalizedString("Bookmarks", comment: "Tabbar bookmark button")
    static let moviesViewTitle = NSLocalizedString("Movies You Looking For ?", comment: "MoviesView Navigation Title")
    static let bookmarkViewTitle = NSLocalizedString("Your Favourite Movies",
                                                     comment: "BookmarkView Navigation Title")
    static let detailReleaseTitle = NSLocalizedString("Release Date:",
                                                      comment: "MovieDetailView relase date text title")
    static let detailRateTitle = NSLocalizedString("Rate:",
                                                   comment: "MovieDetailView rate text title")
}

enum Texts {
    static let searchBarPlaceHolderText = NSLocalizedString("Enter the movie name",
                                                            comment: "Searchbar Placeholder text")
}
