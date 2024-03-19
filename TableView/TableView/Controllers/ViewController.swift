//
//  ViewController.swift
//  TableView
//
//  Created by CaliaPark on 3/19/24.
//

import UIKit

class ViewController: UIViewController {
    
    var moviesArray: [Movie] = []
    var movieDataManager = DataManager()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        movieDataManager.makeMovieData()
        moviesArray = movieDataManager.getMovieData()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.movieImage.image = moviesArray[indexPath.row].image
        cell.movieTitle.text = moviesArray[indexPath.row].title
        cell.movieDescription.text = moviesArray[indexPath.row].description
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let detailVC = segue.destination as! DetailViewController
            let indexPath = sender as! IndexPath
            
            detailVC.movieData = moviesArray[indexPath.row]
        }
    }
    
    
}

