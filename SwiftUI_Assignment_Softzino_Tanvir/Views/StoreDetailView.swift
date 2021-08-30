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
        VStack(alignment:.leading){
            KFImage(URL(string: store.storeImageURL))
                .resizable()
                .frame(width:UIScreen.main.bounds.width-20,height: 250)
                .aspectRatio(contentMode: .fit)
            
            Text(store.addressLine)
                .bold()
            
            Text(store.cityName)
                .bold()
            
            VStack(alignment:.leading){
                Text("Opening Hours")
                    .bold()
                VStack{
                    ForEach(0..<store.openHours.count, id: \.self){ index in
                        HStack{
                            makeDayView(dayCount: index)
                            Text(store.openHours[index].startingTime + " > " + store.openHours[index].closingTime)
                        }
                    }
                }.padding(.leading,20)
                .padding(.trailing,20)
                
            }
            Spacer()
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
        }
        
    }
}

//struct StoreDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        StoreDetailView()
//    }
//}
