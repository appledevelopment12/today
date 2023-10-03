//
//  ViewController.swift
//  today
//
//  Created by Rajeev on 03/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var collection1:UICollectionView!
    @IBOutlet var mustHaveCollectionView:UICollectionView!
    @IBOutlet var AddedToSiteCollectionView:UICollectionView!
    
    var counting = ["1","2","3","4","5","6"]
    var mustimgarray = ["i","j","k"]
    var mustLblarray = ["Garden","Parking","Balcony"]
    var addedtoTimeArrayName =  ["Anytime","Last 24 hours","Last 3 days","Last 7 days","Last 14 days","Last 30 days"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection1.delegate = self
        collection1.dataSource = self
        mustHaveCollectionView.delegate = self
        mustHaveCollectionView.dataSource = self
        AddedToSiteCollectionView.dataSource = self
        AddedToSiteCollectionView.delegate = self
    }
    
    
    
    
    
    
    func hexStringToUIColor (hex:String) -> UIColor
    {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}
extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collection1
        {
            return counting.count
        }
        else if collectionView == mustHaveCollectionView
        {
            return mustLblarray.count
        }
        else
        {
            return addedtoTimeArrayName.count
        }
}
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collection1
        {
            let cell = collection1.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! roomCollectionViewCell
            cell.countlbl.text = counting[indexPath.row]
            
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.lightGray.cgColor
            cell.layer.cornerRadius = 10
            return cell
        }
        else if collectionView == mustHaveCollectionView
        {
            let cell = mustHaveCollectionView.dequeueReusableCell(withReuseIdentifier: "mu", for: indexPath) as! MusthaveCollectionViewCell
            cell.mustlblImgname.text = mustLblarray[indexPath.row]
            cell.layer.cornerRadius = 10
            return cell
        }
        else
        {
            let cell = AddedToSiteCollectionView.dequeueReusableCell(withReuseIdentifier: "added", for: indexPath) as! AddedToSiteCollectionViewCell
            cell.lbl.text = addedtoTimeArrayName[indexPath.row]
           // cell.img.tintColor = UIColor.black
            return cell
            
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == collection1
        {
            return 10
        }
        else if (collectionView == mustHaveCollectionView)
        {
            return 10
        }
        else
        {
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == collection1
        {
            return 10
        }
        else if (collectionView == mustHaveCollectionView)
        {
            return 10
        }
        else
        {
            return 10
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == collection1
        {
            return CGSize(width: collection1.bounds.width/3-10, height: collection1.bounds.height/2-10)
        }
        else if (collectionView == mustHaveCollectionView)
        {
            return CGSize(width: mustHaveCollectionView.bounds.width/3-10, height: mustHaveCollectionView.bounds.height/1-10)
        }
        else
        {
            return CGSize(width: AddedToSiteCollectionView.bounds.width/2-10, height: AddedToSiteCollectionView.bounds.height/3-10)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collection1
        {
             let cell = collectionView.cellForItem(at: indexPath) as? roomCollectionViewCell
            
            cell?.contentView.backgroundColor = hexStringToUIColor(hex: "#007f00")
            
            cell?.countlbl.textColor = UIColor.white
        }
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == collection1
        {
             let cell = collectionView.cellForItem(at: indexPath) as? roomCollectionViewCell
            cell?.countlbl.textColor = UIColor.black
            cell?.contentView.backgroundColor = UIColor.white
        

        }

    }
   
    
}
