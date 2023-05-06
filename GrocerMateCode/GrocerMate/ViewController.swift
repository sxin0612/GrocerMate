//
//  ViewController.swift
//  GrocerMate
//
//  Created by Sara Xin on 4/11/23.
//

import UIKit

extension UIImage
{
    func resizedImage(Size sizeImage: CGSize) -> UIImage?
    {
        let frame = CGRect(origin: CGPoint.zero, size: CGSize(width: sizeImage.width, height: sizeImage.height))
        UIGraphicsBeginImageContextWithOptions(frame.size, false, 0)
        self.draw(in: frame)
        let resizedImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.withRenderingMode(.alwaysOriginal)
        return resizedImage
    }
}

class ViewController: UIViewController {
    
    var myLists = mainInstanceLists
    
    
    
    @IBOutlet var modifiedMyListsButton: UIButton!


    @IBOutlet var newListButton: UIButton!
    
    override func loadView() {
        super.loadView()
        
        
        
        let newListImage = UIImage(named: "newListButton")
        let newListResized = newListImage?.resizedImage(Size:CGSize(width: 125, height: 125))
        newListButton.setTitle("", for: .normal)
        newListButton.setImage(newListResized, for: UIControl.State.normal)
        
        let myListsImage = UIImage(named: "myLists")
        let myListsResized = myListsImage?.resizedImage(Size:CGSize(width: 125, height: 125))
        modifiedMyListsButton.setTitle("", for: .normal)
        modifiedMyListsButton.setImage(myListsResized, for: UIControl.State.normal)
        
        self.view.backgroundColor = UIColor(red: 180/255.0, green: 204/255.0, blue: 155/255.0, alpha: 1)
        print(myLists)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func newListClicked(_ sender: UIButton) {
        print("pressed")
        performSegue(withIdentifier: "toAddList", sender: self)
    }
    
    @IBAction func myListsClicked(_ sender: UIButton) {
        print("my lists pressed")
        performSegue(withIdentifier: "toMyLists", sender: self)
    }
    
    @IBAction func modifiedMyListsClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "toModifiedMyLists", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddList" {
            if let dest = segue.destination as? AddListViewController {
                //dest.delegate = self
                dest.loadView()
            }
            
            //let nvc = segue.destination as! UINavigationController
            //if let alvc = nvc.topViewController as? AddListViewController {
               // alvc.delegate = MyListsViewController
            //}
        }
        if segue.identifier == "toMyLists" {
            if let dest = segue.destination as? MyListsViewController {
                //dest.delegate = self
                dest.loadView()
                
            }
        }
        
        
        
        
            
    }


}

