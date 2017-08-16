//
//  BudgetCollectionViewCell.swift
//  SlideCells
//
//  Created by MisaelGaray on 18/07/17.
//  Copyright © 2017 MisaelGaray. All rights reserved.
//

import UIKit

class SlideCell: UICollectionViewCell {
    
    private var slideContainer : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColors.cellViewBorder
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    
    var labelTitle : UILabel = {
        let label = UILabel()
        label.text = "Title or Name Here"
        label.textColor = UIColors.textColor
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var labelSubtitle : UILabel = {
        let label = UILabel()
        label.text = "Set subtitle"
        label.textColor = UIColors.textColor
        label.font = UIFont.boldSystemFont(ofSize: 12.0)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var profileImage : UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "man-hat-portrait-old-man-160422")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    
    var deleteButton : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.red
        btn.setTitle("Delete", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var editButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("Edit", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = UIColors.btnSuccess
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private var optionsPanel : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                ShowCellOptions()
            }else {
               HideCellOptions()
            }
        }
    }
    
    private var leftAnchorCellConstraint : NSLayoutConstraint?
    private var rightAnchorCellConstraint : NSLayoutConstraint?
    private var isOptionsShown = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        AddSubviews()
        SetupConstraints()
    }
    
    private func AddSubviews(){
        addSubview(slideContainer)
        slideContainer.addSubview(labelTitle)
        addSubview(optionsPanel)
        optionsPanel.addSubview(deleteButton)
        optionsPanel.addSubview(editButton)
        slideContainer.addSubview(profileImage)
        slideContainer.addSubview(labelSubtitle)
    }
    
    private func SetupConstraints(){
        SetupSlideContainer()
        SetupProfileImage()
        SetupLabelTittle()
        SetupOptionsPanel()
        SetupSubtitle()
    }
    
    public func ShowCellOptions(){
        
        if !isOptionsShown {
            isOptionsShown = true
            rightAnchorCellConstraint?.constant -= slideContainer.frame.width / 2 + 10
            leftAnchorCellConstraint?.constant -= slideContainer.frame.width / 2 + 10
            UIView.animate(withDuration: 0.3, animations: {
                self.layoutIfNeeded()
            })
        }else{
            HideCellOptions()
        }
        
        
    }
    
    public func HideCellOptions(){
        if isOptionsShown {
            isOptionsShown = false
            rightAnchorCellConstraint?.constant += slideContainer.frame.width / 2 + 10
            leftAnchorCellConstraint?.constant += slideContainer.frame.width / 2 + 10
            UIView.animate(withDuration: 0.3, animations: {
                self.layoutIfNeeded()
            })
        }
        
    }
    
    private func SetupOptionsPanel(){
        optionsPanel.topAnchor.constraint(equalTo: slideContainer.topAnchor).isActive = true
        optionsPanel.leftAnchor.constraint(equalTo: slideContainer.rightAnchor, constant : 10).isActive = true
        optionsPanel.bottomAnchor.constraint(equalTo: slideContainer.bottomAnchor).isActive = true
        optionsPanel.widthAnchor.constraint(equalTo: slideContainer.widthAnchor, multiplier: 1/2).isActive = true
        
        //Buttons
        deleteButton.leftAnchor.constraint(equalTo: optionsPanel.leftAnchor).isActive = true
        deleteButton.topAnchor.constraint(equalTo: optionsPanel.topAnchor).isActive = true
        deleteButton.bottomAnchor.constraint(equalTo: optionsPanel.bottomAnchor).isActive = true
        deleteButton.widthAnchor.constraint(equalTo: optionsPanel.widthAnchor, multiplier: 1/2).isActive = true
        
        editButton.rightAnchor.constraint(equalTo: optionsPanel.rightAnchor).isActive = true
        editButton.topAnchor.constraint(equalTo: optionsPanel.topAnchor).isActive = true
        editButton.bottomAnchor.constraint(equalTo: optionsPanel.bottomAnchor).isActive = true
        editButton.widthAnchor.constraint(equalTo: optionsPanel.widthAnchor, multiplier: 1/2).isActive = true
    }
    
    private func SetupSubtitle(){
        labelSubtitle.topAnchor.constraint(equalTo: labelTitle.bottomAnchor).isActive = true
        labelSubtitle.rightAnchor.constraint(equalTo: slideContainer.rightAnchor).isActive = true
        labelSubtitle.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: 10).isActive = true
        labelSubtitle.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func SetupLabelTittle(){
        labelTitle.topAnchor.constraint(equalTo: slideContainer.topAnchor).isActive = true
        labelTitle.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant : 10).isActive = true
        labelTitle.rightAnchor.constraint(equalTo: slideContainer.rightAnchor).isActive = true
        labelTitle.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func SetupProfileImage(){
        profileImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 60).isActive = true
        profileImage.centerYAnchor.constraint(equalTo: slideContainer.centerYAnchor).isActive = true
        profileImage.leftAnchor.constraint(equalTo: slideContainer.leftAnchor, constant: 10).isActive = true
        profileImage.clipsToBounds = true
        profileImage.layer.cornerRadius = 30 //fixed corner radius
    }
    
    private func SetupSlideContainer(){
        slideContainer.topAnchor.constraint(equalTo: topAnchor).isActive = true
        slideContainer.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        rightAnchorCellConstraint = slideContainer.rightAnchor.constraint(equalTo: rightAnchor, constant: -10)
        leftAnchorCellConstraint = slideContainer.leftAnchor.constraint(equalTo: leftAnchor, constant: 10)
        rightAnchorCellConstraint?.isActive = true
        leftAnchorCellConstraint?.isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}







