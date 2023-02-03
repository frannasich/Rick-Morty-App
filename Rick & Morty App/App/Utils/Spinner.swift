//
//  Spinner.swift
//  Rick & Morty App
//
//  Created by Francisco Tomas Nasich on 02/02/2023.
//

import UIKit

var vSpinner: UIView?
var spinnerColor: UIColor?

extension UIViewController {

    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = .black
        let ai = UIActivityIndicatorView.init(style: .large)
        ai.color = spinnerColor ?? .white
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
            vSpinner = spinnerView
        }
    }
    
    func removeSpinner() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}
