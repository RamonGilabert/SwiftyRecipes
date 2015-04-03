import UIKit

class ViewController: UIViewController
{
    var dataStack: DATAStack!

    init(dataStack: DATAStack)
    {
        super.init(nibName: nil, bundle: nil);
        self.dataStack = dataStack
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
}

