//
//  InputDataVC.swift
//  homesort
//
//  Created by Junyuan Suo on 10/22/16.
//  Copyright © 2016 JYLock. All rights reserved.
//

import UIKit
import CoreLocation


class InputDataVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // MARK: - Outlets
    
    @IBOutlet weak var firstNameTextfield: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var birthdayTextField: UITextField!
    
    @IBOutlet weak var ethnicityTextField: UITextField!
    
    @IBOutlet weak var sexSwitch: UISwitch!
    
    @IBOutlet weak var ssnTextField: UITextField!
    
    @IBOutlet weak var backgroundTextField: UITextView!
    
    @IBOutlet weak var distanceTextField: UITextField!
    
    
    @IBOutlet weak var addPictureBtn: UIButton!
    
    @IBOutlet weak var pictureImageView: UIImageView!
    
    @IBOutlet weak var inputBtn: UIButton!
    
    // MARK: - Properties
    var imagePicker: UIImagePickerController!
    
    var photoLocation: CLLocation!
    
    var shelters: [Shelter]!
    
    // MARK: - View Cycles
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
    }

    
    // MARK: - Actions
    @IBAction func inputBtnPressed(_ sender: AnyObject) {
        var firstName = "N/A"
        var lastName = "N/A"
        var birthday = "N/A"
        var ethnicity = "N/A"
        var sex = "M"
        var ssn = "000000000"
        var background = "N/A"
        var image = UIImage(named: "Contact Card-30.png")
        var lat = "N/A"
        var lon = "N/A"
        var distance = "N/A"
        
        if let firstName = firstNameTextfield.text{}
        
        if let lastName = lastNameTextField.text{}
        
        if let birthday = birthdayTextField.text{}
        
        if let ethnicity = ethnicityTextField.text{}
        
        if sexSwitch.isOn {
            sex = "M"
        } else {
            sex = "F"
        }
        
        if let ssn = ssnTextField.text{}
        
        if let background = backgroundTextField.text{}
        
        if let image = pictureImageView.image{}
        
        if let lat = photoLocation?.coordinate.latitude,
               let lon = photoLocation?.coordinate.longitude {}
        
        if let distance = distanceTextField.text{}
        
        let originalPhoto = UIImageJPEGRepresentation(image!, 0)!
        // need to form url encoded the query string!!! otherwise + will be interpreted as space
        var s = NSCharacterSet.urlQueryAllowed
        s.remove(charactersIn: "+&")
        
        let ss: NSString = originalPhoto.base64EncodedString(options: .lineLength64Characters).addingPercentEncoding(withAllowedCharacters: s)! as NSString
//        let originalPhotoBase64String: NSString = originalPhoto.base64EncodedStringWithOptions(.Encoding64CharacterLineLength).stringByAddingPercentEncodingWithAllowedCharacters(s as! NSCharacterSet)!
        
        // create a photo object
        var homeless: [String : Any] = [
            "firstName": firstName,
            "lastName": lastName,
            "birthday": birthday,
            "ethnicity": ethnicity,
            "sex": sex,
            "ssn": ssn,
            "background": background,
            "lat": lat,
            "lon": lon,
            "distance": distance,
            "image": ss
        ]

        
        // make API request to upload the photo
        let url:NSURL = NSURL(string: SharingManager.Constant.uploadMomentURL)!
        let session = NSURLSession.sharedSession()
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
        
        var paramString = ""
        
        for (key, value) in homeless {
            paramString += "\(key)=\(value)&"
        }
        
        request.addValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.HTTPBody = paramString.dataUsingEncoding(NSUTF8StringEncoding)
        
        let task = session.dataTaskWithRequest(request) {
            (data, response, error) in
            if error != nil {
                print("error: \(error)")
                return
            }
            
            guard let _:NSData = data, let _:NSURLResponse = response else {
                print("error: \(error)")
                return
            }
            
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as! NSDictionary
                if let message = json["message"] as? String {
                    print(message)
                    dispatch_async(dispatch_get_main_queue(), {
                        
                    })
                performSegue(withIdentifier: "goToResultsVC", sender: nil)
                }
            } catch {
                print("error serializing JSON: \(error)")
            }
        }
        task.resume()
        
        
        // return to the last page
        // let viewControlers = navigationController?.viewControllers
        // navigationController?.popToViewController(viewControlers![0], animated: true)
//        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func addPictureBtnPressed(_ sender: AnyObject) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            pictureImageView.image = image
        } else {
            print("A valid image wasn't selected")
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResultsVC"{
            
            if let searchResultsVC = segue.destination as? SearchResultsVC {
                
                searchResultsVC.shelters = shelters
            }
        }

        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
