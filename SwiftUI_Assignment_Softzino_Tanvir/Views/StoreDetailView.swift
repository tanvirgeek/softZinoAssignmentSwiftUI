//
//  StoreDetailView.swift
//  SwiftUI_Assignment_Softzino_Tanvir
//
//  Created by MD Tanvir Alam on 30/8/21.
//

import SwiftUI
import Kingfisher

struct StoreDetailView: View {
    
    let store:StoreViewModel
    
    var body: some View {
        ScrollView(){
            ZStack{
                Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1))
                VStack(alignment:.leading){
                    KFImage(URL(string: store.storeImageURL))
                        .resizable()
                        .frame(width:UIScreen.main.bounds.width-20,height: 250)
                        .aspectRatio(contentMode: .fit)
                    
                    Text(store.storeNo)
                        .bold()
                        .padding(7)
                    
                    Text(store.cityName)
                        .bold()
                        .padding(7)
                    
                    VStack(alignment:.leading){
                        Text("Opening Hours")
                            .bold()
                            .padding(7)
                        VStack(alignment:.leading){
                            ForEach(0..<store.openHours.count, id: \.self){ index in
                                HStack{
                                    makeDayView(dayCount: index)
                                    Text(store.openHours[index].startingTime + " > " + store.openHours[index].closingTime)
                                }
                            }
                        }.padding(.leading,20)
                        .padding(.trailing,20)
                        
                        
                        NavigationLink(destination: AddOpeningHourView(), label: {
                            Text("Add more opening hours")
                                .font(.system(size: 16,weight:.bold))
                                .padding(15)
                                .foregroundColor(.black)
                                .background(Color.white)
                                .cornerRadius(25)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color.white, lineWidth: 2)
                                )
                                .padding(.leading,20)
                        })

                    }
                    
                    VStack(alignment:.leading){
                        Text("Reviews")
                            .font(.system(size: 16,weight:.bold))
                            .padding()
                        ForEach(0..<3){ index in
                            VStack(alignment:.leading){
                                Text("User Name")
                                    .font(.system(size: 16,weight:.bold))
                                    .padding(10)
                                
                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ac fermentum ante. Morbi a turpis eu quam mattis condimentum. Sed dictum cursus ante, at efficitur nunc tempor et. Integer convallis sodales vestibulum. Maecenas tempor risus ut mi bibendum.")
                                    .padding(10)
                            }.padding(.leading,50)
                            .padding(.trailing,20)
                            .background(Color.white)
                            .cornerRadius(25)
                            .padding(15)
                            
                        }
                        
                        NavigationLink(destination: AddReviewView(), label: {
                            Text("Add Your Review")
                                .font(.system(size: 16,weight:.bold))
                                .padding()
                                .foregroundColor(.black)
                                .background(Color.white)
                                .cornerRadius(25)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color.white, lineWidth: 2)
                                )
                                .padding(15)
                        })
                    }
                    .padding(.top, 15)
                    Spacer()
                }
            }.navigationBarTitle("\(store.storeNo) - \(store.cityName)",displayMode: .inline)
            
        }
        
    }
    
    func makeDayView( dayCount:Int) -> Text{
        switch dayCount {
        case 1:
            return Text("Monday")
                .bold()
        case 2:
            return Text("Tuesday")
                .bold()
        case 3:
            return Text("Wednesday")
                .bold()
        case 4:
            return Text("Thursday")
                .bold()
        case 5:
            return Text("Friday")
                .bold()
        case 6:
            return Text("Saturday")
                .bold()
        default:
            return Text("Sunday")
                .bold()
            
        }
        
    }
}

//struct StoreDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        StoreDetailView()
//    }
//}
