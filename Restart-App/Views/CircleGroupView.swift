//
//  CircleGroupView.swift
//  Restart-App
//
//  Created by Sarath P on 07/07/22.
//

import SwiftUI

struct CircleGroupView: View {
    //MARK: PROPERTY
    
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        } //MARK: -ZSTACK

    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
        }
    }
}
