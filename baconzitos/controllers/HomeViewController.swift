import UIKit

class HomeViewController: UIViewController, ShowItemDelegate {
    
    var items = Array<Item>()
    var index = 0;

    override func viewDidLoad() {
        super.viewDidLoad()
        items = [
            Item(image: "simpsons.jpg", description: "Aqui esta todos os bonecos do simpsons"),
            Item(image: "corinthians.jpg", description: "Sport Club Corinthians Paulista - Campeao de tudo")
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func show() -> Item {
        return items[index]
    }
    
    func openItemDetails() {
        if let navigation = navigationController {
            let itemController = ItemViewController(delegate: self)
            navigation.pushViewController(itemController, animated: true)
        }
    }
    
    @IBAction func firstAction() {
        index = 0
        openItemDetails()
    }
    
    @IBAction func secondAction() {
        index = 1
        openItemDetails()
    }

}

