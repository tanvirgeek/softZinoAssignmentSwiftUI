//
//  StoresViewModel.swift
//  SwiftUI_Assignment_Softzino_Tanvir
//
//  Created by MD Tanvir Alam on 28/8/21.
//

import Foundation
import SwiftUI

class StoresViewModel:ObservableObject{
    
    @Published var stores = [StoreViewModel]()
    @Published var isLoading = true
    
    init(){
        self.getStores()
    }
    //self?.stores = result.results.map(FriendViewModel.init)
    func getStores(){
        let data = LocalFileServices.shared.readLocalFile(forName: "list")
        if let data = data{
            let storesFromJson = LocalFileServices.shared.parse(jsonData: data)
            self.stores = storesFromJson.map(StoreViewModel.init)
        }
        
    }
}

//This is a viewmodel for a single store. We can modify the incomming data here
class StoreViewModel:Identifiable{
    var id = UUID()
    var store:ListModel
    init(store:ListModel){
        self.store = store
    }
    var storeNo:String {
        return store.storeName
    }
    var storeName:String{
        return store.storeName
    }
    var addressLine: String{
        return store.addressDetails.addressLine
    }
    var cityName:String{
        return store.addressDetails.cityName
    }
    var countryName:String{
        return store.addressDetails.countryName
    }
    var zipcode:String{
        return store.addressDetails.zipCode ?? "No Zip Code"
    }
    var openHours:[OpenHour]{
        return store.openHours
    }
    var addressDetail: AddressDetails{
        return store.addressDetails
    }
    var flagShipName:String{
        return store.flagshipName ?? "No Flagship Name"
    }
    var regionName:String{
        return store.regionName ?? "No region Name"
    }
    var geoCode:Int?{
        return store.geoCodee
    }
    var shoppingCenterName:String{
        return store.shoppingCenterName
    }
    var storeImageURL:String{
        return store.storePhotoURL
    }
}
