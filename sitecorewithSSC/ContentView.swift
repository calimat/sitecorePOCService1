//
//  ContentView.swift
//  sitecorewithSSC
//
//  Created by Oshyn on 12/3/19.
//  Copyright © 2019 Oshyn. All rights reserved.
//

import SwiftUI
import Alamofire
import SwiftyJSON


struct ContentView: View {
   @State private var response = "..."
    var body: some View {
    NavigationView {
        Form {
            Section {
                Text(self.response)
            }.onAppear { self.callService() }
        }}}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func callService() {
    //declare parameter as a dictionary which contains string as key and value combination. considering inputs are valid

    let parameters : Parameters = ["domain": "sitecore", "username": "admin", "password" : "b"]
   
   let urlString = "http://sc93new1sc.dev.local/-/item/v1/?sc_itemid=110D559F-DEA5-42EA-9C1C-8A5DF7E70EF9"
   
    let headers: HTTPHeaders = [
     "Content-Type": "application/json; charset=utf-8"
   ]
    
    if let url = URL(string: urlString) {
       URLSession.shared.dataTask(with: url) { data, response, error in
          if let data = data {
             if let jsonString = String(data: data, encoding: .utf8) {
                self.response = jsonString
                print(jsonString)
             }
           }
       }.resume()
    }
   
    }
  
   

}
