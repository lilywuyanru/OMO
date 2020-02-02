//
//  ImageViewController.swift
//  MLKit Starter Project
//
//  Created by Sai Kambampati on 5/20/18.
//  Copyright © 2018 AppCoda. All rights reserved.
//

import UIKit
import Firebase

class ImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var resultView: UITextView!
    
    let imagePicker = UIImagePickerController()
    
    var resultImage: UIImage?
    var resultText:String?
    
    lazy var vision = Vision.vision()

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    
    @IBAction func didTapOnTakePhotoButton(_ sender: UIButton) {
         let vc = UIImagePickerController()
         vc.sourceType = .camera
         vc.allowsEditing = true
         vc.delegate = self
         present(vc, animated: true)
        
     }
    
    @IBAction func uploadImage(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {

        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            resultImage = pickedImage

            let labelDetector = vision.cloudImageLabeler()
            
            let visionImage = VisionImage(image: pickedImage)

            //2
            labelDetector.process(visionImage) { (labels, error) in
                //3
                guard error == nil, let labels = labels, !labels.isEmpty else {
                    self.dismiss(animated: true, completion: nil)
                    return
                }

                //4
//                for label in labels {
//                    self.resultView.text = self.resultView.text + "\(label.text)"
//                }
            
                self.resultText = labels.first?.text
                
                self.performSegue(withIdentifier: "PresentResults", sender:nil)
 
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PresentResults" {
            if let destinationVC = segue.destination as? ResultsViewController {
                destinationVC.resultImage = resultImage
                destinationVC.resultText = resultText
            }
        }
    }
    
}
