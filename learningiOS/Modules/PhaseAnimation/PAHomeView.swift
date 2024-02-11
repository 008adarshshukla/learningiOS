//
//  PAHomeView.swift
//  learningiOS
//
//  Created by Adarsh Shukla on 11/02/24.
//

import SwiftUI

enum AnimationPhase: CaseIterable {
    case beginning, middle, end
    
    var opacity: Double {
        switch self {
            case .beginning: 1.0
            case .middle: 0.5
            case .end: 1.0
        }
    }
    
    var scale: Double {
        switch self {
            case .beginning, .end: 1.0
            case .middle: 1.5
        }
    }
    
    var animation: Animation {
        switch self {
            case .beginning, .end: .bouncy(duration: 0.5)
            case .middle: .easeInOut(duration: 1.0)
        }
    }
}

struct PAHomeView: View {
    var body: some View {
        NavigationStack {
            Form{
                Section{
                    Text("Example 1").font(.caption)
                    Image(systemName: "heart.fill")
                        .font(.system(size: 100))
                        .foregroundStyle(.red)
                        .phaseAnimator(AnimationPhase.allCases) { content, phase in
                            content
                                .opacity(phase.opacity)
                                .scaleEffect(phase.scale)
                        } animation: { phase in
                            phase.animation
                        }
                }
                Section {
                    Text("Example 2").font(.caption)
                    Image(systemName: "timelapse")
                        .foregroundStyle(.blue)
                        .phaseAnimator(AnimationPhase2.allCases) { content, phase in
                            content
                                .scaleEffect(phase.scale)
                                .offset(y: phase.verticalOffset)
                                .opacity(phase.opacity)
                        } animation: { phase in
                            phase.animation
                        }
                        .offset(y: 100)
                        .frame(height: 100)
                }
            }
            .navigationTitle("Animation Phases")
        }
    }
}

#Preview {
    PAHomeView()
}

enum AnimationPhase2: CaseIterable {
    case initial, move, scale
    
    var verticalOffset: Double {
        switch self {
            case .initial: 0
            case .move, .scale: -100
        }
    }
    
    var scale: Double {
        switch self {
            case .initial: 1.0
            case .move: 3.0
            case .scale: 15.0
        }
    }
    
    var opacity: Double {
        switch self {
            case .initial, .move: 1.0
            case .scale: 0
        }
    }
    
    var animation: Animation {
        switch self {
            case .initial: .smooth
            case .move: .easeInOut(duration: 0.5)
            case .scale: .bouncy(duration: 1.0)
        }
    }
}
