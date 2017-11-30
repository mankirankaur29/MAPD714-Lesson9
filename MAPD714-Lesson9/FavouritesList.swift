//
//  FavouritesList.swift
//  MAPD714-Lesson9
//
//  Created by Mankiran kaur on 2017-11-29.
//  Copyright © 2017 Centennial College. All rights reserved.
//

import Foundation
import UIKit

class FavouritesList{
    //private instance variables
    static let sharedFavousitesList = FavouritesList()
    private(set) var favourites:[String]
    
    //constructor
    init(){
        let defaults = UserDefaults.standard  //userdefaults is class
        let storedFavourites = defaults.object(forKey: "favourites") as? [String]  //for storing data without database
        favourites = storedFavourites != nil ? storedFavourites! : []
        
    }
    
    //this method adda a font to the user preference files
    func addFavourite(fontName:String){
        if !favourites.contains(fontName)
        {
            favourites.append(fontName)
            saveFavourites()
        }
    }
    
    // this method saves font favourites to the user prefrence file
    private func saveFavourites(){
        let defaults =  UserDefaults.standard
        defaults.set(favourites,forKey:"favourites")
        defaults.synchronize()
    }
    
    //this method removes favourite font from user preference file
    func removeFavourite(fontName: String){
        
        if let index = favourites.index(of: fontName){
            favourites.remove(at: index)
            saveFavourites()
        }
    }
    
    
    
    
    
    
}
