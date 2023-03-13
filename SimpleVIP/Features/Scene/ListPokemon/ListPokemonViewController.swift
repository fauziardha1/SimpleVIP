//
//  ListPokemonViewController.swift
//  SimpleVIP
//
//  Created by Batm Admin on 21/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ListPokemonDisplayLogic: class
{
    func displayPokemons(viewModel: ListPokemon.FetchPokemons.ViewModel)
}

class ListPokemonViewController: UIViewController
{
  var interactor: ListPokemonBusinessLogic?
  var router: (NSObjectProtocol & ListPokemonRoutingLogic & ListPokemonDataPassing)?
    
    var displayedPokemons: [ListPokemon.FetchPokemons.ViewModel.DisplayedPokemon] = []
  
  private func setup()
  {
    let viewController = self
    let interactor = ListPokemonInteractor()
    let presenter = ListPokemonPresenter()
    let router = ListPokemonRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    view.backgroundColor = .systemBlue
    title = "Pokemon"
    navigationController?.navigationBar.prefersLargeTitles = true
      
    view.addSubview(tableView)
    tableView.dataSource = self
    tableView.delegate = self
      
    setup()
    fetchPokemons()
  }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
  
  
    // MARK: Fetch Pokemons
    func fetchPokemons()  {
        let fetchPokemonsReq = ListPokemon.FetchPokemons.Request(id: 0)
        interactor?.fetchPokemons(request: fetchPokemonsReq)
    }

    var tableView : UITableView = {
        let tv = UITableView()
        tv.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        return tv
    }()
}


extension ListPokemonViewController: ListPokemonDisplayLogic{
    // MARK: Display Pokemons
    func displayPokemons(viewModel: ListPokemon.FetchPokemons.ViewModel) {
        self.displayedPokemons = viewModel.displayedPokemons
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}