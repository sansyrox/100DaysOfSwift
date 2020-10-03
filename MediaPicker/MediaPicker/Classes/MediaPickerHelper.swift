//
//  MediaPickerHelper.swift
//  MediaPicker
//
//  Created by Rasyadh Abdul Aziz on 03/10/20.
//  Copyright © 2020 Rasyadh Abdul Aziz. All rights reserved.
//

import Foundation
import UIKit
import MobileCoreServices
import AVFoundation
import TOCropViewController
import Photos

class MediaPickerHelper: NSObject {
    static let shared = MediaPickerHelper()
    
    // MARK: Internal Properties
    fileprivate var currentViewController: UIViewController!
    fileprivate var cropCircular: Bool = false
    fileprivate var aspectRatioPreset: TOCropViewControllerAspectRatioPreset?
    fileprivate var aspectRatioLocked: Bool = false
    fileprivate var aspectRatioPickerHidden: Bool = false
    
    // MARK: - Closure
    var imagePickedClosure: ((UIImage) -> Void)?
    
    private func camera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            DispatchQueue.main.async {
                let pickerController = UIImagePickerController()
                pickerController.delegate = self
                pickerController.sourceType = .camera
                pickerController.mediaTypes = [kUTTypeImage as String]
                self.currentViewController.present(pickerController, animated: true, completion: nil)
            }
        }
    }
    
    private func photoLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            DispatchQueue.main.async {
                let pickerController = UIImagePickerController()
                pickerController.delegate = self
                pickerController.sourceType = .photoLibrary
                pickerController.mediaTypes = [kUTTypeImage as String]
                self.currentViewController.present(pickerController, animated: true, completion: nil)
            }
        }
    }
    
    private func checkCameraPermission() {
        let titleCameraPermission: String =  LocaleString.cameraPermission
        let titleMicrophonePermission: String =  LocaleString.microphonePermission
        let messageCameraPermission: String =  LocaleString.cameraPermissionMessage
        let messageMicrophonePermission: String =  LocaleString.microphonePermissionMessage
        
        if AVCaptureDevice.authorizationStatus(for: .video) == .authorized {
            if AVCaptureDevice.authorizationStatus(for: .audio) == .authorized || AVCaptureDevice.authorizationStatus(for: .audio) == .notDetermined {
                camera()
            } else {
                alertToEncouragePermissionAccessInitially(title: titleMicrophonePermission, message: messageMicrophonePermission)
            }
        } else if AVCaptureDevice.authorizationStatus(for: .video) == .denied {
            alertToEncouragePermissionAccessInitially(title: titleCameraPermission, message: messageCameraPermission)
        } else {
            AVCaptureDevice.requestAccess(for: .video, completionHandler: { [weak self] (granted: Bool) in
                guard let s = self else { return }
                if granted {
                    s.camera()
                } else {
                    s.alertToEncouragePermissionAccessInitially(title: titleCameraPermission, message: messageCameraPermission)
                }
            })
        }
    }
    
    private func checkPhotosPermission() {
        let titlePermission: String = LocaleString.photosPermission
        let messagePermission: String = LocaleString.photosPermissionMessage
        
        if PHPhotoLibrary.authorizationStatus() == .authorized {
            photoLibrary()
        } else if PHPhotoLibrary.authorizationStatus() == .denied {
            DispatchQueue.main.async {
                self.alertToEncouragePermissionAccessInitially(title: titlePermission, message: messagePermission)
            }
        } else {
            PHPhotoLibrary.requestAuthorization { [weak self] (status) in
                guard let s = self else { return }
                switch status {
                case .authorized:
                    s.photoLibrary()
                case .denied, .restricted:
                    DispatchQueue.main.async {
                        s.alertToEncouragePermissionAccessInitially(title: titlePermission, message: messagePermission)
                    }
                case .notDetermined: break
                @unknown default:
                    fatalError()
                }
            }
        }
    }
    
    private func alertToEncouragePermissionAccessInitially(title: String, message: String) {
        Alert.displayConfirmation(
            title: title,
            message: message,
            confirmTitle: LocaleString.openSettings,
            sender: currentViewController,
            onConfirm: {
                UIApplication.shared.open(
                    URL(string: UIApplication.openSettingsURLString)!,
                    options: [:],
                    completionHandler: nil)
        },
            onCancel: nil)
    }
    
    
    func showMediaOptions(viewController: UIViewController, sourceView: UIView) {
        currentViewController = viewController
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(
            UIAlertAction(title: LocaleString.camera, style: .default, handler: { [weak self] _ in
                guard let s = self else { return }
                s.checkCameraPermission()
            })
        )
        actionSheet.addAction(
            UIAlertAction(title: LocaleString.photos, style: .default, handler: { [weak self] _ in
                guard let s = self else { return }
                s.checkPhotosPermission()
            })
        )
        actionSheet.addAction(UIAlertAction(title: LocaleString.cancel, style: .cancel, handler: nil))
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            actionSheet.popoverPresentationController?.sourceView = sourceView
            actionSheet.popoverPresentationController?.sourceRect = sourceView.bounds
            actionSheet.popoverPresentationController?.permittedArrowDirections = [.down, .up]
        }
        
        currentViewController.present(actionSheet, animated: true, completion: nil)
    }
    
    func showCamera(viewController: UIViewController) {
        currentViewController = viewController
        checkCameraPermission()
    }
    
    func showPhotos(viewController: UIViewController) {
        currentViewController = viewController
        checkPhotosPermission()
    }
    
    func setCropController(aspectRatio: TOCropViewControllerAspectRatioPreset? = nil,
                           aspectRatioLocked: Bool = false,
                           aspectRatioPickerHidden: Bool = false,
                           cropCircular: Bool = false) {
        self.aspectRatioPreset = aspectRatio
        self.aspectRatioLocked = aspectRatioLocked
        self.aspectRatioPickerHidden = aspectRatioPickerHidden
        self.cropCircular = cropCircular
    }
    
    @objc private func videoSaved(_ video: String, didFinishSavingWithError error: NSError!, context: UnsafeMutableRawPointer){
        if let theError = error {
            print("error saving the video = \(theError)")
        } else {
            DispatchQueue.main.async(execute: {})
        }
    }
    
    private func handleImageReceived(_ image: UIImage) {
        let cropViewController: TOCropViewController
        if cropCircular {
            cropViewController = TOCropViewController(croppingStyle: .circular, image: image)
        } else {
            cropViewController = TOCropViewController(image: image)
        }
        cropViewController.aspectRatioPickerButtonHidden = aspectRatioPickerHidden
        cropViewController.aspectRatioLockEnabled = aspectRatioLocked
        if let preset = aspectRatioPreset {
            cropViewController.aspectRatioPreset = preset
        }
        cropViewController.delegate = self
        currentViewController.navigationController?.pushViewController(cropViewController, animated: true)
    }
}

// MARK: - UIIMagePicker Delegate, NavigationController Delegate
extension MediaPickerHelper: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        currentViewController.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            handleImageReceived(image)
        } else{
            print("Something went wrong")
        }
        currentViewController.dismiss(animated: true, completion: nil)
    }
}

// MARK: - TOCrop Delegate
extension MediaPickerHelper: TOCropViewControllerDelegate {
    func cropViewController(_ cropViewController: TOCropViewController, didCropTo image: UIImage, with cropRect: CGRect, angle: Int) {
        currentViewController.navigationController?.popViewController(animated: true)
        self.imagePickedClosure?(image)
    }
    
    func cropViewController(_ cropViewController: TOCropViewController, didCropToCircularImage image: UIImage, with cropRect: CGRect, angle: Int) {
        currentViewController.navigationController?.popViewController(animated: true)
        self.imagePickedClosure?(image)
    }
}
