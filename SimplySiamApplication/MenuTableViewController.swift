//
//  MenuTableViewController.swift
//  SimplySiamApplication
//
//  Created by student on 1/31/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController, UISearchResultsUpdating  {

    let searchController = UISearchController(searchResultsController: nil)
    let unfilteredMenu = Menu.MenuItems
    var filteredMenu:[MenuItem]?
    
    override func viewDidLoad() {
        filteredMenu = unfilteredMenu
        self.navigationItem.title = "Menu"
        tableView.register(MenuItemTableViewCell.self, forCellReuseIdentifier: "item_cell")
        tableView.backgroundView = UIImageView(image: UIImage(named: "logo"))
        var visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        visualEffectView.frame = (tableView.backgroundView?.bounds)!
        tableView.backgroundView?.addSubview(visualEffectView)
        
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = true
        tableView.tableHeaderView = searchController.searchBar
        
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredMenu!.count
        //return 4
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemViewControllerObj = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "itemViewController") as! ItemDetailsViewController
        itemViewControllerObj.item = filteredMenu![indexPath.row]
        self.navigationController?.pushViewController(itemViewControllerObj, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Setting up the cell via code
        let cell = tableView.dequeueReusableCell(withIdentifier: "item_cell", for: indexPath)
        cell.textLabel?.text = filteredMenu![indexPath.row].name
        cell.detailTextLabel?.text = "Price: $" + "\(filteredMenu![indexPath.row].price ?? 0)"
        let itemName:String = "item"+"\(indexPath.row + 1)" + ".jpg"
        let image = UIImage(named: itemName)
        cell.imageView?.layer.borderWidth = 2.0
        cell.imageView?.layer.borderColor = UIColor.clear.cgColor
        cell.imageView?.layer.masksToBounds = true
        cell.imageView?.image = image
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            print(searchText)
            filteredMenu = unfilteredMenu.filter { menu in
                return (menu.name?.lowercased().contains(searchText.lowercased()))!
            }
        } else {
            filteredMenu = unfilteredMenu
        }
        tableView.reloadData()
    }

}
