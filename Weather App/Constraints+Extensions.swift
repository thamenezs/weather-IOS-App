//
//  Constraints+Extensions.swift
//  Weather App
//
//  Created by Espezzialy Souza on 03/10/24.
//

import Foundation
import UIKit

extension UIView{
    func setConstraintsToParentView(_ parent: UIView){
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: parent.topAnchor),
            self.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: parent.bottomAnchor)
        ])
    }
}
