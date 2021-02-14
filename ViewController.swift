import UIKit

var letters =
[
    "P","H","O","N","E","B",
    "L","E","A","D","E","R",
    "A","L","K","T","L","U",
    "N","L","U","I","Z","S",
    "E","O","Y","P","R","H",
    "C","A","B","L","E","T"
]


class ViewController: UIViewController {
    
    var count = 0
    var time = 30
    var remaining = Timer()
    @IBOutlet weak var displayLetters: UILabel!
    @IBOutlet weak var WordCount: UILabel!
    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var Checkteller: UILabel!
    @IBOutlet var allCards: [UIButton]!
    
    // Is in charge of the delete button

    @IBAction func Delete(_ sender: UIButton)
    {
        // Erase the words on label, the emoji, and erase the value of the variable word.
        displayLetters.text = ""
        // Delete the word that have already been displayed.
        word = ""
        Checkteller.text = ""
        // Call the reset function to flip the card.
        reset()
    }
    
    @IBAction func check(_ sender: UIButton)
    {
        // Compares if the word in the display label are correct.
        if (displayLetters.text == "BRUSH" || displayLetters.text == "CABLE" || displayLetters.text == "PHONE" || displayLetters.text == "LEADER" || displayLetters.text == "EEL" ||
            displayLetters.text == "PLAN" || displayLetters.text == "PLANE" || displayLetters.text == "HELLO" || displayLetters.text == "HELL")
        {
            // If the words are correct, display and emoji with a check and count is equal to 1
            Checkteller.text = "✅"
            count += 1
            time += 5
            // Reset the table
            reset()
        }
        else
        {
            // If the word does not match with the correct ones then display an X
            Checkteller.text = "❌"
            if (count == 0)
            {
                // Prevents count from being less than 0
                WordCount.text = ("Words: \(0)")
            }
            else
            {
                // if the word is wrong and count is greater than 0, then substract 1
                count -= 1
            }
        }
        // Show another label that tells your score
        WordCount.text = ("Words: \(count)")
        // Cheks if you have won the game
        Won(Number: count)
    }
    var word = ""
    // This will call a method when card is touched
    @IBAction func selectedCard(_ sender: UIButton) {

        let num = allCards.index(of: sender)!
        // Flips the cards
        flip(letter: letters[num], on: sender)
        
        if (sender.titleLabel == sender.titleLabel!)
        {
            // Show the whole string of letters
            displayLetters.text = letters[num]
            word += letters[num]
            displayLetters.text = word
        }

        
    }
    
    
    func flip(letter: String, on button: UIButton)
    {
        // If the its toched when is a letter then set it green
        if (button.currentTitle == letter)
        {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.4117647059, green: 0.9058823529, blue: 0.337254902, alpha: 1)
        }
        else
            // Else, set the letter and change color to white
        {
            button.setTitle(letter, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
    func reset()
    {
        // if this function is call, assign the letters to the cards and set them white.
        for index in 0 ... allCards.count - 1
        {
            allCards[index].setTitle(letters[index], for: UIControl.State.normal)
            allCards[index].backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            
        }
    }
    
    func Won(Number: Int)
    {
        if Number == 7
        {
            // If the user has found 7 words, show an alert saying that the game was won
            let Alert = UIAlertController(title: "Letter Sup", message: "You won the game", preferredStyle: .alert)
            Alert.addAction(UIAlertAction(title: "", style: .default, handler: nil))
            self.present(Alert, animated: true)
            remaining.invalidate()
        }
        
    }
    
    @objc func Timefunc()
    {
        // Timer
        time -= 1
        TimeLabel.text = ("Time: \(time)")
        // If user runs out of time, game is over
        if time == 0
        {
            remaining.invalidate()
            let Alert = UIAlertController(title: "letter Sup", message: "GAME OVER", preferredStyle: .alert)
            Alert.addAction(UIAlertAction(title: "", style: .default, handler: nil))
            self.present(Alert, animated: true)
            
        }
        
        
        
    }
    
        
    override func viewDidLoad() {
        remaining = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.Timefunc), userInfo: nil, repeats: true)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

