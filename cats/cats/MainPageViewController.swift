//
//  MainPageViewController.swift
//  cats
//
//  Created by user on 11/20/23.
//

import UIKit

final class MainPageViewController: UIViewController {
    
    private var facts = [Fact]()
    private let viewModel = MainPageViewModel()
    
    // MARK: - UI
    
    private var factsTable: UITableView = {
        let tableView = UITableView()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private var rotatingCat: RotatingImageView = {
        let imageView = RotatingImageView()
        imageView.image = UIImage(systemName: "cat.circle.fill")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        setupUI()
        setupViewModel()
        rotatingCat.startRotating()
        viewModel.viewDidLoad()
        setupTitle()
    }
    
    private func setupUI() {
        setUpBackgroundColor()
        setUpTableView()
        setUpActivityIndicator()
    }
    
    private func setUpBackgroundColor() {
        view.backgroundColor = .systemBackground
    }
    
    private func setUpTableView() {
        view.addSubview(factsTable)
        factsTable.delegate = self
        factsTable.dataSource = self
        // Use auto-layout constraints for the table view
        factsTable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            factsTable.topAnchor.constraint(equalTo: view.topAnchor),
            factsTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            factsTable.trailingAnc
