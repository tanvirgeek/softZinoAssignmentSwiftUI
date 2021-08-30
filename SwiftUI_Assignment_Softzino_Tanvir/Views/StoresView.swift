//
//  StoresView.swift
//  SwiftUI_Assignment_Softzino_Tanvir
//
//  Created by MD Tanvir Alam on 28/8/21.
//

import SwiftUI
import Kingfisher

struct StoresView: View {
    @StateObject private var storesVM = StoresViewModel()
    var body: some View {

        List{
            ForEach(storesVM.stores){ store in
                VStack{
                    NavigationLink(destination: StoreDetailView(store: store)) {
                        StoreCard(store: store)
                    }
                }
            }
        }.navigationTitle("Apple Stores")
    }
}

struct StoresView_Previews: PreviewProvider {
    static var previews: some View {
        StoresView()
    }
}
