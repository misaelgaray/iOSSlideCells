//
//  MasterCollectionViewController.swift
//  SlideCells
//
//  Created by Misael Garay on 15/08/17.
//  Copyright © 2017 Misael Garay. All rights reserved.
//

import UIKit

class MasterCollectionViewController: UICollectionViewController{
    
    private let cellId = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(SlideCell.self, forCellWithReuseIdentifier: cellId)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SlideCell
        cell.deleteButton.addTarget(self, action: #selector(OnDeleteAction), for: .touchUpInside)
        cell.editButton.addTarget(self, action: #selector(OnEditAction), for: .touchUpInside)
        return cell
    }
    
    @objc private func OnDeleteAction(){
        CallAlert(withTitle: "Are you sure ....... delete?", message: "All will be deleted")
    }
    
    public func OnEditAction(){
        CallAlert(withTitle: "Are you sure ....... edit?", message: "Let's change this")
    }
    
    public func CallAlert(withTitle : String, message : String){
        let popUp = UIAlertController(title: withTitle, message: message, preferredStyle: .alert)
        popUp.addAction(UIAlertAction(title: "Yes", style: .default, handler: {
            whatever in
        }))
        self.present(popUp, animated: true, completion: nil)
    }
    
}

extension MasterCollectionViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 80)
    }
}
