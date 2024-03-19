//
//  DetailViewController.swift
//  TableView
//
//  Created by CaliaPark on 3/19/24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    
    var movieData: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieImage.image = movieData?.image
        movieTitle.text = movieData?.title
        movieDescription.text = movieData?.description
    }
    


}
