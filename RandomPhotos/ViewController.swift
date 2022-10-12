//
//  ViewController.swift
//  RandomPhotos
//
//  Created by Ben Seferidis on 10/10/22.
//

import UIKit

class ViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill //manage image aspect ratio inside images frame
        imageView.backgroundColor = .systemYellow
        return imageView
        
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        view.addSubview(imageView)
        //προσθετουμε το imageView που φτιαξαμε πιο πανω στην οθονη για να το δουμε
        imageView.frame = CGRect(x: 0 ,y: 0 , width: 300 , height: 300 )
        //οριζουμε την τοποθεσια του "frame" στην οθονη
        imageView.center = view.center //τοποθετηση στο κεντρο της  οθονης
        view.addSubview(button)//προσθετουμε το button στην οθονη
        
        getRandomPhoto()//καλουμε την getRandomPhoto
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    @objc func didTapButton(){ //φτιαχνουμε την συναρτηση για την αλλαγη εικονας στο button βαζω @objc για να μπορω να την κανω attach στο button
        getRandomPhoto()
        view.backgroundColor = colors.randomElement()
    }
    let colors: [UIColor] = [ //φτιαχνουμε ενα πινακα που περιεχει χρωματα ωστε να αλλαζουν ως background μαζι με τις φωτο
        .systemYellow,
        .systemRed,
        .systemCyan,
        .systemPink,
        .systemMint
    ]
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect (x: 20,
                               y:view.frame.size.height-150-view.safeAreaInsets.bottom,//
                               width:view.frame.size.width-40,
                               height: 55)
    }
    
    func getRandomPhoto(){
    let urlString = "https://source.unsplash.com/random/600x600"
    let url = URL(string: urlString)! //λεμε οτι το url ειναι valid με το !
        guard let data = try? Data(contentsOf: url) else{
            return
        }//(try = προσπαθουμε) περναμε τα data απο το url
        imageView.image = UIImage(data: data)//αφου περασουμε τα δεδομενα απο το url τοτε δημιουργουμε την εικονα με το imageView
    }
}

    
