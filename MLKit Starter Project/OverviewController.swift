//

import UIKit

class OverviewController: UIViewController {
    var imageView: UIImageView!
    var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)

        imageView = UIImageView(image: UIImage(named: "background.png"))
        
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.backgroundColor = UIColor.black
        // 3
        scrollView.contentSize = imageView.bounds.size
        // 4
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)

        // Do any additional setup after loading the view.
    }
}

