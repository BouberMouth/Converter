//
//  Arrow.swift
//  Converter
//
//  Created by Antoine on 16/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//
//          6________5
//          |       |
//          |       |
//   1_____7|       |4_____3
//    \                   /
//     \                 /
//      \               /
//       \             /
//        \           /
//         \         /
//          \       /
//           \     /
//            \   /
//             \ /
//              2
//
// 1 -> leftCorner
// 2 -> bottomCorner
// 3 -> rightCorner
// 4 -> rightL
// 5 -> rightTop
// 6 -> leftTop
// 7 -> leftL

import SwiftUI

struct Arrow: Shape {
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY/2)
        let widthRatio: CGFloat = 40/100
        let widthRadius = rect.width * widthRatio / 2
        
        let leftCorner = CGPoint(x: 0, y: center.y)
        let bottomCorner = CGPoint(x: center.x, y: rect.maxY)
        let rightCorner = CGPoint(x: rect.maxX, y: center.y)
        let rightL = CGPoint(x: center.x + widthRadius, y: center.y)
        let rightTop = CGPoint(x: center.x + widthRadius, y: rect.minY)
        let leftTop = CGPoint(x: center.x - widthRadius, y: rect.minY)
        let leftL = CGPoint(x: center.x - widthRadius, y: center.y)
        
        var p = Path()
        p.move(to: leftCorner)
        p.addLine(to: bottomCorner)
        p.addLine(to: rightCorner)
        p.addLine(to: rightL)
        p.addLine(to: rightTop)
        p.addLine(to: leftTop)
        p.addLine(to: leftL)
        p.addLine(to: leftCorner)
        
        
        return p
    }
}
