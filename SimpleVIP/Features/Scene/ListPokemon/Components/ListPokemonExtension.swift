//
//  ListPokemonExtension.swift
//  SimpleVIP
//
//  Created by FauziArda on 21/02/23.
//

import Foundation
import UIKit


extension ListPokemonViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.displayedPokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        cell.label.text = self.displayedPokemons[indexPath.row].name
        cell.iconImage.load(url: self.displayedPokemons[indexPath.row].imageURL)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.router?.routeToPokemonDetail()
    }
    
    
}
