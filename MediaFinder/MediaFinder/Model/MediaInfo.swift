//
//  MediaInfo.swift
//  MediaFinder
//
//  Created by Tyler Averette on 2/12/24.
//

import Foundation

class MediaInfo {
    var title: String
    var platforms: [String]
    
    init(title: String, platforms: [String]) {
        self.title = title
        self.platforms = platforms
    }
    
    static func addSampleData() -> [MediaInfo]{
        let vikings: MediaInfo = MediaInfo(title: "Vikings", platforms: ["Hulu", "Amazon Prime","Peacock", "Google Play Movies", "Apple TV", "Youtube"])
        let halo: MediaInfo = MediaInfo(title: "Halo", platforms: ["Paramount +", "The Roku Channel","Hulu", "Amazon Prime Video", "Apple TV", "Vudu", "Sling TV", "YouTube", "Fubo", "YouTube TV", "Google Play Movies"])
        let bigBangTheory: MediaInfo = MediaInfo(title: "Big Bang Theory", platforms: ["Hulu", "Amazon Prime","HBO Max", "Google Play Movies", "Apple TV", "Youtube", "YouTube TV", "Vudu", "Sling TV", "TBS"])
        let southPark: MediaInfo = MediaInfo(title: "South Park", platforms: ["Max", "Philo", "Sling TV", "YouTube TV, Google Play Movies", "Pluto TV", "Hulu", "Amazon Prime Video", "Apple TV", "Vudu"])
        let theLastKingdom: MediaInfo = MediaInfo(title: "The Last Kingdom", platforms: ["Netflix", "Google Play Movies", "Vudu", "YouTube", "Apple TV", "Amazon Prime Video"])
        let peakyBlinders: MediaInfo = MediaInfo(title: "Peaky Blinders", platforms: ["Netflix", "Apple TV", "Amazon Prime Video"])
        let macGyver: MediaInfo = MediaInfo(title: "MacGyver", platforms: ["Paramount +", "Youtube", "Google Play Movies", "Vudu", "Amazon Prime Video", "The Roku Channel", "Apple TV"])
        let hunterXHunter: MediaInfo = MediaInfo(title: "Hunter x Hunter", platforms: ["Hulu", "Crunchyroll", "YouTube TV", "Apple TV", "Funimation", "Amazon Prime Video", "Google Play Movies", "Vudu "])
        let attackOnTitan: MediaInfo = MediaInfo(title: "Attack On Titan", platforms: ["Hulu", "Amazon Prime","Peacock", "Google Play Movies", "Apple TV", "Youtube"])
        let theOneHundred: MediaInfo = MediaInfo(title: "The 100", platforms: ["Netflix", "Google Play Movies", "Apple TV", "Youtube", "Vudu", "Amazon Prime Video"])
        
        let allMedia: [MediaInfo] = [vikings, halo, bigBangTheory, southPark, theLastKingdom, peakyBlinders, macGyver, hunterXHunter, attackOnTitan, theOneHundred]
        
        return allMedia
    }
    
    func platformsToString(element media: MediaInfo) -> String{
        var result: String = ""
        for content in media.platforms {
            result += "\(content), "
        }
        return result
    }
    
}
