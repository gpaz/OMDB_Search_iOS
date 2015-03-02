//
//  QueryResultsController.swift
//  OMDbSearch
//
//  Created by Galo Paz on 3/1/15.
//  Copyright (c) 2015 Galo Paz. All rights reserved.
//

import UIKit



class QueryResultsController: UIViewController
{
    
    var mOMDb: OMDbObject?
    
    @IBOutlet var mPoster: UIImageView!
    @IBOutlet var mTitle: UILabel!
    @IBOutlet var mYear: UILabel!
    @IBOutlet var mReleased: UILabel!
    @IBOutlet var mRuntime: UILabel!
    @IBOutlet var mRated: UILabel!
    @IBOutlet var mGenre: UILabel!
    @IBOutlet var mDirector: UILabel!
    @IBOutlet var mWriter: UILabel!
    @IBOutlet var mActors: UILabel!
    @IBOutlet var mPlot: UILabel!
    @IBOutlet var mLanguage: UILabel!
    @IBOutlet var mConutry: UILabel!
    @IBOutlet var mAwards: UILabel!
    @IBOutlet var mMetascore: UILabel!
    @IBOutlet var mIMDBRating: UILabel!
    @IBOutlet var mIMDBVotes: UILabel!
    @IBOutlet var mIMDBId: UILabel!
    
    @IBOutlet var mTomatoMeter: UILabel!
    @IBOutlet var mTomatoRating: UILabel!
    @IBOutlet var mTomatoReviews: UILabel!
    @IBOutlet var mTomatoFresh: UILabel!
    @IBOutlet var mTomatoRotten: UILabel!
    @IBOutlet var mTomatoConcensus: UILabel!
    @IBOutlet var mTomatoUserMeter: UILabel!
    @IBOutlet var mTomatoUserRating: UILabel!
    @IBOutlet var mTomatoUserReviews: UILabel!
    @IBOutlet var mDVD: UILabel!
    @IBOutlet var mBoxOfficeRevenue: UILabel!
    @IBOutlet var mProduction: UILabel!
    @IBOutlet var mWebsite: UILabel!
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadContents()
    }
    
    private func loadContents()
    {
        if let omdb = mOMDb?
        {
            if let s = omdb.poster?
            {
                let imageUrl = NSURL(string: s)
                let request = NSURLRequest(URL: imageUrl!)
                NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()){(response, data, error) in
                    if let unwrappedData = data?
                    {
                        self.mPoster.image = UIImage(data: data)
                    }
                }
            }
            if let s = omdb.title
            {
                mTitle.text = s
            }
            if let s = omdb.year
            {
                mYear.text = String(s)
            }
            if let s = omdb.directors
            {
                mDirector.text = joinWithSeparator(s, separator: ", ")
            }
            if let s = omdb.imdbId
            {
                mIMDBId.text = s
            }
            if let s = omdb.rated
            {
                mRated.text = s
            }
            if let s = omdb.genres
            {
                mGenre.text = joinWithSeparator(s, separator: ", ")
            }
            if let s = omdb.runtimeMins
            {
                mRuntime.text = "\(s) mins"
            }
            if let s = omdb.tomatoRatings.boxOfficeRevenueMillions
            {
                mBoxOfficeRevenue.text = "$\(s) Mil"
            }
            if let s = omdb.imdbRating
            {
                mIMDBRating.text = "\(s)"
            }
            if let s = omdb.tomatoRatings.tomatoRating
            {
                mTomatoRating.text = "\(s)"
            }
            if let s = omdb.plot
            {
                mPlot.text = s
            }
            mPlot.sizeToFit()
            if let s = omdb.tomatoRatings.tomatoConsensus
            {
                mTomatoConcensus.text = s
            }
            mTomatoConcensus.sizeToFit()
            /*
            if let s = omdb.
            {
                m.text =
            }
            if let s = omdb.
            {
                m.text =
            }
            if let s = omdb.
            {
                m.text =
            }
            if let s = omdb.
            {
                m.text =
            }
            */
        }
    }
    
    @IBAction func newQuery()
    {
        dismissViewControllerAnimated(true, completion: nil)
	}
    
    func joinWithSeparator(array: Array<String>, separator: String) -> String
    {
        var joined: String = ""
        let count = array.count
            
        for(var i = 0; i < count; i++)
        {
            joined += array[i]
            if(i != count-1)
            {
                joined += separator
            }
        }
        
        return joined
    }
    
}

















