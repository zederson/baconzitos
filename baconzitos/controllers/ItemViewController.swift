import UIKit

class ItemViewController: UIViewController {
    
    var delegate : ShowItemDelegate?
    
    @IBOutlet var imageField : UIImageView?
    @IBOutlet var textField : UITextView?
    
    init(delegate : ShowItemDelegate) {
        super.init(nibName: "ItemViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (delegate == nil || textField == nil || imageField == nil) {
            return
        }
        
        let item = delegate!.show()
        textField!.text = item.description
        imageField!.image = UIImage(named: item.image)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
