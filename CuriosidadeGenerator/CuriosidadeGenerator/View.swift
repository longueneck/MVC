import UIKit

class View: UIView {
    
    lazy var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 39/255, green: 50/255, blue: 64/255, alpha: 1)
        return view
    }()
    
    lazy var responseTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var generateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 113/255, green: 63/255, blue: 43/255, alpha: 1)
        button.setTitle("Gerar", for: .normal)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(tappedGenerate), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        setConstrints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedGenerate(){
        
    }
    
    func updateResponseText(text: String) {
        responseTextLabel.text = text
    }
    
    func addSubViews() {
        self.addSubview(self.backgroundView)
        self.addSubview(self.responseTextLabel)
        self.addSubview(self.generateButton)
    }
    
    func setConstrints(){
        NSLayoutConstraint.activate([
            
            backgroundView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            backgroundView.bottomAnchor.constraint(equalTo: generateButton.topAnchor, constant: -30 ),
            
            generateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            generateButton.heightAnchor.constraint(equalToConstant: 45),
            generateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            generateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20)
            
        ])
    }
    
    
}
