//
//  ViewController.swift
//  MediaPicker
//
//  Created by Rasyadh Abdul Aziz on 03/10/20.
//  Copyright © 2020 Rasyadh Abdul Aziz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cropCircularSwitch: UISwitch!
    
    var isCropCircular: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        navigationItem.title = LocaleString.app
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .trash,
            target: self,
            action: #selector(onClearImage(_:)))
        
        clearImage()
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(onTapImageView(_:)))
        )
        cropCircularSwitch.isOn = isCropCircular
    }
    
    @objc private func onClearImage(_ sender: UIBarButtonItem) {
        clearImage()
    }
    
    @objc private func onTapImageView(_ sender: UITapGestureRecognizer) {
        openMediaPicker()
    }

    @IBAction func onChangeSwitch(_ sender: UISwitch) {
        isCropCircular = sender.isOn
        print("circle \(isCropCircular)")
    }
    
    private func clearImage() {
        imageView.image = UIImage(named: "add")
        imageView.contentMode = .center
    }
    
    private func openMediaPicker() {
        if isCropCircular {
            MediaPickerHelper.shared.setCropController(
                aspectRatio: .presetSquare,
                aspectRatioLocked: true,
                aspectRatioPickerHidden: true,
                cropCircular: isCropCircular)
        } else {
            MediaPickerHelper.shared.setCropController()
        }
        MediaPickerHelper.shared.showMediaOptions(viewController: self, sourceView: imageView)
        MediaPickerHelper.shared.imagePickedClosure = { [weak self] image in
            guard let s = self else { return }
            s.imageView.image = image
            s.imageView.contentMode = .scaleAspectFit
        }
    }
}

