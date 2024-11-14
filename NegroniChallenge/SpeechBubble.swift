//
//  SpeechBubble.swift
//  NegroniChallenge
//
//  Created by Vincenzo Gerelli on 13/11/24.
//

import Foundation
import SwiftUI

struct SpeechBubble : Shape {
    let cornerRadius : CGFloat
    let isBottom : Bool
    let pointLocation : CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX+cornerRadius, y: rect.minY))
        
        //Top left corner
        path.addArc(center: CGPoint(x: rect.minX + cornerRadius, y:rect.minY+cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: -180), clockwise: true)
        
        //Left side of bubble
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY-cornerRadius))
        
        //Bottom Left Corner
        path.addArc(center: CGPoint(x: rect.minX + cornerRadius, y:rect.maxY-cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 90), clockwise: true)
        
        if (isBottom){
            path.addLine(to: CGPoint(x: pointLocation-10, y: rect.maxY))
            path.addLine(to: CGPoint(x: pointLocation, y: rect.maxY+10))
            path.addLine(to: CGPoint(x: pointLocation+10, y: rect.maxY))
        }
        
        //Bottom right corner
        path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y:rect.maxY-cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 0), clockwise: true)
        
        if(!isBottom){
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY+10))
            path.addLine(to: CGPoint(x: rect.maxX+10, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY-10))
        }
        
        //Right Side of bubble
        //path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY+cornerRadius))
        
        //Top Right Corner
        path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y:rect.minY+cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: -90), clockwise: true)
        
        //Top side of bubble
        path.addLine(to: CGPoint(x: rect.minX + cornerRadius, y: rect.minY))
        
        return path
    }
}
