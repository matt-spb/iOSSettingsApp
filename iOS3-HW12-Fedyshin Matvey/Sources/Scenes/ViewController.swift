//
//  ViewController.swift
//  iOS3-HW12-Fedyshin Matvey
//
//  Created by matt_spb on 17.11.2021.
//

import UIKit

class ViewController: UIViewController {

    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        view.backgroundColor = .white
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.pin(to: view)
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension ViewController: UITableViewDelegate {

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell()
        cell.accessoryType = .detailButton
        cell.textLabel?.text = "Hello"
        cell.detailTextLabel?.text = "World"
        cell.imageView?.image = UIImage(named: "settings")


        return cell
    }


}
