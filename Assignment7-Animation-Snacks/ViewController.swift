import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var navBarView: UIView!
    @IBOutlet weak var plusIconButton: UIButton!
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var navBarHeightConstraint: NSLayoutConstraint!
    
    let foods = ["oreos", "pizza_pockets", "pop_tarts", "popsicle", "ramen"]
    let nicelyNamedFoods = ["Oreos", "Pizza Pockets", "Pop Tarts", "Popsicle", "Ramen"]
    var selectedFoods = [String]()
    
    let hStackView = UIStackView()
    let navLabel = UILabel()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        mainTableView.delegate = self
        mainTableView.dataSource = self
        setupViewsAndGestures()
        
    }

    @IBAction func plusIconTapped(_ sender: UIButton) {
        
        if self.hStackView.isHidden {
            
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
                self.navBarHeightConstraint.constant = 200
                self.navBarView.frame.size.height = 200
                self.plusIconButton.transform = CGAffineTransform(rotationAngle: 0.25 * .pi)
            }, completion: { _ in
                self.hStackView.isHidden.toggle()
            })
            
        } else {
            
            self.hStackView.isHidden.toggle()
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
                self.navBarHeightConstraint.constant = 88
                self.navBarView.frame.size.height = 88
                self.plusIconButton.transform = .identity
            }, completion: { _ in
            })
            
        }
    }
    
    fileprivate func setupViewsAndGestures() {
        view.backgroundColor = .lightGray
        mainTableView.backgroundColor = .lightGray
        
        let foodImageViews = foods.map { (image: String) -> UIImageView in
            let iv = UIImageView(image: UIImage(named: image))
            iv.translatesAutoresizingMaskIntoConstraints = false
            iv.contentMode = .scaleAspectFit;
            return iv
        }
        
        let tgr0 = UITapGestureRecognizer(target: self, action: #selector(handleTap0(_:)))
        foodImageViews[0].addGestureRecognizer(tgr0)
        foodImageViews[0].isUserInteractionEnabled = true;
        let tgr1 = UITapGestureRecognizer(target: self, action: #selector(handleTap1(_:)))
        foodImageViews[1].addGestureRecognizer(tgr1)
        foodImageViews[1].isUserInteractionEnabled = true;
        let tgr2 = UITapGestureRecognizer(target: self, action: #selector(handleTap2(_:)))
        foodImageViews[2].addGestureRecognizer(tgr2)
        foodImageViews[2].isUserInteractionEnabled = true;
        let tgr3 = UITapGestureRecognizer(target: self, action: #selector(handleTap3(_:)))
        foodImageViews[3].addGestureRecognizer(tgr3)
        foodImageViews[3].isUserInteractionEnabled = true;
        let tgr4 = UITapGestureRecognizer(target: self, action: #selector(handleTap4(_:)))
        foodImageViews[4].addGestureRecognizer(tgr4)
        foodImageViews[4].isUserInteractionEnabled = true;
        
        navLabel.text = "SNACKS"
        navLabel.textAlignment = .center
        navLabel.translatesAutoresizingMaskIntoConstraints = false
        
        navBarView.addSubview(navLabel)
        
        navLabel.centerXAnchor.constraint(equalTo: navBarView.centerXAnchor).isActive = true
        navLabel.centerYAnchor.constraint(equalTo: navBarView.centerYAnchor, constant: -70).isActive = true
        
        hStackView.translatesAutoresizingMaskIntoConstraints = false
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.alignment = .center
        hStackView.spacing = 8
        hStackView.isHidden = true
        
        navBarView.addSubview(hStackView)
        for foodImageView in foodImageViews {
            hStackView.addArrangedSubview(foodImageView)
        }
        
        hStackView.topAnchor.constraint(equalTo: navBarView.topAnchor, constant: 50).isActive = true
        hStackView.bottomAnchor.constraint(equalTo: navBarView.bottomAnchor).isActive = true
        hStackView.leadingAnchor.constraint(equalTo: navBarView.leadingAnchor).isActive = true
        hStackView.trailingAnchor.constraint(equalTo: navBarView.trailingAnchor).isActive = true
    }
    
}

extension ViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedFoods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCellIdentifier", for: indexPath) as UITableViewCell
        cell.textLabel?.text = selectedFoods[indexPath.row]
        print("-->", selectedFoods)
        return cell
    }
}

extension ViewController {
    @objc func handleTap0(_ sender: UITapGestureRecognizer) {
        selectedFoods.append(nicelyNamedFoods[0])
        mainTableView.insertRows(at: [IndexPath(row: selectedFoods.count - 1, section: 0)], with: .fade)
        print(selectedFoods)
    }
    
    @objc func handleTap1(_ sender: UITapGestureRecognizer) {
        selectedFoods.append(nicelyNamedFoods[1])
        mainTableView.insertRows(at: [IndexPath(row: selectedFoods.count - 1, section: 0)], with: .fade)
        print(selectedFoods)
    }
    
    @objc func handleTap2(_ sender: UITapGestureRecognizer) {
        selectedFoods.append(nicelyNamedFoods[2])
        mainTableView.insertRows(at: [IndexPath(row: selectedFoods.count - 1, section: 0)], with: .fade)
        print(selectedFoods)
    }
    
    @objc func handleTap3(_ sender: UITapGestureRecognizer) {
        selectedFoods.append(nicelyNamedFoods[3])
        mainTableView.insertRows(at: [IndexPath(row: selectedFoods.count - 1, section: 0)], with: .fade)
        print(selectedFoods)
    }
    
    @objc func handleTap4(_ sender: UITapGestureRecognizer) {
        selectedFoods.append(nicelyNamedFoods[4])
        mainTableView.insertRows(at: [IndexPath(row: selectedFoods.count - 1, section: 0)], with: .fade)
        print(selectedFoods)
    }
}

