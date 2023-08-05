import UIKit

class ViewController: UIViewController {
    
    private var screen: View?
    private var service: Service = Service()
    
    override func loadView() {
        screen = View()
        screen?.backgroundColor = UIColor(red: 56/255, green: 72/255, blue: 92/255, alpha: 1)
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.generateButton.addTarget(self, action: #selector(tapToGenerate), for: .touchUpInside)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    @objc private func tapToGenerate() {
        print("Cliquei aqui")
        service.generateRecipe(message: String.finalPharse) { response, error in
            if let responseText = response {
                DispatchQueue.main.async {
                    let responseAPIText = responseText.choices.first?.message.content ?? ""
                
                    self.screen?.updateResponseText(text: responseAPIText)
                }
            }else{ 
                debugPrint(error ?? "")
            }
        }
    }
}


