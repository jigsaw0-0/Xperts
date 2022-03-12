

import UIKit
import SDWebImage

class MyJDSubStageViewDetailsDescCell: UITableViewCell {

    @IBOutlet weak var descLabel : UILabel!
    
    @IBOutlet weak var dotVIew: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dotVIew.layer.cornerRadius = 2.5
        dotVIew.layer.masksToBounds = true
        descLabel.font = UIFont.init(name: "OpenSans", size: 14)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
