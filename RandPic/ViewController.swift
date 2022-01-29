//
//  ViewController.swift
//  RandPic
//
//  Created by Debjit Pal on 29/01/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemYellow
        button.setTitle("Next Picture", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }()
    
    let colors: [UIColor] = [.systemPink, .systemTeal, .systemRed, .systemGreen, .systemOrange, .systemCyan, .systemBlue, .systemGray, .systemPurple]
    
    func getRandomPicture(){
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 390, height: 350)
        imageView.center = view.center
        
        view.addSubview(button)
        getRandomPicture()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton(){
        getRandomPicture()
        view.backgroundColor = colors.randomElement()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 100,
                              y:view.frame.size.height-130-view.safeAreaInsets.bottom,
                              width: view.frame.size.width-200,
                              height: 55)
    }

}

