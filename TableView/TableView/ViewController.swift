//
//  ViewController.swift
//  TableView
//
//  Created by CaliaPark on 3/19/24.
//

import UIKit

class ViewController: UIViewController {

    var moviesArray: [Movie] = [Movie(image: UIImage(named: "Image 3.png"), title: "파묘", description: "한국 오컬트"),
                               Movie(image: UIImage(named: "Image 2.png"), title: "패스트라이브즈", description: "전생과 인연"),
                               Movie(image: UIImage(named: "Image.png"), title: "밥말리원러브", description: "평화의 음악 레게"),
                               Movie(image: UIImage(named: "Image 1.png"), title: "메이디셈버", description: "우리가 말하는 사랑이라면"),
                               Movie(image: UIImage(named: "Image 4.png"), title: "추락의해부", description: "관계의 해부")]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.movieImage.image = moviesArray[indexPath.row].image
        cell.movieTitle.text = moviesArray[indexPath.row].title
        cell.movieDescription.text = moviesArray[indexPath.row].description
        return cell
    }
    
}

