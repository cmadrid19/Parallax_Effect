//
//  Home.swift
//  ParallaxCarousel
//
//  Created by Maxim Macari on 4/12/20.
//

import SwiftUI

struct Home: View {
    
    @State var selected: Int = 0
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    var body: some View {
        TabView(selection: $selected){
            
            ForEach(1...7, id: \.self){ index in
                //Downsize the image, to imporove performance 200MB freed by this thecnic
                if let uiImage = UIImage(named: "p\(index)")?.resize(width: UIScreen.main.bounds.size.width + 200) {
                    
                    
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)){
                        //GeeomeetryReadere for parallax effect
                        GeometryReader{ geo in
                            
                            
                            Image(uiImage: uiImage)
                                .resizable()
                                //.aspectRatio(contentMode: .fill)
                                //moving viewe in opposite side
                                //when usre starts to swipe
                                //this will create parallax effect
                                .offset(x: -geo.frame(in: .global).minX)
                                .frame(width: width, height: height / 2)
                            
                            
                            
                            
                        }
                        .frame(height: height / 2)
                        .cornerRadius(15)
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(15)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: -5, y: -5)
                        //Decreasing width by padding
                        //so outer view only decreased
                        //inner image will be full width
                        
                        //bottom
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 55, height: 55)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                            .padding(5)
                            .background(Color.white)
                            .clipShape(Circle())
                            .offset(x: -15, y: 25)
                    }
                    .padding(.horizontal, 25)
                }
                
            }
        }
        //page tab view
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
        
    }
}
