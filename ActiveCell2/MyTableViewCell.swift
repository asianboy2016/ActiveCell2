import UIKit

class MyTableViewCell: UITableViewCell {
    
    //@IBOutlet weak var pokemonName:UILabel!
    
    @IBOutlet var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

    
    /*  func setPokemonName(_ name:String) {
        self.setPokemonName.text = name
    } */
}
