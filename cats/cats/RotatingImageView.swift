//
//  RotatingImageView.swift
//  cats
//
//  Created by user on 11/20/23.
//

import UIKit

final class RotatingImageView: UIImageView {

    private var rotation: CABasicAnimation?

    func startRotating(duration: Double = 1) {
        guard layer.animation(forKey: "rotationAnimation") == nil else { return }

        rotation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation?.toValue = 2 * Double.pi
        rotation?.duration = duration
        rotation?.isCumulative = true
        rotation?.repeatCount = .greatestFiniteMagnitude

        layer.add(rotation!, forKey: "rotationAnimation")
    }

    func stopRotating() {
        guard layer.animation(forKey: "rotationAnimation") != nil else { return }

        layer.removeAnimation(forKey: "rotationAnimation")
        isHidden = true
    }
}

