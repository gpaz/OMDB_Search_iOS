//
//  OMDbObject.swift
//  OMDbSearch
//
//  Created by Galo Paz on 3/1/15.
//  Copyright (c) 2015 Galo Paz. All rights reserved.
//

import UIKit

class OMDbObject
{
    var title: String?
    var year: Int?
    var rated: String?
    var releaseDate: NSDate?
    var runtimeMins: Int?
    var genres: [String]?
    var directors: [String]?
    var writers: [String]?
    var actors: [String]?
    var plot: String?
    var languages: [String]?
    var countries: [String]?
    var awards: String?
    var poster: String?
    var metascore: Int?
    var imdbRating: Float?
    var imdbVotes: Int?
    var imdbId: String?
    var type: String?
    var response: Bool?
    var error: String?
    var tomatoRatings: RottenTomatoRatings
    
    init(jsonDict: NSDictionary)
    {
        title = jsonDict["Title"] as String?
        if var s = jsonDict["Year"] as String?
        {
            year = s.toInt()
        }
        rated = jsonDict["Rated"] as String?
        if var s = jsonDict["Released"] as String?
        {
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "dd LLL yyyy"
            releaseDate = dateFormatter.dateFromString(s)
        }
        if var s = jsonDict["Runtime"] as String?
        {
            var parts = s.componentsSeparatedByString(" ")
            if parts.count > 0
            {
                runtimeMins = parts[0].toInt()
            }

        }
        if var s = jsonDict["Genre"] as String?
        {
            genres = s.componentsSeparatedByString(", ")
        }
        if var s = jsonDict["Director"] as String?
        {
            directors = s.componentsSeparatedByString(", ")
        }
        if var s = jsonDict["Writer"] as String?
        {
            writers = s.componentsSeparatedByString(", ")
        }
        if var s = jsonDict["Actors"] as String?
        {
            actors = s.componentsSeparatedByString(", ")
        }
        plot = jsonDict["Plot"] as String?
        if var s = jsonDict["Language"] as String?
        {
            languages = s.componentsSeparatedByString(", ")
        }
        if var s = jsonDict["Country"] as String?
        {
            countries = s.componentsSeparatedByString(", ")
        }
        awards = jsonDict["Awards"] as String?
        poster = jsonDict["Poster"] as String?
        if var s = jsonDict["Metascore"] as String?
        {
            metascore = s.toInt()
        }
        if var s = jsonDict["imdbRating"] as String?
        {
            imdbRating = (s as NSString).floatValue
        }
        if var s = jsonDict["imdbVotes"] as String?
        {
            imdbVotes = s.stringByReplacingOccurrencesOfString(",", withString: "", options: nil, range: nil).toInt()
        }
        imdbId = jsonDict["imdbID"] as String?
        type = jsonDict["Type"] as String?
        if var s = jsonDict["Response"] as String?
        {
            response = (s as NSString).boolValue
        }
        error = jsonDict["Error"] as String?
        tomatoRatings = RottenTomatoRatings(jsonDict: jsonDict)
    }
    
}

class RottenTomatoRatings
{
    var tomatoMeter: Int?
    var tomatoImage: String?
    var tomatoRating: Float?
    var tomatoReviews: Int?
    var tomatoFresh: Int?
    var tomatoRotten: Int?
    var tomatoConsensus: String?
    var tomatoUserMeter: Int?
    var tomatoUserRating: Float?
    var tomatoUserReviews: Int?
    var dvdReleaseDate: NSDate?
    var boxOfficeRevenueMillions: Float?
    var production: String?
    var website: String?
    
    init(jsonDict: NSDictionary)
    {
        if var s = jsonDict["tomatoMeter"] as String?
        {
            tomatoMeter = s.toInt()
        }
        tomatoImage = jsonDict["tomatoImage"] as String?
        if var s = jsonDict["tomatoRating"] as String?
        {
            tomatoRating = (s as NSString).floatValue
        }
        if var s = jsonDict["tomatoReviews"] as String?
        {
            tomatoReviews = s.stringByReplacingOccurrencesOfString(",", withString: "", options: nil, range: nil).toInt()
        }
        if var s = jsonDict["tomatoFresh"] as String?
        {
            tomatoFresh = s.stringByReplacingOccurrencesOfString(",", withString: "", options: nil, range: nil).toInt()
        }
        if var s = jsonDict["tomatoRotten"] as String?
        {
            tomatoRotten = s.stringByReplacingOccurrencesOfString(",", withString: "", options: nil, range: nil).toInt()
        }
        tomatoConsensus = jsonDict["tomatoConsensus"] as String?
        if let s = jsonDict["tomatoUserMeter"] as String?
        {
            tomatoUserMeter = s.toInt()
        }
        if let s = jsonDict["tomatoUserRating"] as String?
        {
            tomatoUserRating = (s as NSString).floatValue
        }
        if let s = jsonDict["tomatoUserReviews"] as String?
        {
            tomatoUserReviews = s.stringByReplacingOccurrencesOfString(",", withString: "", options: nil, range: nil).toInt()
        }
        if let s = jsonDict["DVD"] as String?
        {
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "dd LLL yyyy"
            dvdReleaseDate = dateFormatter.dateFromString(s)
        }
        if let s = jsonDict["BoxOffice"] as String?
        {
            let floatStr = s.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: "$M"))
            boxOfficeRevenueMillions = (floatStr as NSString).floatValue
        }
        production = jsonDict["Production"] as String?
        website = jsonDict["Website"] as String?
    }
}