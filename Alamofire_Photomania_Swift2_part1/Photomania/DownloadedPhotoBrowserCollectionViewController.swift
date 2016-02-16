//
//  DownloadedPhotoBrowserCollectionViewController.swift
//  Photomania
//
//  Created by Essan Parto on 2014-09-01.
//  Copyright (c) 2014 Essan Parto. All rights reserved.
//

import UIKit

class DownloadedPhotoBrowserCollectionViewController: UICollectionViewController {
  var downloadedPhotoURLs: [NSURL]?
  let DownloadedPhotoBrowserCellIdentifier = "DownloadedPhotoBrowserCell"
  
  // MARK: Life-Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationController?.setNavigationBarHidden(false, animated: true)
    
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: view.bounds.size.width, height: 200.0)
    
    collectionView!.collectionViewLayout = layout
    
    collectionView!.registerClass(DownloadedPhotoBrowserCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: DownloadedPhotoBrowserCellIdentifier)
    
    navigationItem.title = "Downloads"
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    
    if let directoryURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first {
      let urls: [NSURL]?
      do {
        urls = try NSFileManager.defaultManager().contentsOfDirectoryAtURL(directoryURL, includingPropertiesForKeys: nil, options: [])
        downloadedPhotoURLs = urls
        collectionView!.reloadData()
      } catch let error as NSError {
        print("Error \(error.localizedDescription)")
      }
    }
  }
  
  // MARK: CollectionView
  
  override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return downloadedPhotoURLs?.count ?? 0
  }
  
  override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(DownloadedPhotoBrowserCellIdentifier, forIndexPath: indexPath) as! DownloadedPhotoBrowserCollectionViewCell
    
    let localFileData = NSFileManager.defaultManager().contentsAtPath(downloadedPhotoURLs![indexPath.item].path!)
    
    let image = UIImage(data: localFileData!, scale: UIScreen.mainScreen().scale)
    
    cell.imageView.image = image
    
    return cell
  }
}

class DownloadedPhotoBrowserCollectionViewCell: UICollectionViewCell {
  let imageView = UIImageView()
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubview(imageView)
    imageView.frame = bounds
    imageView.contentMode = .ScaleAspectFit
  }
}