//
//  FrameworkTitleCell.swift
//  Apple-Frameworks
//
//  Created by RaulF on 30/7/21.
//

import SwiftUI

struct FrameworkTitleCell: View {
    let framework: Framework
    
    var body: some View {
        HStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 70, height: 70)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
                .padding()
        }
    }
}

struct FrameworkTitleCell_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkTitleCell(framework: MockData.sampleFramework)
        .preferredColorScheme(.dark)
    }
}
