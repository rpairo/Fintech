//
//  CircleProgressBar.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 17/1/21.
//

import SwiftUI

struct CircleProgressBar: View {
    // MARK: Properties
    @Binding var score: Score

    // MARK: View
    var body: some View {
        ZStack {
            ProgressBar(percent: $score.percent)
            ScoreText(value: $score.value, maxValue: $score.maxValue)
        }
    }
}

private struct ProgressBar: View {
    // MARK: Properties
    @Binding var percent: Float

    // MARK: View
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 2)
                .foregroundColor(.black)

            Circle()
                .trim(from: 0.0, to: CGFloat(min(percent, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                .foregroundColor(.orange)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.spring(response: 0.8, dampingFraction: 1.0, blendDuration: 1.0))
                .padding(10)
        }
    }
}

private struct ScoreText: View {
    // MARK: Properties
    @Binding var value: Int
    @Binding var maxValue: Int

    // MARK: View
    var body: some View {
        VStack {
            Text("Your credit score is")
                .font(.title2)

            Text("\(value)")
                .font(.largeTitle)
                .foregroundColor(.yellow)
                .fontWeight(.light)
                .padding(5)

            Text("out of \(maxValue)")
                .font(.title2)
        }
    }
}
