# iOSSlideCells
Custom slide cell class for collection view

This is a very simple custom class you can use in your collection view cells just to make your lists
a little more visual attractive and save some space for item options like delete and edit options. 
Collection view cell class is all made programmatically (constrains and controls). It includes a simple 
title and subtitle UILabales and a simple image. It also includes two default button options.
You can test it with the UICollectionViewController demo.

Usage

Its usage is very simple. Just copy the SliceCell class to your project and add the class to your prototype 
cells or cell item. The demo uses UICollectionViewDelegateFlowLayout (In your CollectionViewController or ViewController)
to set the CGSize of cell, by default its height is 80 and the width is the viewContoller or collectionViewController 
width because the components it has (Title, Subtitle, Image).
